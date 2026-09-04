local root_dir = require("jdtls.setup").find_root({
	"pom.xml",
	"build.gradle",
	"build.gradle.kts",
	"settings.gradle",
	"settings.gradle.kts",
	".git",
})
if not root_dir then
	return
end

local project_name = vim.fs.basename(root_dir)
local workspace_dir = vim.fs.joinpath(vim.fn.stdpath("cache"), "jdtls-workspace", project_name)

-- "*" carries the capabilities/on_attach set up in config/lsp.lua (keymaps,
-- folding range, blink.cmp's completion capabilities, ...). jdtls goes
-- through jdtls.start_or_attach -> vim.lsp.start, which bypasses the
-- vim.lsp.enable()/named-config merge, so pull the resolved defaults in by
-- hand rather than duplicating them here.
local default_config = vim.lsp.config["*"]

local mason_path = vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "packages", "jdtls")
local launcher_jar = vim.fn.glob(vim.fs.joinpath(mason_path, "plugins", "org.eclipse.equinox.launcher_*.jar"))
local os_config_dir = ({ Linux = "config_linux", Darwin = "config_mac", Windows_NT = "config_win" })[vim.uv.os_uname().sysname]
	or "config_linux"

-- Mason's own "jdtls" launcher script (bin/jdtls.py) has a bug: it calls
-- os.execvp(java_executable, exec_args) without putting the executable name
-- at exec_args[0], so the spawned process's argv[0] becomes a JVM flag
-- instead of "java". That breaks when `java` resolves through a mise shim
-- (mise dispatches by argv[0]/basename) - it fails with
-- "mise ERROR -Declipse.application=... is not a valid shim". Build the
-- invocation ourselves instead of going through that wrapper.
require("jdtls").start_or_attach({
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		launcher_jar,
		"-configuration",
		vim.fs.joinpath(mason_path, os_config_dir),
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,
	capabilities = default_config.capabilities,
	on_attach = default_config.on_attach,
	settings = {
		java = {
			-- Formatting is handled by google-java-format via conform (see
			-- plugin/conform.lua), matching the repo's Spotless config. Disable
			-- jdtls's own formatter so format-on-save's LSP fallback doesn't
			-- reformat with Eclipse's default style instead.
			format = { enabled = false },
		},
	},
})

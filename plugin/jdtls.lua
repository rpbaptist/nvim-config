vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-jdtls" },
}, { confirm = false })

-- Actual startup happens per-buffer in ftplugin/java.lua: jdtls needs a
-- unique -data workspace dir per project, which the static lsp/*.lua
-- convention (config/lsp.lua's vim.lsp.enable) can't express.

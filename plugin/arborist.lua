vim.pack.add({
	{ src = "https://github.com/arborist-ts/arborist.nvim" },
}, { confirm = false })

require("arborist").setup({
	prefer_wasm = false,
	update_cadence = "weekly",
	ensure_installed = {
		"eex",
		"elixir",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"heex",
		"jsdoc",
		"luadoc",
		"luap",
		"printf",
		"query",
		"sql",
		"git_config",
	},
})

vim.filetype.add({
	extension = { rasi = "rasi", rofi = "rasi", wofi = "rasi", livemd = "livebook" },
	filename = { ["vifmrc"] = "vim" },
	pattern = {
		[".*/kitty/.+%.conf"] = "kitty",
		["%.env%.[%w_.-]+"] = "sh",
	},
})

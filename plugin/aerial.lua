vim.pack.add({
	{ src = "https://github.com/stevearc/aerial.nvim" },
}, { confirm = false })

require("aerial").setup({
	attach_mode = "global",
	backends = { "lsp", "treesitter", "markdown", "man" },
	show_guides = true,
	layout = {
		resize_to_content = false,
		win_opts = {
			winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
			signcolumn = "yes",
			statuscolumn = " ",
		},
	},
	icons = {
		kinds = vim.g.custom_icons.kinds,
	},
	filter_kind = {
		"Class",
		"Constructor",
		"Enum",
		"Field",
		"Function",
		"Interface",
		"Method",
		"Module",
		"Namespace",
		"Package",
		"Property",
		"Struct",
		"Trait",
	},
  -- stylua: ignore
  guides = {
    mid_item   = "├╴",
    last_item  = "└╴",
    nested_top = "│ ",
    whitespace = "  ",
  },
})

vim.keymap.set("n", "<leader>cs", "<cmd>AerialToggle<cr>", { desc = "Aerial (Symbols)" })

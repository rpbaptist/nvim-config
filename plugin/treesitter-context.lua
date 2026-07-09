vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
}, { confirm = false })

pcall(function()
	require("treesitter-context").setup({
		mode = "cursor",
		max_lines = 3,
	})
end)

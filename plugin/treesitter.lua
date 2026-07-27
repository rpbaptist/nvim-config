vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
}, { confirm = false })

require("nvim-treesitter").install({
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
	"ruby",
	"sql",
	"git_config",
})

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- foldmethod/foldexpr are window-local: a window created independently of
-- the current one (picker, LSP jump, session restore, ...) starts at
-- Neovim's "manual" default and never inherits the vim.o assignment above.
-- Re-apply on every BufWinEnter so no window is left unfolded.
vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function()
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		if pcall(vim.treesitter.start) then
			vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

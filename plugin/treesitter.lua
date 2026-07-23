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
	"sql",
	"git_config",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		if pcall(vim.treesitter.start) then
			vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

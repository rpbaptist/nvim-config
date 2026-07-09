return {
	{
		"arborist-ts/arborist.nvim",
		lazy = false,
		config = function()
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
				filename = {
					["vifmrc"] = "vim",
				},
				pattern = {
					[".*/kitty/.+%.conf"] = "kitty",
					["%.env%.[%w_.-]+"] = "sh",
				},
			})
			vim.treesitter.language.register("bash", "kitty")
			vim.treesitter.language.register("markdown", "livebook")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			mode = "cursor",
			max_lines = 3,
		},
	},
}

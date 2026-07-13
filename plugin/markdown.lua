vim.pack.add({
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/iamcco/markdown-preview.nvim", name = "markdown-preview.nvim" },
}, { confirm = false })

require("utils.pack-build").on_build("markdown-preview.nvim", function()
	vim.cmd.packadd("markdown-preview.nvim")
	pcall(vim.fn["mkdp#util#install"])
end)

require("render-markdown").setup({
	code = {
		sign = true,
		width = "block",
		right_pad = 1,
	},
	heading = {
		sign = false,
		icons = {},
	},
	checkbox = { enabled = false },
})

pcall(function()
	Snacks.toggle({
		name = "Render Markdown",
		get = function()
			return require("render-markdown.state").enabled
		end,
		set = function(enabled)
			local m = require("render-markdown")
			if enabled then
				m.enable()
			else
				m.disable()
			end
		end,
	}):map("<leader>um")
end)

vim.keymap.set("n", "<leader>um", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview" })

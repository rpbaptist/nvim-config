vim.pack.add({
	{ src = "https://codeberg.org/cryptomilk/nvim-pack-ui" },
}, { confirm = false })

vim.keymap.set("n", "<leader>ps", "<cmd>Pack<cr>", { desc = "Pack UI" })

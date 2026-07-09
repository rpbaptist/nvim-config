vim.pack.add({
  { src = "https://github.com/tpope/vim-projectionist" },
}, { confirm = false })

vim.keymap.set("n", "<leader>tjj", "<cmd>A<cr>", { desc = "Open file in current window" })
vim.keymap.set("n", "<leader>tje", "<cmd>AS<cr>", { desc = "Open test file in hsplit" })
vim.keymap.set("n", "<leader>tji", "<cmd>AV<cr>", { desc = "Open test file in vsplit" })
vim.keymap.set("n", "<leader>tj<Tab>", "<cmd>AT<cr>", { desc = "Open test file in tab" })

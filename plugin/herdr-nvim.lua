vim.pack.add({
  { src = "https://github.com/ChmaraX/herdr-nvim" },
}, { confirm = false })

-- Default keymaps under <leader>a: ac comment, al list, as paste, aS submit, ai ref.
require("herdr-nvim").setup({})

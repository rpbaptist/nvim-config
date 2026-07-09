vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.diff" },
}, { confirm = false })

require("mini.diff").setup({})

vim.keymap.set("n", "<leader>gd", function()
  require("mini.diff").toggle_overlay()
end, { desc = "Toggle Diff Overlay" })

vim.pack.add({
  { src = "https://github.com/vieitesss/miniharp.nvim" },
}, { confirm = false })

require("miniharp").setup({})

vim.keymap.set("n", "<leader>mm", function()
  require("miniharp").toggle()
end, { desc = "Toggle Minimap" })

vim.keymap.set("n", "[m", function()
  require("miniharp").scroll_up()
end, { desc = "Minimap scroll up" })

vim.keymap.set("n", "]m", function()
  require("miniharp").scroll_down()
end, { desc = "Minimap scroll down" })

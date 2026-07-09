vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.move" },
}, { confirm = false })

require("mini.move").setup({
  mappings = {
    left = "<A-Left>",
    right = "<A-Right>",
    down = "<A-Down>",
    up = "<A-Up>",
    line_left = "<A-Left>",
    line_right = "<A-Right>",
    line_down = "<A-Down>",
    line_up = "<A-Up>",
  },
})

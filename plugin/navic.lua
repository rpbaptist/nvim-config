vim.pack.add({
  { src = "https://github.com/SmiteshP/nvim-navic" },
}, { confirm = false })

require("nvim-navic").setup({
  icons = vim.g.custom_icons.kinds,
  highlight = true,
  separator = " ",
  depth_limit = 5,
  depth_limit_indicator = "..",
})

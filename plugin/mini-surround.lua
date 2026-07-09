vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.surround" },
}, { confirm = false })

require("mini.surround").setup({
  mappings = {
    add = "gsa",
    delete = "gsd",
    find = "gsf",
    find_left = "gsF",
    highlight = "gsh",
    replace = "gsr",
    update_n_lines = "gsn",
    suffix_last = "l",
    suffix_next = "n",
  },
})

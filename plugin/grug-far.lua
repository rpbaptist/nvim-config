vim.pack.add({
  { src = "https://github.com/MagicDuck/grug-far.nvim" },
}, { confirm = false })

require("grug-far").setup({ headerMaxWidth = 80 })

vim.keymap.set({ "n", "v" }, "<leader>sr", function()
  require("grug-far").open({
    transient = true,
    prefills = {
      paths = vim.fn.expand("%"),
      search = vim.fn.expand("<cword>"),
    },
  })
end, { desc = "Search and replace" })

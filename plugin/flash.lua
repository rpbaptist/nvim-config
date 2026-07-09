vim.pack.add({
  { src = "https://github.com/folke/flash.nvim" },
}, { confirm = false })

require("flash").setup({
  search = { multi_window = false },
  jump = { nohlsearch = true },
  modes = {
    search = { enabled = false },
  },
})

-- stylua: ignore
vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
vim.keymap.set({ "n", "o", "x" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
vim.keymap.set("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
vim.keymap.set({ "n", "o", "x" }, "<c-space>", function()
  require("flash").treesitter({
    actions = {
      ["<c-space>"] = "next",
      ["<BS>"] = "prev",
    },
  })
end, { desc = "Treesitter Incremental Selection" })

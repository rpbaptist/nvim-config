vim.pack.add({
  { src = "https://github.com/jtprogru/pack-ui.nvim" },
}, { confirm = false })

pcall(function()
  require("pack_ui").setup({
    border = "rounded",
    title = " vim.pack ",
    auto_check = false,
    auto_update = false,
    keymaps = {
      prefix = "<leader>p",
      status = "s",
      update_all = "U",
    },
  })
end)

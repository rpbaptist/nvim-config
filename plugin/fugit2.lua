vim.pack.add({
  { src = "https://github.com/rpbaptist/nui.nvim", version = "fix-invalid-window-id" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/rpbaptist/fugit2.nvim", version = "fix-hide-input-stale-box" },
}, { confirm = false })

require("fugit2").setup({
  libgit2_path = "libgit2.so.1.9",
  show_patch = true,
})

vim.keymap.set("n", "<leader>gs", "<cmd>Fugit2<cr>", { desc = "Git status" })

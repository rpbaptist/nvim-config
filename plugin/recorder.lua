vim.pack.add({
  { src = "https://github.com/chrisgrieser/nvim-recorder" },
  { src = "https://github.com/folke/which-key.nvim" },
}, { confirm = false })

require("recorder").setup({
  lessNotifications = true,
  mapping = {
    startStopRecording = "<leader>rr",
    switchSlot = "<leader>rs",
    editMacro = "<leader>re",
    deleteAllMacros = "<leader>rd",
    yankMacro = "<leader>ry",
  },
})

require("which-key").add({
  { "<leader>rr", desc = "Start/stop recording" },
  { "<leader>rs", desc = "Switch slot" },
  { "<leader>re", desc = "Edit macro" },
  { "<leader>rd", desc = "Delete all macros" },
  { "<leader>ry", desc = "Yank macro" },
})

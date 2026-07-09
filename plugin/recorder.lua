vim.pack.add({
  { src = "https://github.com/chrisgrieser/nvim-recorder" },
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

vim.keymap.set("n", "<leader>rr", "", { desc = "Start/stop recording" })
vim.keymap.set("n", "<leader>rs", "", { desc = "Switch slot" })
vim.keymap.set("n", "<leader>re", "", { desc = "Edit macro" })
vim.keymap.set("n", "<leader>rd", "", { desc = "Delete all macros" })
vim.keymap.set("n", "<leader>ry", "", { desc = "Yank macro" })

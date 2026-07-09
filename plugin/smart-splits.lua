vim.pack.add({
  { src = "https://github.com/mrjones2014/smart-splits.nvim", name = "smart-splits.nvim" },
}, { confirm = false })

require("smart-splits").setup({
  at_edge = "stop",
  cursor_follows_swapped_bufs = true,
  kitty_password = "nvimwindows",
  multiplexer_integration = "kitty",
  resize_mode = {
    resize_keys = { "<Left>", "<Down>", "<Up>", "<Right>" },
  },
  log_level = "error",
})

local splits = require("smart-splits")

vim.keymap.set({ "n", "i", "v", "t" }, "<C-A-n>", splits.move_cursor_left, { desc = "Move left" })
vim.keymap.set({ "n", "i", "v", "t" }, "<C-A-i>", splits.move_cursor_right, { desc = "Move right" })
vim.keymap.set({ "n", "i", "v", "t" }, "<C-A-u>", splits.move_cursor_up, { desc = "Move up" })
vim.keymap.set({ "n", "i", "v", "t" }, "<C-A-e>", splits.move_cursor_down, { desc = "Move down" })

vim.keymap.set("n", "<A-S-n>", function() splits.resize_left(5) end, { desc = "Resize left" })
vim.keymap.set("n", "<A-S-i>", function() splits.resize_right(5) end, { desc = "Resize right" })
vim.keymap.set("n", "<A-S-u>", function() splits.resize_up(5) end, { desc = "Resize up" })
vim.keymap.set("n", "<A-S-e>", function() splits.resize_down(5) end, { desc = "Resize down" })

vim.keymap.set("n", "<C-A-S-n>", function() splits.swap_buf_left({ same_row = true }) end, { desc = "Swap left" })
vim.keymap.set("n", "<C-A-S-i>", function() splits.swap_buf_right({ same_row = true }) end, { desc = "Swap right" })
vim.keymap.set("n", "<C-A-S-u>", function() splits.swap_buf_up({ same_row = true }) end, { desc = "Swap up" })
vim.keymap.set("n", "<C-A-S-e>", function() splits.swap_buf_down({ same_row = true }) end, { desc = "Swap down" })

if splits.start_resize_mode then
  vim.keymap.set("n", "<A-S-r>", splits.start_resize_mode, { desc = "Resize mode" })
end

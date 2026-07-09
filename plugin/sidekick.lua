vim.pack.add({
  { src = "https://github.com/folke/sidekick.nvim" },
}, { confirm = false })

require("sidekick").setup({
  nes = { enabled = false },
  keys = {
    buffers = { "<c-b>", "buffers", mode = "nt", desc = "open buffer picker" },
    files = { "<c-f>", "files", mode = "nt", desc = "open file picker" },
    hide_n = { "q", "hide", mode = "n", desc = "hide the terminal window" },
    hide_ctrl_q = { "<c-q>", "hide", mode = "n", desc = "hide the terminal window" },
    hide_ctrl_dot = { "<c-.>", "hide", mode = "nt", desc = "hide the terminal window" },
    prompt = { "<c-p>", "prompt", mode = "t", desc = "insert prompt or context" },
    stopinsert = { "<c-q>", "stopinsert", mode = "t", desc = "enter normal mode" },
    nav_left = { "<c-a-n>", "nav_left", expr = true, desc = "navigate to the left window" },
    nav_down = { "<c-a-e>", "nav_down", expr = true, desc = "navigate to the below window" },
    nav_up = { "<c-a-u>", "nav_up", expr = true, desc = "navigate to the above window" },
    nav_right = { "<c-a-i>", "nav_right", expr = true, desc = "navigate to the right window" },
  },
})

vim.keymap.set({ "n", "t", "i", "x" }, "<c-.>", function()
  require("sidekick.cli").toggle()
end, { desc = "Sidekick Toggle" })

vim.keymap.set("n", "<leader>aa", function()
  require("sidekick.cli").toggle({ name = "claude", focus = true })
end, { desc = "Sidekick Toggle" })

vim.keymap.set("n", "<leader>ad", function()
  require("sidekick.cli").close()
end, { desc = "Detach a CLI Session" })

vim.keymap.set({ "x", "n" }, "<leader>as", function()
  require("sidekick.cli").send({ msg = "{this}" })
end, { desc = "Send This" })

vim.keymap.set("n", "<leader>af", function()
  require("sidekick.cli").send({ msg = "{file}" })
end, { desc = "Send File" })

vim.keymap.set("x", "<leader>av", function()
  require("sidekick.cli").send({ msg = "{selection}" })
end, { desc = "Send Visual Selection" })

vim.keymap.set({ "n", "x" }, "<leader>ap", function()
  require("sidekick.cli").prompt()
end, { desc = "Sidekick Select Prompt" })

vim.pack.add({
  { src = "https://github.com/folke/which-key.nvim" },
}, { confirm = false })

require("which-key").setup({
  preset = "classic",
  defaults = {},
  spec = {
    {
      mode = { "n", "v" },
      { "<leader>a", group = "AI" },
      { "<leader>g", group = "git" },
      { "<leader>tj", group = "Jump to test file" },
      { "<leader>r", group = "Macro recorder" },
      { "gs", group = "surround" },
      { "<leader><tab>", group = "tabs" },
      { "<leader>c", group = "code" },
      { "<leader>d", group = "debug" },
      { "<leader>dp", group = "profiler" },
      { "<leader>f", group = "file/find" },
      { "<leader>q", group = "quit/session" },
      { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
      { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
      { "[", group = "prev" },
      { "]", group = "next" },
      { "g", group = "goto" },
      { "z", group = "fold" },
      {
        "<leader>b",
        group = "buffer",
        expand = function()
          return require("which-key.extras").expand.buf()
        end,
      },
      {
        "<leader>w",
        group = "windows",
        proxy = "<c-w>",
        expand = function()
          return require("which-key.extras").expand.win()
        end,
      },
      { "gx", desc = "Open with system app" },
    },
    { "<BS>", desc = "Decrement Selection", mode = "x" },
    { "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
  },
})

vim.keymap.set("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer Keymaps (which-key)" })

vim.keymap.set("n", "<c-w><space>", function()
  require("which-key").show({ keys = "<c-w>", loop = true })
end, { desc = "Window Hydra Mode (which-key)" })

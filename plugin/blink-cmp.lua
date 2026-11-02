vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", name = "blink.cmp", version = vim.version.range("1.*") },
}, { confirm = false })

require("blink.cmp").setup({
  fuzzy = { implementation = "prefer_rust_with_warning" },
  snippets = { preset = "luasnip" },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    trigger = {
      prefetch_on_insert = true,
    },
    keyword = { range = "full" },
    list = {
      selection = {
        preselect = function()
          return not require("blink.cmp").snippet_active({ direction = 1 })
        end,
      },
    },
    accept = {
      auto_brackets = { enabled = true },
    },
    menu = {
      draw = { treesitter = { "lsp" } },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
    ghost_text = { enabled = true },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    per_filetype = {
      lua = {
        inherit_defaults = true,
        "lazydev",
      },
    },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },
  cmdline = {
    enabled = true,
    keymap = {
      ["<Tab>"] = { "show", "accept" },
      preset = "inherit",
    },
    completion = {
      list = { selection = { preselect = false } },
      menu = {
        auto_show = function()
          return vim.fn.getcmdtype() == ":"
        end,
      },
      ghost_text = { enabled = true },
    },
  },
  keymap = {
    preset = "super-tab",
    ["<Esc>"] = { "hide", "fallback" },
    ["<Tab>"] = {
      function(cmp)
        if cmp.snippet_active() then
          return cmp.accept()
        else
          return cmp.select_and_accept()
        end
      end,
      "snippet_forward",
      "fallback",
    },
  },
})

vim.pack.add({
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/rafamadriz/friendly-snippets", config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
  end },
}, { confirm = false })

require("luasnip").setup({})

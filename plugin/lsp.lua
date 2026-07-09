vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
}, { confirm = false })

require("mason").setup({
  ensure_installed = {
    "stylua",
    "shfmt",
    "markdownlint-cli2",
    "markdown-toc",
  },
})

require("mason-lspconfig").setup({
  ensure_installed = vim.g.lsps,
})

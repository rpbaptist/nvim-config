# nvim

Personal Neovim config, managed with [vim.pack](https://github.com/folke/vim.pack.nvim) (Neovim 0.11+ built-in `vim.pack`).

## Structure

- `init.lua` — entry point, loads `config.*` and sets the colorscheme
- `lua/config/` — core setup: options, keymap, autocmds, lsp, vim.pack config
- `plugin/` — one file per plugin spec, loaded by vim.pack
- `lsp/` — per-server LSP configs
- `lua/utils/` — helper functions used across config/plugins

Colorscheme: gruvbox.

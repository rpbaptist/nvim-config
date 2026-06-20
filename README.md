# nvim

Personal Neovim config, managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Structure

- `init.lua` — entry point, loads `config.*` and sets the colorscheme
- `lua/config/` — core setup: options, keymap, autocmds, lsp, lazy.nvim bootstrap
- `lua/plugins/` — one file per plugin spec, auto-loaded by lazy.nvim
- `lsp/` — per-server LSP configs
- `lua/utils/` — helper functions used across config/plugins

Colorscheme: gruvbox.

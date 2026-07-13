# nvim

Personal Neovim config, managed with Neovim's built-in `vim.pack` (requires Neovim 0.12+).

## Structure

- `init.lua` — entry point, loads `config.*` and sets the colorscheme
- `lua/config/` — core setup: options, keymap, autocmds, lsp, vim.pack config
- `plugin/` — one file per plugin spec, loaded by vim.pack
- `lsp/` — per-server LSP configs
- `lua/utils/` — helper functions used across config/plugins

Colorscheme: gruvbox.

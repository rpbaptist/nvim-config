vim.pack.add({
  { src = "https://github.com/ellisonleao/gruvbox.nvim" },
}, { confirm = false })

local P = require("config.gruvbox_palette")

-- Highlight overrides for the gruvbox colorscheme, dark and light combined.
-- Neutral ANSI colors (red #cc241d, green #98971a, yellow #d79921, blue
-- #458588, purple #b16286, aqua #689d6a, orange #d65d0e) are shared between
-- dark and light gruvbox, so entries built only from those (or otherwise
-- mode-independent) are written once as a flat table. Entries that
-- genuinely differ between modes carry `dark = {...}` / `light = {...}`
-- sub-tables, merged over any shared keys in the same entry (e.g. `bold`).
-- `resolve_overrides` below flattens this into what gruvbox.setup() wants.
local overrides_spec = {
  ["@function.elixir"] = { bold = false, dark = { fg = "#8ec07c" }, light = { fg = "#427b58" } },
  ["@function.call.elixir"] = { bold = false, dark = { fg = "#8ec07c" }, light = { fg = "#427b58" } },
  ["@number.elixir"] = { dark = { fg = "#fe8019" }, light = { fg = "#af3a03" } },
  ["@number.float.elixir"] = { dark = { fg = "#fe8019" }, light = { fg = "#af3a03" } },
  ["@punctuation.delimiter.elixir"] = { dark = { fg = "#d3869b" }, light = { fg = "#8f3f71" } },
  ["@punctuation.bracket.elixir"] = { dark = { fg = "#d3869b" }, light = { fg = "#8f3f71" } },
  ["@punctuation.special.elixir"] = { dark = { fg = "#d3869b" }, light = { fg = "#8f3f71" } },
  ["@module.elixir"] = { dark = { fg = "#fabd2f" }, light = { fg = "#b57614" } },
  gitcommitSummary = { dark = { fg = "#8ec07c" }, light = { fg = "#427b58" } },
  gitcommitBlank = { dark = { fg = "#8ec07c" }, light = { fg = "#427b58" } },
  GitSignsAdd = { dark = { fg = "#8ec07c" }, light = { fg = "#427b58" } },
  Fugit2Staged = { bold = true, dark = { fg = "#8ec07c" }, light = { fg = "#427b58" } },
  GitSignsChange = { fg = "#d79921" },
  GitSignsDelete = { dark = { fg = "#fb4934" }, light = { fg = "#9d0006" } },
  DiffAdd = { fg = "#fbf1c7", bg = "#98971a" },
  DiffChange = { dark = { fg = "#fabd2f" }, light = { fg = "#b57614" } },
  DiffDelete = { fg = "#fbf1c7", bg = "#cc241d" },
  DiffText = { dark = { fg = "#32302f", bg = "#fbf1c7" }, light = { fg = "#282828", bg = "#ebdbb2" } },
  FlashLabel = { dark = { fg = "#1d2021", bg = "#83a598" }, light = { fg = "#f9f5d7", bg = "#076678" } },
  WinBar = { dark = { fg = P.dark.fg1, bg = P.dark.bg2 }, light = { fg = P.light.fg1, bg = P.light.bg1 } },
  WinBarAqua = { fg = "#689d6a", dark = { bg = P.dark.bg2 }, light = { bg = P.light.bg1 } },
  WinBarBlue = { fg = "#458588", dark = { bg = P.dark.bg2 }, light = { bg = P.light.bg1 } },
  WinBarOrange = { fg = "#d65d0e", dark = { bg = P.dark.bg2 }, light = { bg = P.light.bg1 } },
  WinBarRed = { fg = "#cc241d", dark = { bg = P.dark.bg2 }, light = { bg = P.light.bg1 } },
  WinBarPurple = { fg = "#b16286", dark = { bg = P.dark.bg2 }, light = { bg = P.light.bg1 } },
  WinBarYellow = { fg = "#d79921", dark = { bg = P.dark.bg2 }, light = { bg = P.light.bg1 } },
  WinBarGreen = { dark = { fg = "#b8bb26", bg = P.dark.bg2 }, light = { fg = "#79740e", bg = P.light.bg1 } },
  NavicIconsPackage = { link = "WinBarAqua" },
  NavicText = {
    default = true,
    dark = { fg = "#d5c4a1", bg = P.dark.bg2 },
    light = { fg = "#504945", bg = P.light.bg1 },
  },
  NavicSeparator = { dark = { fg = "#38a598", bg = P.dark.bg2 }, light = { fg = "#427b58", bg = P.light.bg1 } },
  NavicIconsKey = { link = "WinBarAqua" },
  NavicIconsProperty = { link = "WinBarAqua" },
  NavicIconsFile = { link = "WinBarBlue" },
  NavicIconsMethod = { link = "WinBarBlue" },
  NavicIconsFunction = { link = "WinBarBlue" },
  NavicIconsNamespace = { link = "WinBarBlue" },
  NavicIconsConstructor = { link = "WinBarBlue" },
  NavicIconsString = { link = "WinBarGreen" },
  NavicIconsInterface = { link = "WinBarGreen" },
  NavicIconsNull = { link = "WinBarOrange" },
  NavicIconsModule = { link = "WinBarOrange" },
  NavicIconsNumber = { link = "WinBarOrange" },
  NavicIconsArray = { link = "WinBarOrange" },
  NavicIconsObject = { link = "WinBarOrange" },
  NavicIconsBoolean = { link = "WinBarOrange" },
  NavicIconsConstant = { link = "WinBarOrange" },
  NavicIconsEnum = { link = "WinBarPurple" },
  NavicIconsField = { link = "WinBarPurple" },
  NavicIconsStruct = { link = "WinBarPurple" },
  NavicIconsVariable = { link = "WinBarPurple" },
  NavicIconsOperator = { link = "WinBarRed" },
  NavicIconsTypeParameter = { link = "WinBarRed" },
  NavicIconsEvent = { link = "WinBarYellow" },
  NavicIconsClass = { link = "WinBarYellow" },
  NavicIconsEnumMember = { link = "WinBarYellow" },
  SidekickChat = { link = "Normal" },
  TabLine = { dark = { fg = "#bdae93", bg = "#504945" }, light = { fg = "#504945", bg = "#d5c4a1" } },
  TabLineSel = { dark = { fg = "#fbf1c7", bg = "#504945" }, light = { fg = "#282828", bg = "#bdae93" } },
  TabLineFill = { dark = { bg = "#1d2021" }, light = { bg = "#f9f5d7" } },
  TabLineWin = { dark = { fg = "#a89984", bg = "#3c3836" }, light = { fg = "#7c6f64", bg = "#d5c4a1" } },
  RenderMarkdownH1Bg = { fg = "#fbf1c7", bg = "#79740e" },
  RenderMarkdownH3Bg = { fg = "#fbf1c7", bg = "#3e4934" },
  ["@markup.heading.1.markdown"] = { bg = "", bold = true, dark = { fg = "#fb4934" }, light = { fg = "#9d0006" } },
  ["@markup.heading.2.markdown"] = { bg = "", bold = true, dark = { fg = "#fabd2f" }, light = { fg = "#b57614" } },
  ["@markup.heading.3.markdown"] = { bg = "", bold = true, dark = { fg = "#b8bb26" }, light = { fg = "#79740e" } },
  ["@markup.heading.4.markdown"] = { bg = "", bold = true, dark = { fg = "#8ec07c" }, light = { fg = "#427b58" } },
  ["@markup.heading.5.markdown"] = { bg = "", bold = true, dark = { fg = "#83a598" }, light = { fg = "#076678" } },
  ["@markup.heading.6.markdown"] = { bg = "", bold = true, dark = { fg = "#d3869b" }, light = { fg = "#8f3f71" } },
}

---Flattens overrides_spec into the plain {group = {fg=..., bg=...}} table
---gruvbox.setup() expects, picking each entry's dark or light sub-table.
---@param spec table
---@param light boolean
local function resolve_overrides(spec, light)
  local out = {}
  for group, entry in pairs(spec) do
    local hl = {}
    for k, v in pairs(entry) do
      if k ~= "dark" and k ~= "light" then
        hl[k] = v
      end
    end
    for k, v in pairs((light and entry.light or entry.dark) or {}) do
      hl[k] = v
    end
    out[group] = hl
  end
  return out
end

-- Both dark (bg0_hard #1d2021) and light (bg0_hard #f9f5d7) use hard
-- contrast, matching the omarchy/kitty gruvbox and gruvbox-light themes.
local function apply_gruvbox()
  local light = vim.o.background == "light"
  require("gruvbox").setup({
    contrast = "hard",
    overrides = resolve_overrides(overrides_spec, light),
    -- gruvbox.nvim's "gray" (Comment, FoldColumn, Folded, markdownLinkText,
    -- etc.) is a single fixed #928374 shared by both modes: ~4.5:1 contrast
    -- against dark's #1d2021 but only ~3.3:1 against light-hard's #f9f5d7,
    -- so comments read as washed out in light mode. Darken it for light only.
    -- "dark1" feeds Normal's fg (and other default-text-tier groups) in
    -- light mode; darken it to gruvbox's own darkest shade, dark0_hard
    -- #1d2021 (normally dark mode's bg0_hard), for max contrast on prose
    -- (markdown body text included), per user preference.
    palette_overrides = light and { gray = P.light.gray, dark1 = P.light.fg1 } or {},
  })
  vim.cmd([[colorscheme gruvbox]])
end

apply_gruvbox()

local function light_mode_active()
  return vim.uv.fs_stat(vim.fn.expand("~/.config/omarchy/current/theme/light.mode")) ~= nil
end

vim.api.nvim_create_user_command("ToggleBackground", function()
  vim.o.background = vim.o.background == "light" and "dark" or "light"
  apply_gruvbox()
end, {})

-- Re-derives background from the omarchy theme's light.mode marker (rather
-- than blindly flipping) so the omarchy-toggle-theme-mode hook can push a
-- live update to already-open sessions via `nvim --server ... --remote-send`.
vim.api.nvim_create_user_command("SyncBackground", function()
  vim.o.background = light_mode_active() and "light" or "dark"
  apply_gruvbox()
end, {})

vim.keymap.set("n", "<leader>ub", "<cmd>ToggleBackground<cr>", { desc = "Toggle light/dark background" })

-- Register this instance's RPC address so the theme-set hook can find it.
local registry = vim.fn.stdpath("state") .. "/theme-sync-servers"
vim.fn.mkdir(vim.fn.stdpath("state"), "p")
vim.fn.writefile({ vim.v.servername }, registry, "a")

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    if vim.fn.filereadable(registry) == 0 then
      return
    end
    local lines = vim.tbl_filter(function(l)
      return l ~= vim.v.servername
    end, vim.fn.readfile(registry))
    vim.fn.writefile(lines, registry)
  end,
})

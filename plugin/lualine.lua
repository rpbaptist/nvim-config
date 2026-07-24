vim.pack.add({
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
}, { confirm = false })

local recording_status = function()
  local ok, recorder = pcall(require, "recorder")
  return ok and recorder.recordingStatus()
end

local recorder_display_slots = function()
  local ok, recorder = pcall(require, "recorder")
  return ok and recorder.displaySlots()
end

local icons = vim.g.custom_icons.modified

local P = require("config.gruvbox_palette")

-- WinBar colors are hardcoded here (rather than referencing the WinBar/
-- WinBarAqua highlight groups from plugin/gruvbox.lua) because lualine bakes
-- winbar colors into its config table at setup() time instead of resolving
-- highlight groups per-render like tabby.nvim does. So this must be
-- explicitly re-run on ColorScheme to follow the light/dark toggle. Reads
-- from the shared palette module so these can't drift out of sync with
-- gruvbox.lua's WinBar overrides.
local function winbar_bg()
  return vim.o.background == "light" and P.light.bg1 or P.dark.bg2
end

local function winbar_fg(active)
  local light = vim.o.background == "light"
  if active then
    return light and P.light.fg1 or P.dark.fg1
  end
  return light and P.light.fg4 or P.dark.fg3
end

local function setup_lualine()
  local bg = winbar_bg()
  local fg_active = winbar_fg(true)
  local fg_inactive = winbar_fg(false)
  require("lualine").setup({
    options = {
      disabled_filetypes = {
        statusline = { "snacks_dashboard" },
        winbar = { "snacks_dashboard" },
      },
    },
    sections = {
      lualine_c = {
        { "filename", path = 1 },
      },
      lualine_x = {
        "searchcount",
        "selectioncount",
        {
          "diff",
          symbols = icons,
          source = function()
            local minidiff_data = require("mini.diff").get_buf_data(0)
            if minidiff_data and minidiff_data["overlay"] then
              local summary = vim.b.minidiff_summary
              return summary and {
                added = summary.add,
                modified = summary.change,
                removed = summary.delete,
              }
            end
          end,
        },
        { recorder_display_slots },
        { recording_status },
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    winbar = {
      lualine_c = {
        {
          "filetype",
          icon_only = true,
          separator = "",
          icon = { align = "left" },
          color = { bg = bg },
          padding = { left = 2, right = 1 },
        },
        {
          "filename",
          color = { fg = fg_active, bg = bg },
          separator = "",
          symbols = icons,
        },
        "navic",
      },
    },
    inactive_winbar = {
      lualine_c = {
        {
          "filetype",
          icon_only = true,
          separator = "",
          icon = { align = "left" },
          color = { bg = bg },
          padding = { left = 2, right = 1 },
        },
        {
          "filename",
          color = { fg = fg_inactive, bg = bg },
          separator = "",
          symbols = icons,
        },
      },
    },
  })
end

setup_lualine()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = setup_lualine,
})

-- Shared gruvbox dark/light hex values referenced by more than one
-- plugin/*.lua config (plugin/gruvbox.lua, plugin/lualine.lua), so those
-- files can't drift out of sync with each other.
return {
  dark = { bg2 = "#32302f", fg1 = "#ebdbb2", fg3 = "#bdae93", gray = "#928374" },
  light = { bg1 = "#ebdbb2", fg1 = "#282828", fg4 = "#7c6f64", gray = "#665c54" },
}

local luarocks_path = vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1"
package.path = package.path .. ";" .. luarocks_path .. "/init.lua"
package.path = package.path .. ";" .. luarocks_path .. "/?.lua"

vim.pack.add({
  { src = "https://github.com/3rd/image.nvim" },
}, { confirm = false })

require("image").setup()

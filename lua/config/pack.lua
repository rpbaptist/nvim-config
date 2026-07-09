vim.g.loaded_gzip = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tohtml = 1
vim.g.loaded_tutor = 1
vim.g.loaded_zipPlugin = 1

local pack_build = vim.api.nvim_create_augroup("PackBuild", { clear = true })

vim.api.nvim_create_autocmd("PackChanged", {
  group = pack_build,
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= "install" and kind ~= "update" then
      return
    end
    local path = ev.data.path
    if name == "blink.cmp" then
      vim.fn.system({ "cargo", "build", "--release" }, { cwd = path })
    elseif name == "smart-splits.nvim" then
      vim.fn.system({ "./kitty/install-kittens.bash" }, { cwd = path })
    elseif name == "markdown-preview.nvim" then
      vim.cmd.packadd("markdown-preview.nvim")
      pcall(vim.fn["mkdp#util#install"])
    elseif name == "image.nvim" then
      pcall(vim.fn.system, { "luarocks", "--local", "--lua-version=5.1", "install", "magick" })
    end
  end,
})



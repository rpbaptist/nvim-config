local M = {}

function M.on_build(name, callback)
  local group = vim.api.nvim_create_augroup("PackBuild", { clear = false })
  vim.api.nvim_create_autocmd("PackChanged", {
    group = group,
    callback = function(ev)
      if ev.data.spec.name ~= name then return end
      if ev.data.kind ~= "install" and ev.data.kind ~= "update" then return end
      callback(ev.data.path)
    end,
  })
end

return M

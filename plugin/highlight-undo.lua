vim.pack.add({
  { src = "https://github.com/tzachar/highlight-undo.nvim" },
}, { confirm = false })

-- highlight-undo.nvim schedules vim.hl.range() for a bufnr that can be gone
-- by the time the callback runs (e.g. buffer closed/replaced before the
-- deferred highlight fires), causing "Invalid buffer id" errors.
do
  local hl = vim.hl or vim.highlight
  local range = hl.range
  hl.range = function(bufnr, ...)
    if not vim.api.nvim_buf_is_valid(bufnr) then
      return
    end
    return range(bufnr, ...)
  end
end

require("highlight-undo").setup({})

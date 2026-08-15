vim.g.loaded_gzip = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tohtml = 1
vim.g.loaded_tutor = 1
vim.g.loaded_zipPlugin = 1

vim.api.nvim_create_augroup("PackBuild", { clear = true })

-- After an update finishes (vim.pack's confirm buffer applies changes and
-- closes itself), open the changelog so it doesn't just vanish back to
-- whatever was underneath. Debounced since PackChanged fires once per
-- plugin and updates land in a batch.
do
	local log_path = vim.fs.joinpath(vim.fn.stdpath("log"), "nvim-pack.log")
	local timer

	vim.api.nvim_create_autocmd("PackChanged", {
		group = vim.api.nvim_create_augroup("PackUpdateLog", { clear = true }),
		callback = function(ev)
			if ev.data.kind ~= "update" then
				return
			end
			if timer then
				timer:stop()
				timer:close()
			end
			timer = vim.defer_fn(function()
				timer = nil
				if vim.uv.fs_stat(log_path) then
					vim.cmd.edit(log_path)
				end
			end, 300)
		end,
	})
end



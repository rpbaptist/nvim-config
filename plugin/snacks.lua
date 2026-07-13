vim.pack.add({
	{ src = "https://github.com/folke/snacks.nvim" },
}, { confirm = false })

require("snacks").setup({
	bigfile = { enabled = true },
	quickfile = { enabled = true },
	input = { enabled = true },
	indent = {
		indent = { hl = "GruvboxBg1" },
		scope = { only_current = true, hl = "GruvboxBg3" },
	},
	notifier = {
		timeout = 5000,
		style = "compact",
		styles = {
			notification = {
				wo = {
					winblend = 5,
					wrap = true,
					conceallevel = 2,
					colorcolumn = "",
				},
			},
		},
	},
	scratch = {
		name = "Note",
		ft = "md",
		root = vim.env.NOTES_PATH,
		filekey = { cwd = false, branch = true },
		styles = { height = 50 },
	},
	scope = { enabled = true },
	scroll = {
		animate = { duration = { step = 15, total = 160 } },
	},
	rename = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	dashboard = {
		sections = {
			{ section = "header" },
			{ section = "keys", gap = 1, padding = 1 },
		},
		preset = {
			pick = "fzf-lua",
			header = [[
        ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
        ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
        ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
        ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
        ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
			keys = {
				{ icon = " ", key = "/", desc = "Find Text", action = ":lua Snacks.picker.grep()" },
				{ icon = "󰱽 ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
				{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
				{ icon = " ", key = "g", desc = "Git Status", action = ":Fugit2" },
				{
					icon = " ",
					key = "c",
					desc = "Config",
					action = function()
						Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
					end,
				},
				{ icon = "󱊍 ", key = "m", desc = "Mason", action = ":Mason" },
				{
					icon = " ",
					key = "s",
					desc = "Restore Session",
					action = function()
						pcall(require("persistence").load)
					end,
				},
				{ icon = "󰒲 ", key = "p", desc = "Packages", action = ":PackStatus" },
				{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
			},
		},
	},
	explorer = { enabled = true },
	picker = {
		ui_select = true,
		win = {
			input = {
				keys = {
					["<a-s>"] = { "flash", mode = { "n", "i" } },
					["s"] = { "flash" },
				},
			},
		},
		formatters = {
			file = { truncate = 150 },
		},
		actions = {
			flash = function(picker)
				require("flash").jump({
					pattern = "^",
					label = { after = { 0, 0 } },
					search = {
						mode = "search",
						exclude = {
							function(win)
								return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
							end,
						},
					},
					action = function(match)
						local idx = picker.list:row2idx(match.pos[1])
						picker.list:_move(idx, true, true)
					end,
				})
			end,
		},
		sources = {
			explorer = {
				jump = { close = true },
				layout = {
					preset = function()
						return vim.o.columns >= 120 and "default" or "vertical"
					end,
					preview = true,
				},
				win = {
					list = {
						keys = {
							["<BS>"] = "explorer_up",
							["<Right>"] = "confirm",
							["<Left>"] = "explorer_close",
							["a"] = "explorer_add",
							["d"] = "explorer_del",
							["r"] = "explorer_rename",
							["c"] = "explorer_copy",
							["m"] = "explorer_move",
							["P"] = "toggle_preview",
							["y"] = { "explorer_yank", mode = { "n", "x" } },
							["p"] = "explorer_paste",
							["u"] = "explorer_update",
							["<c-c>"] = "tcd",
							["<leader>/"] = "picker_grep",
							["<c-t>"] = "terminal",
							["."] = "explorer_focus",
							["I"] = "toggle_ignored",
							["H"] = "toggle_hidden",
							["Z"] = "explorer_close_all",
							["]g"] = "explorer_git_next",
							["[g"] = "explorer_git_prev",
							["]d"] = "explorer_diagnostic_next",
							["[d"] = "explorer_diagnostic_prev",
							["]w"] = "explorer_warn_next",
							["[w"] = "explorer_warn_prev",
							["]e"] = "explorer_error_next",
							["[e"] = "explorer_error_prev",
						},
					},
				},
			},
		},
	},
	toggle = { enabled = true },
})

vim.keymap.set("n", "<leader>.", function()
	Snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })

vim.keymap.set("n", "<leader>S", function()
	Snacks.scratch.select()
end, { desc = "Select Scratch Buffer" })

vim.keymap.set("n", "<leader>un", function()
	Snacks.notifier.hide()
end, { desc = "Dismiss All Notifications" })

vim.keymap.set({ "n", "v" }, "<leader>gY", function()
	Snacks.gitbrowse({
		open = function(url)
			vim.fn.setreg("+", url)
		end,
		notify = true,
	})
end, { desc = "Git Browse (copy)" })

vim.keymap.set({ "n", "v" }, "<leader>gB", function()
	Snacks.gitbrowse()
end, { desc = "Git Browse (open)" })

vim.keymap.set("n", "<leader>fD", function()
	local path = vim.fn.expand("%:.")
	vim.cmd(":! rm %")
	Snacks.bufdelete()
	vim.notify("Deleted " .. path)
end, { desc = "Delete file" })

vim.keymap.set("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })

vim.keymap.set("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })

vim.keymap.set("n", "<leader>cR", function()
	Snacks.rename.rename_file()
end, { desc = "Rename file" })

vim.keymap.set("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>fE", function()
	Snacks.explorer({ layout = { preset = "sidebar", preview = false } })
end, { desc = "Explorer (sidebar)" })

vim.keymap.set("n", "<leader>fe", function()
	Snacks.explorer()
end, { desc = "Explorer" })

vim.keymap.set("n", "<leader><space>", function()
	Snacks.picker.smart()
end, { desc = "Smart Find Files" })

vim.keymap.set("n", "<leader>n", function()
	Snacks.picker.notifications()
end, { desc = "Notification History" })

vim.keymap.set("n", "<leader>bl", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>/", function()
	Snacks.picker.grep()
end, { desc = "Grep (Root Dir)" })

vim.keymap.set("n", "<leader>:", function()
	Snacks.picker.command_history()
end, { desc = "Command History" })

vim.keymap.set("n", "<leader>D", function()
	Snacks.picker.spelling()
end, { desc = "Spell suggestions" })

vim.keymap.set("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>fB", function()
	Snacks.picker.buffers({ hidden = true, nofile = true })
end, { desc = "Buffers (all)" })

vim.keymap.set("n", "<leader>fc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })

vim.keymap.set("n", "<leader>fg", function()
	Snacks.picker.git_files()
end, { desc = "Find Files (git-files)" })

vim.keymap.set("n", "<leader>fr", function()
	Snacks.picker.recent()
end, { desc = "Recent" })

vim.keymap.set("n", "<leader>fR", function()
	Snacks.picker.recent({ filter = { cwd = true } })
end, { desc = "Recent (cwd)" })

vim.keymap.set("n", "<leader>gc", function()
	Snacks.picker.git_branches({ preview = false })
end, { desc = "Git branches" })

vim.keymap.set("n", "<leader>gl", function()
	Snacks.picker.git_log_line()
end, { desc = "Git log line" })

vim.keymap.set("n", "<leader>gf", function()
	Snacks.picker.git_status()
end, { desc = "Git file status" })

vim.keymap.set("n", "<leader>gh", function()
	Snacks.picker.git_diff()
end, { desc = "Git hunks" })

vim.keymap.set("n", "<leader>gS", function()
	Snacks.picker.git_stash()
end, { desc = "Git Stash" })

vim.keymap.set("n", "<leader>sb", function()
	Snacks.picker.lines()
end, { desc = "Buffer Lines" })

vim.keymap.set("n", "<leader>sB", function()
	Snacks.picker.grep_buffers()
end, { desc = "Grep Open Buffers" })

vim.keymap.set("n", "<leader>sg", function()
	Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set({ "n", "x" }, "<leader>sw", function()
	Snacks.picker.grep_word()
end, { desc = "Visual selection or word (Root Dir)" })

vim.keymap.set("n", '<leader>s"', function()
	Snacks.picker.registers()
end, { desc = "Registers" })

vim.keymap.set("n", "<leader>s/", function()
	Snacks.picker.search_history()
end, { desc = "Search History" })

vim.keymap.set("n", "<leader>sa", function()
	Snacks.picker.autocmds()
end, { desc = "Autocmds" })

vim.keymap.set("n", "<leader>sc", function()
	Snacks.picker.command_history()
end, { desc = "Command History" })

vim.keymap.set("n", "<leader>sC", function()
	Snacks.picker.commands()
end, { desc = "Commands" })

vim.keymap.set("n", "<leader>sd", function()
	Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })

vim.keymap.set("n", "<leader>sD", function()
	Snacks.picker.diagnostics_buffer()
end, { desc = "Buffer Diagnostics" })

vim.keymap.set("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "Help Pages" })

vim.keymap.set("n", "<leader>sH", function()
	Snacks.picker.highlights()
end, { desc = "Highlights" })

vim.keymap.set("n", "<leader>si", function()
	Snacks.picker.icons()
end, { desc = "Icons" })

vim.keymap.set("n", "<leader>sj", function()
	Snacks.picker.jumps()
end, { desc = "Jumps" })

vim.keymap.set("n", "<leader>sk", function()
	Snacks.picker.keymaps()
end, { desc = "Keymaps" })

vim.keymap.set("n", "<leader>sl", function()
	Snacks.picker.loclist()
end, { desc = "Location List" })

vim.keymap.set("n", "<leader>sM", function()
	Snacks.picker.man()
end, { desc = "Man Pages" })

vim.keymap.set("n", "<leader>sm", function()
	Snacks.picker.marks()
end, { desc = "Marks" })

vim.keymap.set("n", "<leader>sR", function()
	Snacks.picker.resume()
end, { desc = "Resume" })

vim.keymap.set("n", "<leader>sq", function()
	Snacks.picker.qflist()
end, { desc = "Quickfix List" })

vim.keymap.set("n", "<leader>su", function()
	Snacks.picker.undo()
end, { desc = "Undotree" })

vim.keymap.set("n", "<leader>uC", function()
	Snacks.picker.colorschemes()
end, { desc = "Colorschemes" })

vim.keymap.set("n", "<leader>uf", function()
	Snacks.toggle("format")
end, { desc = "Toggle Format" })
Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
if vim.lsp.inlay_hint then
	Snacks.toggle.inlay_hints():map("<leader>uh")
end

local del_augroup = vim.api.nvim_del_augroup_by_id
vim.api.nvim_del_augroup_by_id = function(group)
	pcall(del_augroup, group)
end

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argc() == 0 then
			require("snacks").dashboard()
		end
	end,
	once = true,
})

-- Workaround: Snacks picker throttles preview updates by 60ms
-- (lua/snacks/util/init.lua M.throttle, used in picker.lua's
-- _throttled_preview). Navigating the list and confirming a selection
-- within that window lets the trailing throttled call fire after the
-- picker has already closed: it recreates the preview as a fresh
-- full-editor floating window holding the real (already-listed) target
-- buffer, instead of that buffer landing in the normal split like it
-- should. Nothing ever closes this float, so it sits on top of the real
-- window and swallows the whole UI (upstream race condition, still
-- present as of snacks.nvim 882c996). Repair it: when we land in a
-- floating window that covers the whole editor while a normal split
-- exists underneath, move its buffer into that split and close the float.
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
	group = vim.api.nvim_create_augroup("snacks_picker_preview_cleanup", { clear = true }),
	callback = function()
		vim.schedule(function()
			local win = vim.api.nvim_get_current_win()
			if not vim.api.nvim_win_is_valid(win) then
				return
			end
			local cfg = vim.api.nvim_win_get_config(win)
			if cfg.relative == "" or cfg.width ~= vim.o.columns or cfg.height ~= vim.o.lines then
				return
			end
			local buf = vim.api.nvim_win_get_buf(win)
			if vim.bo[buf].buftype ~= "" or not vim.bo[buf].buflisted then
				return
			end
			local target
			for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
				if w ~= win and vim.api.nvim_win_get_config(w).relative == "" then
					target = w
					break
				end
			end
			if not target then
				return
			end
			vim.api.nvim_win_set_buf(target, buf)
			vim.api.nvim_win_close(win, true)
			vim.api.nvim_set_current_win(target)
		end)
	end,
})

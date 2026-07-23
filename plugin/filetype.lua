vim.filetype.add({
	extension = { rasi = "rasi", rofi = "rasi", wofi = "rasi", livemd = "livebook" },
	filename = { ["vifmrc"] = "vim" },
	pattern = {
		[".*/kitty/.+%.conf"] = "kitty",
		["%.env%.[%w_.-]+"] = "sh",
	},
})

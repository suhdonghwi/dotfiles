local wk = require("which-key")

wk.register({
	t = {
		name = "Telescope",
		f = { ":Telescope find_files<CR>", "Find Files" },
		g = { ":Telescope live_grep<CR>", "Live Grep" },
		b = { ":Telescope buffers<CR>", "Buffers" },
	},
}, { prefix = "<leader>" })

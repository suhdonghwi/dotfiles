local telescope = require("telescope")
local builtin = require("telescope.builtin")
local utils = require("telescope.utils")

local wk = require("which-key")

wk.register({
	t = {
		name = "Telescope",
		f = { ":Telescope find_files<CR>", "Find Files" },
		g = { ":Telescope live_grep<CR>", "Live Grep" },
		b = { ":Telescope buffers<CR>", "Buffers" },
		r = { ":Telescope resume<CR>", "Resume" },
	},
}, { prefix = "<leader>" })

telescope.load_extension("harpoon")

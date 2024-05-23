local telescope = require("telescope")
local builtin = require("telescope.builtin")
local utils = require("telescope.utils")

local wk = require("which-key")

wk.register({
	t = {
		name = "Telescope",
		f = { ":Telescope find_files<CR>", "Find Files" },
		g = { ":Telescope live_grep<CR>", "Live Grep" },
		s = { ":Telescope git_status<CR>", "Git Status" },
		b = { ":Telescope buffers<CR>", "Buffers" },
		r = { ":Telescope resume<CR>", "Resume" },
	},
}, { prefix = "<leader>" })

wk.register({
	d = {
		function()
			builtin.lsp_definitions({ jump_type = "never" })
		end,
		"Jump to Definition",
	},
	r = {
		function()
			builtin.lsp_references({ jump_type = "never" })
		end,
		"Jump to references",
	},
}, { prefix = "g" })

telescope.load_extension("ui-select")

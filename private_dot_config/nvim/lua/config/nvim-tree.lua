local wk = require("which-key")

wk.register({
	e = { ":NvimTreeToggle<CR>", "Toggle file explorer" },
}, { prefix = "<leader>" })

-- empty setup using defaults
require("nvim-tree").setup({
	view = {
		width = 40,
	},
	update_focused_file = {
		enable = true,
	},
})

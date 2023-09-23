local wk = require("which-key")

wk.register({
	h = { ":Neotree toggle<CR>", "Toggle file explorer" },
}, { prefix = "<leader>" })

wk.register({
	h = {
		name = "Harpoon",
		a = { ':lua require("harpoon.mark").add_file()<CR>', "Mark file" },
		q = { ':lua require("harpoon.ui").toggle_quick_menu()<CR>', "Toggle quick menu" },
		t = { ":Telescope harpoon marks<CR>", "Toggle telescope menu" },
	},
}, { prefix = "<leader>" })

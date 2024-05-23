local wk = require("which-key")

wk.register({
	h = { ":Neotree toggle<CR>", "Toggle file explorer" },
}, { prefix = "<leader>" })

wk.register({
	h = {
		name = "Harpoon",
		a = {
			function()
				require("harpoon.mark").add_file()
			end,
			"Mark file",
		},
		q = {
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			"Toggle quick menu",
		},
		t = { ":Telescope harpoon marks<CR>", "Toggle telescope menu" },
	},
}, { prefix = "<leader>" })

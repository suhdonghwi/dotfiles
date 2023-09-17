local wk = require("which-key")

wk.register({
	h = { ":Neotree toggle<CR>", "Toggle file explorer" },
}, { prefix = "<leader>" })

wk.register({
	h = {
		name = "Harpoon",
		a = { ":lua require(\"harpoon.mark\").add_file()<CR>", "Mark file" },
		t = { ":Telescope harpoon marks<CR>", "Toggle telescope menu" },
	},
}, { prefix = "<leader>" })



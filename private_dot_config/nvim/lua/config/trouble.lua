local wk = require("which-key")

wk.register({
	d = { ":Trouble<CR>", "Open the trouble list" },
}, { prefix = "<leader>" })

require("trouble").setup({
	use_diagnostic_signs = true,
})

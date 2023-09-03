require("mini.ai").setup()
require("mini.comment").setup()
require("mini.surround").setup({
	mappings = {
		add = "za", -- Add surrounding in Normal and Visual modes
		delete = "zd", -- Delete surrounding
		find = "zf", -- Find surrounding (to the right)
		find_left = "zF", -- Find surrounding (to the left)
		highlight = "zh", -- Highlight surrounding
		replace = "zr", -- Replace surrounding
		update_n_lines = "zn", -- Update `n_lines`

		suffix_last = "l", -- Suffix to search with "prev" method
		suffix_next = "n", -- Suffix to search with "next" method
	},
})
require("mini.pairs").setup()

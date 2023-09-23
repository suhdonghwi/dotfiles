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

require("mini.animate").setup({
	cursor = { enable = false },
	resize = { enable = false },
	open = { enable = false },
	close = { enable = false },
})

vim.cmd([[ highlight MiniIndentscopeSymbol guifg=#6c7086 ]])

require("mini.indentscope").setup({
	draw = {
		delay = 50,
	},
	symbol = "│",
})

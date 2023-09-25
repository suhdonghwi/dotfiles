require("mini.ai").setup()

require("mini.comment").setup()

require("mini.surround").setup()

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

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
			direction = "float",

			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
		})
	end,
}

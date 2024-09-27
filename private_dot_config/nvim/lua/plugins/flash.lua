return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<C-f>",
			mode = { "n", "x", "o" },
			function()
				-- default options: exact mode, multi window, all directions, with a backdrop
				require("flash").jump()
			end,
		},
	},
	config = function()
		require("flash").setup({
			modes = {
				search = {
					enabled = false,
				},
			},
		})
	end,
}

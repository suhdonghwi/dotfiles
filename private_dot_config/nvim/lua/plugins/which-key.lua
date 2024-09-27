return {
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup({
			win = {
				border = "single",
				padding = { 2, 2, 2, 2 },
			},
			disable = { filetypes = { "TelescopePrompt" } },
		})
	end,
}

return {
	{ "folke/neodev.nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("../config/lsp")
		end,
		dependencies = {
			{
				"williamboman/mason.nvim",
				config = function()
					require("mason").setup({
						ui = {
							border = "rounded",
						},
					})
				end,
			},
			{
				"j-hui/fidget.nvim",
				config = function()
					require("fidget").setup({})
				end,
			},
			"onsails/lspkind.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("../config/cmp")
		end,

		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",

			-- Adds LSP completion capabilities
			"hrsh7th/cmp-nvim-lsp",

			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
	},
	{
		"nvimtools/none-ls.nvim",
	},
}

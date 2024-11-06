return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				typescriptreact = { "prettierd" },
				typescript = { "prettierd" },
				javascript = { "prettierd" },
				python = { "black" },
				lua = { "stylua" },
			},
		})
	end,
}

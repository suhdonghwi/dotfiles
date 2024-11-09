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
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		})
	end,
}

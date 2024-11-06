return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				typescriptreact = { "prettierd", "biome" },
        typescript = { "prettierd", "biome" },
        javascript = { "prettierd", "biome" },
        python = { "black" },
        lua = { "stylua" },
			},
		})
	end,
}

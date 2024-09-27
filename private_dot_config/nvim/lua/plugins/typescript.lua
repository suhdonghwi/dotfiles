return {
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"dmmulroy/tsc.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			local lspconfig = require("lspconfig")
			local util = lspconfig.util

			local root_path = util.find_git_ancestor(vim.fn.getcwd())
			local is_yarn_pnp = util.path.is_file(util.path.join(root_path, ".pnp.cjs"))

			local tsc_path = is_yarn_pnp and util.path.join(root_path, ".yarn/sdks/typescript/bin/tsc") or nil

			require("tsc").setup({
				bin_path = tsc_path,
			})
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
}

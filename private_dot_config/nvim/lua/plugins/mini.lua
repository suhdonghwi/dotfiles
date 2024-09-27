return {
	"echasnovski/mini.nvim",
	config = function()
		local spec_treesitter = require("mini.ai").gen_spec.treesitter
		require("mini.ai").setup({
			custom_textobjects = {
				t = spec_treesitter({ a = "@jsx_tag.outer", i = "@jsx_tag.inner" }),
				f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
			},
			-- search_method = "cover_or_prev",
		})

		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})

		require("mini.comment").setup({
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
				end,
			},
		})

		require("mini.surround").setup()

		require("mini.animate").setup({
			cursor = { enable = false },
			resize = { enable = false },
			open = { enable = false },
			close = { enable = false },
		})

		require("mini.splitjoin").setup({
			mappings = {
				toggle = "gs",
			},
		})
	end,
}

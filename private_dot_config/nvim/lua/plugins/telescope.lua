return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			local wk = require("which-key")

			wk.add({
				{
					"<leader>t",
					group = "Telescope",
				},
				{
					"<leader>tf",
					":Telescope find_files<CR>",
					desc = "Find Files",
				},
				{
					"<leader>tg",
					":Telescope live_grep<CR>",
					desc = "Live Grep",
				},
				{
					"<leader>ts",
					":Telescope git_status<CR>",
					desc = "Git Status",
				},
				{
					"<leader>tb",
					":Telescope buffers<CR>",
					desc = "Buffers",
				},
				{
					"<leader>tr",
					":Telescope resume<CR>",
					desc = "Resume",
				},
			})

			wk.add({
				{
					"gd",
					function()
						builtin.lsp_definitions({ jump_type = "never" })
					end,
					desc = "Jump to Definition",
				},
				{
					"gr",
					function()
						builtin.lsp_references({ jump_type = "never" })
					end,
					desc = "Jump to references",
				},
			})

			telescope.load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		-- dependencies = { "nvim-telescope/telescope.nvim" },
	},
}

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local wk = require("which-key")

		wk.add({
			{
				"<leader>e",
				":NvimTreeToggle<CR>",
				desc = "Toggle file explorer",
			},
		})

		-- empty setup using defaults
		require("nvim-tree").setup({
			view = {
				width = 40,
			},
			update_focused_file = {
				enable = true,
			},
		})
	end,
}

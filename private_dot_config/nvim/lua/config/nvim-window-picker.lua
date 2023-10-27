require("window-picker").setup({
	filter_rules = {
		include_current_win = false,
		autoselect_one = true,
		bo = {
			filetype = { "neo-tree", "neo-tree-popup" },
		},
	},
})

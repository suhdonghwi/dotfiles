local function close_neo_tree()
	require("neo-tree.sources.manager").close_all()
end

require("auto-session").setup({
	bypass_session_save_file_types = { "neo-tree" },
	pre_save_cmds = {
		close_neo_tree,
	},
})

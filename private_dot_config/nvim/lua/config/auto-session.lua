require("auto-session").setup({
	bypass_session_save_file_types = { "NvimTree" },
	pre_save_cmds = { "NvimTreeClose" },
})

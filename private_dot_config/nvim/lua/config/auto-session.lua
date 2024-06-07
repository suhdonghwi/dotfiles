require("auto-session").setup({
	bypass_session_save_file_types = { "NvimTree" },
	pre_save_cmds = {
	  "NvimTreeClose",
    "lua for _, view in ipairs(require('diffview.lib').views) do view:close() end"
	},
})

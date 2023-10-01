local wk = require("which-key")

wk.register({
	e = { ":Neotree toggle<CR>", "Toggle file explorer" },
}, { prefix = "<leader>" })

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
require("neo-tree").setup({
	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function()
				vim.cmd([[ setlocal relativenumber ]])
			end,
		},
	},
	filesystem = {
		follow_current_file = {
			enabled = true, -- This will find and focus the file in the active buffer every time the current file is changed while the tree is open.
			leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
		},
		use_libuv_file_watcher = true,
	},
	auto_clean_after_session_restore = true,
	default_component_configs = {
		icon = {
			folder_empty = "",
			folder_empty_open = "",
		},
		git_status = {
			symbols = {
				-- Change type
				added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted = "✖", -- this can only be used in the git_status source
				renamed = "󰁕", -- this can only be used in the git_status source
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "󰄱",
				staged = "",
				conflict = "",
			},
		},
	},
	document_symbols = {
		kinds = {
			File = { icon = "󰈙", hl = "Tag" },
			Namespace = { icon = "󰌗", hl = "Include" },
			Package = { icon = "󰏖", hl = "Label" },
			Class = { icon = "󰌗", hl = "Include" },
			Property = { icon = "󰆧", hl = "@property" },
			Enum = { icon = "󰒻", hl = "@number" },
			Function = { icon = "󰊕", hl = "Function" },
			String = { icon = "󰀬", hl = "String" },
			Number = { icon = "󰎠", hl = "Number" },
			Array = { icon = "󰅪", hl = "Type" },
			Object = { icon = "󰅩", hl = "Type" },
			Key = { icon = "󰌋", hl = "" },
			Struct = { icon = "󰌗", hl = "Type" },
			Operator = { icon = "󰆕", hl = "Operator" },
			TypeParameter = { icon = "󰊄", hl = "Type" },
			StaticMethod = { icon = "󰠄 ", hl = "Function" },
		},
	},
})

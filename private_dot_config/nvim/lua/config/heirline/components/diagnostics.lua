local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local Diagnostics = {
	condition = conditions.has_diagnostics,
	static = {
		error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
		warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
		info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
		hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,

		error_fg = utils.get_highlight("DiagnosticError").fg,
		warn_fg = utils.get_highlight("DiagnosticWarn").fg,
		info_fg = utils.get_highlight("DiagnosticInfo").fg,
		hint_fg = utils.get_highlight("DiagnosticHint").fg,
	},

	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,

	{
		provider = function(self)
			if self.errors > 0 then
				return table.concat({ self.error_icon, self.errors, " " })
			end
		end,
		hl = function(self)
			return { fg = self.error_fg }
		end,
	},

	{
		provider = function(self)
			if self.warnings > 0 then
				return table.concat({ self.warn_icon, self.warnings, " " })
			end
		end,
		hl = function(self)
			return { fg = self.warn_fg }
		end,
	},

	{
		provider = function(self)
			if self.info > 0 then
				return table.concat({ self.info_icon, self.info, " " })
			end
		end,
		hl = function(self)
			return { fg = self.info_fg }
		end,
	},

	{
		provider = function(self)
			if self.hints > 0 then
				return table.concat({ self.hint_icon, self.hints, " " })
			end
		end,
		hl = function(self)
			return { fg = self.hint_fg }
		end,
	},
}

return Diagnostics

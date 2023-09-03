local conditions = require("heirline.conditions")

local Space = require("config.heirline.components.space")

local GitIcon = {
	provider = "",
	hl = { fg = "orange" },
}

local Git = {
	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
	end,

	{
		provider = function(self)
			return self.status_dict.head
		end,
	},
}

return {
	condition = conditions.is_git_repo,
	GitIcon,
	Space,
	Git,
}

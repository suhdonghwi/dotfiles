local conditions = require("heirline.conditions")

local Space = require("config.heirline.components.space")
local Align = require("config.heirline.components.align")

local ViMode = require("config.heirline.components.vi_mode")
local FileNameBlock = require("config.heirline.components.file_info")
local Diagnostics = require("config.heirline.components.diagnostics")
local Git = require("config.heirline.components.git")
local Ruler = require("config.heirline.components.ruler")

local Sep = {
	hl = { fg = "surface0" },
	-- provider = '|'
	provider = "│",
}

return {
	hl = { fg = "text", bg = "mantle" },
	{
		Space,
		ViMode,
		Space,
	},
	{
		Sep,
		Space,
		FileNameBlock,
		Space,
	},
	{
		condition = conditions.has_diagnostics,

		flexible = true,
		{
			Sep,
			Space,
			Diagnostics,
		},
		{ provider = "" },
	},
	Align,
	{
		condition = conditions.is_git_repo,
		Space,
		Git,
		Space,
	},
	{
		Sep,
		Space,
		Ruler,
		Space,
	},
}

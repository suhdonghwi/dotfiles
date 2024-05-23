local conditions = require("heirline.conditions")

local Space = require("config.heirline.components.space")
local FileNameBlock = require("config.heirline.components.file_info")

return {
	condition = conditions.is_not_active,
	hl = { bg = "mantle" },
	Space,
	{
		hl = { fg = "surface2", force = true },
		FileNameBlock,
	},
}

local conditions = require("heirline.conditions")

local Space = require("config.heirline.components.space")
local FileNameBlock = require("config.heirline.components.file_info")

return {
	condition = conditions.is_not_active,
	hl = { fg = "surface2", bg = "mantle" },
	Space,
	FileNameBlock,
}

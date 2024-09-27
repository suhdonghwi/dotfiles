local Space = require("config.heirline.components.space")

local function get_short_cwd()
	return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
end

return {
	condition = function()
		return vim.bo.filetype == "neo-tree"
	end,

	hl = { fg = "surface2", bg = "mantle" },

	Space,
	{
		provider = get_short_cwd(),
	},
}

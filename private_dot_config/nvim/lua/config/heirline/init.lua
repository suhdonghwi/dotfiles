local heirline = require("heirline")
local conditions = require("heirline.conditions")

local colors = require("catppuccin.palettes").get_palette("mocha")
heirline.load_colors(colors)

local DefaultStatusLine = require("config.heirline.statuslines.default")
local NvimTreeStatusLine = require("config.heirline.statuslines.nvimtree")
local InactiveStatusLine = require("config.heirline.statuslines.inactive")

local mode_colors_map = {
	n = "blue",
	i = "green",
	v = "lavender",
	V = "lavender",
	["\22"] = "cyan",
	c = "orange",
	s = "lavender",
	S = "lavender",
	["\19"] = "purple",
	R = "orange",
	r = "orange",
	["!"] = "red",
	t = "green",
}

require("heirline").setup({
	statusline = {
		static = {
			mode_colors_map = mode_colors_map,
			mode_color = function(self)
				local mode = conditions.is_active() and vim.fn.mode() or "n"
				return self.mode_colors_map[mode]
			end,
		},
		fallthrough = false,
		NvimTreeStatusLine,
		InactiveStatusLine,
		DefaultStatusLine,
	},
})

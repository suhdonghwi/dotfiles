local utils = require("heirline.utils")
local devicons = require("nvim-web-devicons")

local FileNameBlock = {
	init = function(self)
		self.file_name = vim.api.nvim_buf_get_name(0)
		self.no_file = self.file_name == ""
	end,
}

local FileIcon = {
	init = function(self)
		local extension = vim.fn.fnamemodify(self.file_name, ":e")
		self.icon, self.icon_color = devicons.get_icon_color(self.file_name, extension, { default = true })
	end,

	provider = function(self)
		return self.icon and (self.icon .. " ")
	end,

	hl = function(self)
		return { fg = self.icon_color }
	end,
}

local FileName = {
	{
		provider = function(self)
			if self.no_file then
				return ""
			end

			local parent_name = vim.fn.fnamemodify(self.file_name, ":h:t")
			return parent_name .. "/"
		end,
		hl = { fg = "surface2" },
	},
	{
		provider = function(self)
			if self.no_file then
				return "[No Name]"
			end

			local file_name = vim.fn.fnamemodify(self.file_name, ":t")
			return file_name
		end,
		hl = function(self)
			return { fg = self.no_file and "surface2" or "text" }
		end,
	},
}

local FileFlags = {
	condition = function()
		return vim.bo.modified
	end,
	provider = " [+]",
	hl = { fg = "green" },
}

FileNameBlock = utils.insert(FileNameBlock, FileIcon, FileName, FileFlags)

return FileNameBlock

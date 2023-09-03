vim.cmd("language en_US")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Hybrid line number
vim.o.number = true
vim.o.relativenumber = true

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = "unnamedplus"

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true
vim.o.ignorecase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

vim.o.cmdheight = 1
vim.o.showmode = false

vim.o.backup = false
vim.o.writebackup = false

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Save undo history
vim.o.undolevels = 1000
vim.o.undofile = true

vim.o.termguicolors = true

vim.o.cursorline = true

vim.api.nvim_create_autocmd("InsertLeave", { command = "call jobstart('xkbswitch -s 0')" })

vim.diagnostic.config({
	virtual_text = {
		prefix = "▎", -- Could be '●', '▎', 'x'
	},
})

local diagnostic_sign = "󱓻"
local signs = {
	Error = diagnostic_sign,
	Warn = diagnostic_sign,
	Hint = diagnostic_sign,
	Info = diagnostic_sign,
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or "rounded"
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

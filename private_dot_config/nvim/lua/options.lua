vim.cmd("language en_US.UTF-8")

local o = vim.o
local opt = vim.opt
local g = vim.g

g.mapleader = " "

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Don't store backup while overwriting the file
o.backup = false
o.writebackup = false

-- Enable persistent undo history
o.undolevels = 1000
o.undofile = true

-- Enable mouse for all available modes
o.mouse = "a"
-- Mouse scrolling unit is a single line
o.mousescroll = "ver:1"

-- Enable all filetype plugins
vim.cmd("filetype plugin indent on")

-- Hybrid line number
o.number = true
o.relativenumber = true

-- Indent wrapped lines to match line start
o.breakindent = true

-- Highlight current line
o.cursorline = true

-- Horizontal splits will be below
o.splitbelow = true

-- Vertical splits will be to the right
o.splitright = true

-- Reduce scroll during window split
o.splitkeep = "screen"

-- Don't show mode in command line
o.showmode = false
-- Don't show cursor position in command line
o.ruler = false

-- Display long lines as just one line
o.wrap = false

-- Keep signcolumn on by default
o.signcolumn = "yes"

-- Don't show `~` outside of buffer
o.fillchars = "eob: "

-- Set completeopt to have a better completion experience
o.completeopt = "menuone,noinsert,noselect"

o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true

-- Case-insensitive searching UNLESS \C or capital in search
o.smartcase = true
o.ignorecase = true

-- Show search results while typing
o.incsearch = true

o.cmdheight = 1

-- Decrease update time
o.updatetime = 250
o.timeoutlen = 300

-- ???
o.termguicolors = true

-- Do not let cursor to be placed on blank space
o.virtualedit = "none"

-- Change input source to English when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", { command = "call jobstart('xkbswitch -s 0')" })

-- Diff fillchar
opt.fillchars:append({ diff = "╱" })

-- Set diagnostic virtual text prefix
vim.diagnostic.config({
	virtual_text = {
		prefix = "▎", -- Could be '●', '▎', 'x'
	},
})

-- Set diagnostic signs
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

-- Set LSP floating windows border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or "rounded"
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Format on save
-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format({async = true})]])
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	callback = function(args)
-- 		require("conform").format({
-- 		  bufnr = args.buf,
-- 		})
-- 	end,
-- })

-- Change cwd based on opening file path
vim.cmd([[
augroup cdpwd
    autocmd!
    autocmd VimEnter * cd %:p:h
augroup END
]])

-- Set gui font (for Neovide)
vim.cmd([[set guifont=Iosevka\ Nerd\ Font:h14]])
vim.g.neovide_scroll_animation_length = 1.0

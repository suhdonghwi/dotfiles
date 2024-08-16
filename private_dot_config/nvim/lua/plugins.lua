-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local function req(name)
	return function()
		require("config/" .. name)
	end
end

require("lazy").setup({
	ui = {
		border = "rounded",
	},

	spec = {
		-- Make dot repeat possible in third-party plugins
		"tpope/vim-repeat",

		{
			"neovim/nvim-lspconfig",
			config = req("nvim-lspconfig"),
			dependencies = {
				{
					"williamboman/mason.nvim",
					config = req("mason"),
				},
				-- "williamboman/mason-lspconfig.nvim",
				{
					"j-hui/fidget.nvim",
					config = req("fidget"),
				},
				"onsails/lspkind.nvim",
			},
		},

		{
			"hrsh7th/nvim-cmp",
			config = req("nvim-cmp"),

			dependencies = {
				-- Snippet Engine & its associated nvim-cmp source
				"hrsh7th/cmp-vsnip",
				"hrsh7th/vim-vsnip",

				-- Adds LSP completion capabilities
				"hrsh7th/cmp-nvim-lsp",

				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
			},
		},

		{
			"echasnovski/mini.nvim",
			config = req("mini"),
		},

		{
			"folke/which-key.nvim",
			config = req("which-key"),
		},

		{
			"lewis6991/gitsigns.nvim",
			config = req("gitsigns"),
		},

		{
			"tpope/vim-fugitive",
			config = req("fugitive"),
		},

		{
			"sindrets/diffview.nvim",
			config = req("diffview"),
		},

		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
			config = req("catppuccin"),
		},

		{
			"rebelot/heirline.nvim",
			config = req("heirline"),
		},

		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = req("nvim-treesitter"),
		},

		{
			"nvim-telescope/telescope.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = req("telescope"),
		},

		{
			"nvim-telescope/telescope-ui-select.nvim",
			dependencies = { "nvim-telescope/telescope.nvim" },
		},

		{ "nvimtools/none-ls.nvim" },

		{
			"scalameta/nvim-metals",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = req("nvim-metals"),
		},

		{
			"nvim-tree/nvim-tree.lua",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = req("nvim-tree"),
		},

		{
			"folke/flash.nvim",
			event = "VeryLazy",
			opts = {},
			keys = {
				{
					"<C-f>",
					mode = { "n", "x", "o" },
					function()
						-- default options: exact mode, multi window, all directions, with a backdrop
						require("flash").jump()
					end,
				},
			},
			config = req("flash"),
		},

		{
			"pmizio/typescript-tools.nvim",
			dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
			opts = {},
		},

		{
			"dmmulroy/tsc.nvim",
			config = req("tsc"),
		},

		{ "folke/neodev.nvim", opts = {} },

		{ "zbirenbaum/copilot.lua", config = req("copilot") },

		{
			"tzachar/local-highlight.nvim",
			config = req("local-highlight"),
		},

		{
			"rmagatti/auto-session",
			config = req("auto-session"),
		},

		{
			"JoosepAlviste/nvim-ts-context-commentstring",
		},

		{
			"akinsho/toggleterm.nvim",
			version = "*",
			config = req("toggleterm"),
		},
	},
})

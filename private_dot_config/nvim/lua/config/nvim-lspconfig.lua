-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("lsp-format").setup {}
require("neodev").setup({})

local wk = require("which-key")
local lspconfig = require("lspconfig")
local util = lspconfig.util
local null_ls = require("null-ls")

local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities =
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

wk.register({
	["<leader>"] = {
		function()
			vim.lsp.buf.hover()
		end,
		"Hover",
	},
	l = {
		name = "LSP", -- optional group name
		a = {
			function()
				vim.lsp.buf.code_action()
			end,
			"Code Action",
		},
		r = {
			function()
				vim.lsp.buf.rename()
			end,
			"Rename",
		},
		d = {
			function()
				vim.diagnostic.open_float()
			end,
			"Show line diagnostics",
		},
		f = {
			function()
				vim.lsp.buf.format()
				vim.api.nvim_command("write")
			end,
			"Format buffer",
		},
	},
}, { prefix = "<leader>" })

-- Python
local function get_python_path(workspace)
	-- Use activated virtualenv.
	if vim.env.VIRTUAL_ENV then
		return util.path.join(vim.env.VIRTUAL_ENV, "bin", "python")
	end

	-- Find and use virtualenv in workspace directory.
	local match = vim.fn.glob(util.path.join(workspace, "poetry.lock"))
	if match ~= "" then
		local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
		return util.path.join(venv, "bin", "python")
	end

	-- Fallback to system Python.
	-- return exepath('python3') or exepath('python') or 'python'
	return "python"
end

lspconfig.pyright.setup({
	settings = {
		python = {
			pythonPath = "ll",
			analysis = {
				typeCheckingMode = "strict",
			},
		},
	},
	before_init = function(_, config)
		config.settings.python.pythonPath = get_python_path(config.root_dir)
	end,
})

lspconfig.ruff_lsp.setup({
	init_options = {
		settings = {
			args = {},
		},
	},
})

-- Lua
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
			format = {
				enable = false,
			},
		},
	},
})

-- Rust
lspconfig.rust_analyzer.setup({})

-- Typescript
local root_path = util.find_git_ancestor(vim.fn.getcwd())
local is_yarn_pnp = util.path.is_file(util.path.join(root_path, ".pnp.cjs"))

local tsserver_path = is_yarn_pnp and util.path.join(root_path, ".yarn/sdks/typescript/lib/tsserver.js") or nil

require("typescript-tools").setup({
	settings = {
		tsserver_path = tsserver_path,
	},
	on_attach = function(client, bufnr)
		client.server_capabilities.document_formatting = false
	end,
})

-- null-ls
local command_resolver = require("null-ls.helpers.command_resolver")
null_ls.setup({
	sources = {
		-- Yarn PnP
		null_ls.builtins.diagnostics.eslint_d.with({
			command = "yarn",
			args = { "eslint", "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" },
			condition = function()
				return is_yarn_pnp
			end,
		}),

		null_ls.builtins.code_actions.eslint_d.with({
			command = "yarn",
			args = { "eslint", "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" },
			condition = function()
				return is_yarn_pnp
			end,
		}),

		null_ls.builtins.formatting.prettierd.with({
			dynamic_command = command_resolver.from_yarn_pnp(),
			condition = function()
				return is_yarn_pnp
			end,
		}),

		-- non Yarn PnP
		null_ls.builtins.diagnostics.eslint_d.with({
			condition = function()
				return not is_yarn_pnp
			end,
		}),
		null_ls.builtins.code_actions.eslint_d.with({
			condition = function()
				return not is_yarn_pnp
			end,
		}),
		null_ls.builtins.formatting.prettierd.with({
			condition = function()
				return not is_yarn_pnp
			end,
		}),

		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.ocamlformat,
		null_ls.builtins.formatting.stylua,
	},
  on_attach = require("lsp-format").on_attach
})

-- HTML
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup({
	capabilities = capabilities,
	init_options = {
		provideFormatter = false,
	},
})

-- C++
lspconfig.clangd.setup({})

-- OCaml
lspconfig.ocamllsp.setup({
	cmd = { "ocamllsp" },
})

-- LaTeX
lspconfig.texlab.setup({
	chktex = {
		onOpenAndSave = true,
	},
})

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({})

local wk = require("which-key")
local lspconfig = require("lspconfig")
local util = lspconfig.util
local null_ls = require("null-ls")

local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities =
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

local async_formatting = function()
	local bufnr = vim.api.nvim_get_current_buf()

	vim.lsp.buf_request(
		bufnr,
		"textDocument/formatting",
		vim.lsp.util.make_formatting_params({}),
		function(err, res, ctx)
			if err then
				local err_msg = type(err) == "string" and err or err.message
				-- you can modify the log message / level (or ignore it completely)
				vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
				return
			end

			-- don't apply results if buffer is unloaded or has been modified
			if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
				return
			end

			if res then
				local client = vim.lsp.get_client_by_id(ctx.client_id)
				vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
				vim.api.nvim_buf_call(bufnr, function()
					vim.cmd("silent noautocmd update")
				end)
			end
		end
	)
end

wk.add({
	{
		"<leader><leader>",
		function()
			vim.lsp.buf.hover()
		end,
		desc = "Hover",
	},
	{
		"<leader>l",
		group = "LSP",
	},
	{
		"<leader>la",
		function()
			vim.lsp.buf.code_action()
		end,
		desc = "Code Action",
	},
	{
		"<leader>lr",
		function()
			vim.lsp.buf.rename()
		end,
		desc = "Rename",
	},
	{
		"<leader>ld",
		function()
			vim.diagnostic.open_float()
		end,
		desc = "Show line diagnostics",
	},
	{
		"<leader>lf",
		function()
			async_formatting()
		end,
		desc = "Format buffer",
	},
	{
		"<leader>lo",
		":TSToolsOrganizeImports<CR>",
		desc = "Organize imports (TypeScript specific)",
	},
})

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
local is_biome = util.path.is_file(util.path.join(root_path, "biome.json"))

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
	debug = true,
	sources = {
		null_ls.builtins.formatting.prettierd.with({
			dynamic_command = is_yarn_pnp and command_resolver.from_yarn_pnp() or nil,
			condition = function()
				return not is_biome
			end,
		}),

		null_ls.builtins.formatting.biome.with({
			condition = function()
				return is_biome
			end,
		}),

		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.ocamlformat,
		null_ls.builtins.formatting.stylua,
	},
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

-- Biome or ESLint
if is_biome then
	lspconfig.biome.setup({})
else
	lspconfig.eslint.setup({
		settings = {
			nodePath = is_yarn_pnp and util.path.join(root_path, ".yarn/sdks") or nil,
		},
	})
end

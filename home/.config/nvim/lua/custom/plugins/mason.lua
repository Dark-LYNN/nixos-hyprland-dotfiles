return {
	-- Mason core - must load first
	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUninstall",
			"MasonUninstallAll",
			"MasonLog"
		},
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	-- Mason tool installer
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		event = "VeryLazy",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"eslint-lsp",
					"eslint_d",
					"goimports",
					"golangci-lint",
					"gopls",
					"isort",
					"jq-lsp",
					"jsonlint",
					"json-lsp",
					"lua-language-server",
					"ts_ls",
					"prettierd",
					"prettier",
					"rubocop",
					"sorbet",
					"shellcheck",
					"stylelint-lsp",
					"stylua",
					"yaml-language-server",
				},
				debounce_hours = 96,
				auto_update = false,
			})
		end,
	},

	-- Mason LSP Config - depends on mason.nvim
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig"
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")

			mason_lspconfig.setup({
				automatic_installation = true,
				ensure_installed = {
					"bashls",
					"cssls",
					"dockerls",
					"eslint",
					"html",
					"jsonls",
					"ts_ls",
					"lua_ls",
					"gopls",
					"ruby_lsp",
				},
			})

			-- Setup handlers
			mason_lspconfig.setup_handlers({
				-- Default handler for all LSPs
				function(server_name)
					lspconfig[server_name].setup({})
				end,

				-- Custom handler for bashls
				["bashls"] = function()
					lspconfig.bashls.setup({
						on_attach = function(client, bufnr)
							client.server_capabilities.documentHighlightProvider = false
						end,
					})
				end,
			})
		end,
	},

	-- LSP Config
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
	},
}

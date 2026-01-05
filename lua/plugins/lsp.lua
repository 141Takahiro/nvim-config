return {
	{
		"neovim/nvim-lspconfig",
		tag = "v0.1.8",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"lua_ls",
					"intelephense",
					"tsserver",
					"html",
					"cssls",
					"tailwindcss",
					"dockerls",
					"yamlls",
					"emmet_ls",
					"eslint",
				},
			})

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } }
					}
				}
			})

			lspconfig.bashls.setup({})
			lspconfig.intelephense.setup({})

			lspconfig.tsserver.setup({
				filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
			})

			lspconfig.html.setup({})
			lspconfig.cssls.setup({})
			lspconfig.tailwindcss.setup({})
			lspconfig.dockerls.setup({})

			lspconfig.yamlls.setup({
				settings = {
					yaml = {
						validate = true,
					},
				},
			})

			lspconfig.emmet_ls.setup({})
			lspconfig.eslint.setup({
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim-lsp" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		tag = "v1.30.0",
	},
}

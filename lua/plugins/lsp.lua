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
					"typos_lsp",
				},
			})

			local lspconfig = require("lspconfig")
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } }
					}
				}
			})

			lspconfig.bashls.setup({})
			lspconfig.intelephense.setup({
				capabilities = capabilities,
				settings = {
					intelephense = {
						stubs = {
							"apache", "bcmath", "bz2", "calendar", "Core", "ctype", "curl",
							"date",
							"dom", "exif", "fileinfo", "filter", "gd", "gettext", "hash",
							"iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring",
							"mcrypt",
							"mysql", "mysqli", "password", "pcntl", "pcre", "PDO",
							"pdo_mysql",
							"Phar", "readline", "recode", "Reflection", "regex", "session",
							"SimpleXML", "snmp", "soap", "sockets", "standard", "tokenizer",
							"xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "zip", "zlib",
							"laravel", "phpunit"
						},
						diagnostics = {
							enable = true,
						},
						files = {
							associations = { "*.php", "*.phtml", "*.blade.php" },
							maxSize = 5000000,
						},
					}
				}
			})

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
			lspconfig.typos_lsp.setup({
				init_options = {
					diagnosticSeverity = "Hint",
				}
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
				completion = {
					keyword_length = 1,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", priority = 1000 },
					{ name = "buffer",   priority = 500 },
					{ name = "path",     priority = 250 },
				}),
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		tag = "v1.30.0",
	},
}

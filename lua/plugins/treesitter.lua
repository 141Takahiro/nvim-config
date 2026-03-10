return {
	{
		"nvim-treesitter/nvim-treesitter",
		commit = "42fc28b",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			local ok, configs = pcall(require, "nvim-treesitter.configs")
			if not ok then return end

			configs.setup({
				ensure_installed = {
					"tsx",
					"html",
					"css",
					"json",
					"gitignore",
					"typescript",
					"javascript",
					"php",
					"lua",
					"sql",
					"yaml",
					"dockerfile",
					"regex",
					"bash",
					"markdown",
					"markdown_inline",
				},
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},
}

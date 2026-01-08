return {
	{
		"nvim-treesitter/nvim-treesitter",
		tag = "v0.9.2",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			local ok, configs = pcall(require, "nvim-treesitter.configs")
			if not ok then return end

			configs.setup({
				ensure_installed = {
					"tsx", "typescript", "javascript", "php", "lua", "vim", "sql", "yaml",
					"dockerfile"
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

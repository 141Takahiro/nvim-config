return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesitter-context").setup({
				enable = true,
				max_lines = 3,
				min_rows = 0,
				multiline_threshold = 20,
				trim_scope = 'outer',
				mode = 'cursor',
				separator = "─",
				zindex = 20,
			})
		end,
	},
}

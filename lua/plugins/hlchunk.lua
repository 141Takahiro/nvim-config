return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	ft = { "lua", "typescriptreact", "typescript", "javascript", "php", "blade" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
				use_treesitter = true,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = ">",
				},
				delay = 100,
				duration = 200,
			},
			indent = {
				enable = true,
				use_treesitter = true,
			},
			line_num = {
				enable = true,
				use_treesitter = true,
			},
			blank = {
				enable = false,
			},
		})
	end
}

return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require('kanagawa').setup({
			theme = "dragon", -- "wave", "dragon", "lotus" から選べる
			background = {
				dark = "wave",
				light = "lotus"
			},
			overrides = function(colors)
				local theme = colors.theme
				return {
					Normal = { bg = theme.ui.bg_m3 },
					NormalNC = { bg = theme.ui.bg_m1 },
					NvimTreeNormal = { bg = theme.ui.bg_m1, fg = theme.ui.fg_dim }, --NvimTreeだけ別の色設定
					SignColumn = { bg = "NONE" },
					LineNr = { bg = "NONE" },
				}
			end
		})
		vim.cmd("colorscheme kanagawa")
	end
}

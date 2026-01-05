return {
	"sindrets/diffview.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "Dvo", "Dvc", "Dvh" },

	config = function()
		require("diffview").setup({
			enhanced_diff_hl = true,
			view = {
				merge_tool = {
					layout = "diff3_horizontal",
					disable_diagnostics = true,
				},
			},
		})
		vim.api.nvim_create_user_command('Dvo', 'DiffviewOpen', {})
		vim.api.nvim_create_user_command('Dvc', 'DiffviewClose', {})
		vim.api.nvim_create_user_command('Dvh', 'DiffviewFileHistory %', {})
	end,
}

return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
	config = function()
		require("neogit").setup({
			integrations = { diffview = true }
		})
		vim.api.nvim_create_user_command('Ng', 'Neogit', {})
	end
}

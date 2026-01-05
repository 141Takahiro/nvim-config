return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30,
				side = "left",
			},
			filters = {
				dotfiles = false,
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 400,
			},
			renderer = {
				highlight_git = true,
				icons = {
					show = {
						git = true,
					},
				},
			},
		})

		vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })
	end,
}

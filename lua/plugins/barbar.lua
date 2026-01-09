return {
	'romgrk/barbar.nvim',
	dependencies = {
		'lewis6991/gitsigns.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	lazy = false,
	priority = 900,
	init = function()
		vim.g.barbar_auto_setup = 0
		vim.opt.showtabline = 2
	end,
	config = function()
		require("barbar").setup({
			animation = true,
			auto_hide = false,
			clickable = true,
			icons = {
				buffer_index = false,
				filetype = { enabled = true },
				inactive = { button = '×' },
			},
		})

		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		map('n', '<leader><Tab>', '<Cmd>BufferNext<CR>', opts)
		map('n', '<leader><S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
		map('n', '<leader>x', '<Cmd>BufferClose<CR>', opts)
	end,
}

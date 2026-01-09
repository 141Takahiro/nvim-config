return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('telescope').setup({})

		local builtin = require('telescope.builtin')
		local map = vim.keymap.set

		map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		map('n', '<leader>fg', builtin.git_files, { desc = 'Telescope git files' })
		map('n', '<leader>gr', builtin.live_grep, { desc = 'Telescope live grep' })
		map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
	end
}

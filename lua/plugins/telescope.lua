return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('telescope').setup({})

		local builtin = require('telescope.builtin')
		local map = vim.keymap.set

		map('n', '<leader>tff', builtin.find_files, { desc = 'Telescope find files' })
		map('n', '<leader>tgf', builtin.git_files, { desc = 'Telescope git files' })
		map('n', '<leader>tgr', builtin.live_grep, { desc = 'Telescope live grep' })
		map('n', '<leader>tb', builtin.buffers, { desc = 'Telescope buffers' })
	end
}

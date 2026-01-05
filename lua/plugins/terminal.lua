return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 15,
			open_mapping = [[<C-t>]],
			direction = 'horizontal',
			start_in_insert = false,
			persist_size = true,
		})

		local term_group = vim.api.nvim_create_augroup('TerminalConfig', { clear = true })

		vim.api.nvim_create_autocmd('TermOpen', {
			group = term_group,
			pattern = 'term://*',
			callback = function()
				local opts = { buffer = 0 }

				vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)

				vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
				vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
				vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
				vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts)
			end,
		})
	end,
}

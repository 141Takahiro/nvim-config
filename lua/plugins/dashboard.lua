return {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	config = function()
		require('dashboard').setup({
			theme = 'hyper', -- ほかにも 'doom' などが選べます
			config = {
				header = {
					"",
					"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
					"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
					"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
					"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
					"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
					"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
					"",
				},
				shortcut = {
					{ desc = '󰊄 最近のファイル', group = '@property', action = 'Telescope oldfiles', key = 'r' },
					{ desc = '󰱼 ファイル検索', group = 'Label', action = 'Telescope find_files', key = 'f' },
					{ desc = '󰃨  新規作成', group = 'Number', action = 'ene', key = 'n' },
					{ desc = '󰒲 プラグイン管理', group = 'DiagnosticHint', action = 'Lazy', key = 'l' },
					{ desc = '󰈆 終了', group = 'Error', action = 'qa', key = 'q' },
				},
			},
		})
	end,
	dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}

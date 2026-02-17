return {
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
		ft = { "markdown" },
		opts = {
			heading = {
				backgrounds = {
					'RenderMarkdownH1Bg',
					'RenderMarkdownH2Bg',
					'RenderMarkdownH3Bg',
				},
				icons = { ' [H1] ', ' [H2] ', ' [H3] ', ' [H4] ', ' [H5] ', ' [H6] ' },
				border_virtual = true,
			},
			bullet = {
				enabled = true,
				icons = { '●', '○', '◆', '◇' },
				left_pad = 0,
				right_pad = 1,
			},
			code = {
				sign = false,
				width = 'block',
				right_pad = 1,
			},
			checkbox = {
				enabled = true,
				unchecked = { icon = '󰄱 ' },
				checked = { icon = ' ' },
			},
			quote = {
				enabled = true,
				icon = '▋',
				highlight = 'RenderMarkdownQuote',
			},
			link = {
				enabled = true,
				image = '󰥶 ',
				email = '󰇰 ',
				hyperlink = ' ',
			},
		},
	},
}

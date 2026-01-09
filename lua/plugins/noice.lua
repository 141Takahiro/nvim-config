return {
	"folke/noice.nvim",
	lazy = false,
	priority = 1000,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		setup = {
			override = {
				["vim.opt.cmdheight"] = false,
			},
		},
		cmdheight = 1,
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.styled_parts"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = true,
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; before #" }
					},
				},
				opts = { skip = true },
			},
		},
	},
	config = function(_, opts)
		require("noice").setup(opts)
		vim.opt.cmdheight = 1
	end,
}

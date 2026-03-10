-- LSPの動作状態をアニメーションで表示
return {
	"j-hui/fidget.nvim",
	event = "LspAttach",
	opts = {
		notification = {
			window = {
				avoid = { "NvimTree" },
				winblend = 0,
			},
		},
	},
}

return {
	"stevearc/aerial.nvim",
	version = "v1.*",
	opts = {},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		require("aerial").setup({
			filter_kind = {
				"Class",
				"Constructor",
				"Enum",
				"Function",
				"Interface",
				"Module",
				"Method",
				"Struct",
				"Variable",
				"Field",
				"Constant",
			},
			layout = {
				max_width = { 40, 0.2 },
				min_width = 20,
			},
			backends = { "lsp", "treesitter", "markdown", "man" },
		})
		vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
	end
}

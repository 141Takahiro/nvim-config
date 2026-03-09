-- 括弧やタグを自動で入力する拡張
return {
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
			})
		end,
	}
}

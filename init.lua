vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8,ucs-bom,iso-2022-jp,euc-jp,cp932"
vim.opt.fileformat = "unix"
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.keymap.set('n', '<space>ge', vim.diagnostic.open_float)

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	end,
})


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local function open_new_terminal()
	local term_status, toggleterm_terminal = pcall(require, "toggleterm.terminal")
	if not term_status then return end

	local terminals = toggleterm_terminal.get_all()

	local max_id = 0
	for _, term in ipairs(terminals) do
		if term.id and type(term.id) == "number" then
			if term.id > max_id then
				max_id = term.id
			end
		end
	end

	local next_id = max_id + 1
	vim.cmd(next_id .. "ToggleTerm")
end

vim.keymap.set('n', '<leader>tn', open_new_terminal, { desc = "Open new terminal" })

require("lazy").setup("plugins")

if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then -- version違いを防止するおまじない
	vim.cmd([[set t_WS=]])
end
vim.opt.number = true                                                   -- 見出し番号を表示する
vim.opt.relativenumber = true                                           -- 総体番号を表示する
vim.opt.termguicolors = true                                            -- 24bitカラーで表示する
vim.opt.encoding = "utf-8"                                              -- 文字コードの指定
vim.opt.fileencoding = "utf-8"                                          -- 文字コードの指定
vim.opt.fileencodings = "utf-8,ucs-bom,iso-2022-jp,euc-jp,cp932"        -- 文字コードの指定
vim.opt.fileformat = "unix"                                             -- 改行コードの指定
vim.g.mapleader = "\\"                                                  -- leaderkeyを'\'に設定
vim.opt.clipboard = "unnamedplus"                                       -- neovimのキャッシュをclipboardと連携
vim.opt.cursorline = true                                               --編集行を強調
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>', { silent = true }) --Esc二回でハイライトOFF

-- 選択中のバッファの色を濃く
-- ただしNvimTreeは除く
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	callback = function()
		if vim.bo.filetype == "NvimTree" then
			vim.opt_local.winhighlight = ""
		else
			vim.opt_local.winhighlight = "NormalNC:NormalNC,SignColumn:Normal"
		end
	end,
})

-- error messageをフロートしつつヤンク
local function diagnostic_copy()
	vim.diagnostic.open_float()

	local diags = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
	if #diags > 0 then
		local messages = ""
		for _, d in ipairs(diags) do
			messages = messages .. d.message .. "\n"
		end
		vim.fn.setreg('+', messages)
		print("Diagnostic copied to clipboard!")
	end
end
vim.keymap.set('n', '<leader>ge', diagnostic_copy, { desc = 'Copy diagnostic to clipboard' })

-- formataを走らせる
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })

-- LSPのショートカット
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- gdで定義ジャンプ
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts) -- grで参照表示
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts) -- giでインターフェイス表示
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- Kで型表示
	end,
})

-- 新しいターミナルを開くための関数
-- \tnでターミナル追加
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

vim.g.nvim_ghost_autostop = 0 -- GhostTextの設定
vim.opt.hidden = true         -- 保存しなくても別ファイルを開ける

--Popを起動する
local function open_pop()
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_var(buf, "is_pop", true)
	local width = 45
	local height = 25

	local row = vim.o.lines - height - 3
	local col = vim.o.columns - width - 2

	local opts = {
		relative = 'editor',
		width = width,
		height = height,
		row = row,
		col = col,
		style = 'minimal',
		zindex = 50,
	}
	vim.api.nvim_open_win(buf, true, opts)
end
vim.api.nvim_create_user_command('POP', open_pop, {})

-- POPに移動する
vim.keymap.set('n', ';p', function()
	local current_buf = vim.api.nvim_get_current_buf()

	local success, is_pop = pcall(vim.api.nvim_buf_get_var, current_buf, "is_pop")
	if success and is_pop then
		vim.cmd("wincmd p")
		return
	end

	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local b = vim.api.nvim_win_get_buf(win)
		local ok, val = pcall(vim.api.nvim_buf_get_var, b, "is_pop")
		if ok and val then
			vim.api.nvim_set_current_win(win)
			return
		end
	end
	print("POPが見つかりません。")
end, { desc = "Jump to POP" })

-- lazy(プラグインマネージャーの導入)
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
require("lazy").setup("plugins")

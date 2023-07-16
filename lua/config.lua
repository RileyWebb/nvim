vim.cmd([[ syntax enable ]]) -- NVim syntax support
vim.cmd([[ set noshowmode ]])
--vim.cmd([[ set confirm ]])
vim.cmd([[ set guicursor+=a:Cursor/lCursor ]])

vim.opt.showmatch = true --
vim.opt.ignorecase = true
vim.opt.mouse = "a" -- Mouse support
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4 --
vim.opt.softtabstop = 4
vim.opt.expandtab = true --
vim.opt.autoindent = true -- Autoendent
vim.opt.number = true -- Show line numbers
vim.opt.termguicolors = true -- xterm-256colors support
vim.opt.clipboard = "unnamedplus"
vim.opt.wildmode = "longest,list"
vim.opt.ttyfast = true -- Enable faster scrolling
vim.opt.cursorline = true
vim.opt.whichwrap:append({ ["<"] = true, [">"] = true, ["["] = true, ["]"] = true })
--vim.g.terminal_emulator = "alacritty"

vim.wo.fillchars = "eob: " -- Remove Tildes

--filetype plugin indent on

-- Enter insert mode when switching to terminal
vim.api.nvim_create_autocmd("TermOpen", {
	command = "setlocal listchars= nonumber norelativenumber nocursorline",
})

-- Open file from last position
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		if
			not vim.fn.expand("%:p"):match(".git")
			and vim.fn.line("'\"") > 1
			and vim.fn.line("'\"") <= vim.fn.line("$")
		then
			vim.cmd("normal! g'\"")
			vim.cmd("normal zz")
		end
	end,
})

-- Enable spellchecking in markdown, text and gitcommit files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown", "text" },
	callback = function()
		vim.opt_local.spell = true
	end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.cmd([[autocmd TermOpen * startinsert]])
vim.cmd([[autocmd TermClose * stopinsert]])
vim.cmd([[autocmd BufWinEnter,WinEnter term://* startinsert]])

-- Mouse Menu
vim.cmd([[aunmenu PopUp.How-to\ disable\ mouse]])
vim.cmd([[aunmenu PopUp.-1-]])

-- Load and configure plugins
require("config/neotree")
require("config/lualine")
require("config/telescope")
require("config/lsp")
require("config/cmp")
require("config/trouble")
require("config/gitsigns")
require("config/wilder")
require("config/treesitter")
require("config/cmake-tools")
require("config/formatter")
require("config/winbar")

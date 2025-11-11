-- OPTIONS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- Neovim Leader Key <Leader>
vim.g.mapleader = [[ ]] -- added her

-- vim.opt
local options = {
	fileencoding = "utf-8",
	clipboard = "unnamedplus",
	undofile = true,
	laststatus = 3,
	---
	title = true,
	expandtab = true,
	smarttab = true,
	shiftwidth = 2,
	tabstop = 2,
	showtabline = 2,
	smartindent = true,
	---
	hlsearch = true,
	incsearch = true,
	ignorecase = true,
	smartcase = true,
	formatoptions = vim.opt.formatoptions - { "c", "r", "o" },
	---
	splitbelow = true,
	splitright = true,
	wrap = true,
	termguicolors = true,
	---
	relativenumber = true,
	cursorline = true,
	cursorlineopt = "number",
	signcolumn = "yes",
	number = true,
	numberwidth = 4,
	conceallevel = 0,
	showmode = false,
	fillchars = { eob = " " },
	---
	hidden = true,
	---
	mouse = "a",
	---
	timeoutlen = 1000,
	updatetime = 300,
	---
	scrolloff = 0,
	sidescrolloff = 0,
	---
	ls = 0,
	ch = 0,
}

-- set options for each key/value
for key, value in pairs(options) do
	vim.opt[key] = value
end

-- prevent startup screen
vim.opt.shortmess:append({ I = true })

-- VimScript Settings >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

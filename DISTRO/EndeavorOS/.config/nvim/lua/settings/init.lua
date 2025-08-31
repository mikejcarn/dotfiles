-- SETTINGS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local settings = {
	fileencoding = "utf-8",
	clipboard = "unnamedplus",
	undofile = true,
	laststatus = 2,

	title = true,
	expandtab = true,
	smarttab = true,
	shiftwidth = 2,
	tabstop = 2,
	showtabline = 2,
	smartindent = true,

	hlsearch = true,
	incsearch = true,
	ignorecase = true,
	smartcase = true,
	formatoptions = vim.opt.formatoptions - { "c", "r", "o" },

	splitbelow = true,
	splitright = true,
	wrap = true,
	termguicolors = true,

	relativenumber = true,
	cursorline = false,
	signcolumn = "yes",
	number = true,
	numberwidth = 4,
	conceallevel = 0,
	showmode = false,

	hidden = true,

	mouse = "a",

	timeoutlen = 1000,
	updatetime = 300,

	scrolloff = 0,
	sidescrolloff = 0,

  ls = 0,
  ch = 0,
}

-- set settings for each key/value
for key, value in pairs(settings) do
	vim.opt[key] = value
end

-- SETTINGS in VimScript >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- LAZY.NVIM Plugin Loader >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- auto-install lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- configuration options
local opts = {
	ui = {
		size = { width = 1, height = 1 },
	},
	install = {
		colorscheme = { vim.g.colorscheme },
	},
}

-- Install plugins from folder
require("lazy").setup("plugins", opts)

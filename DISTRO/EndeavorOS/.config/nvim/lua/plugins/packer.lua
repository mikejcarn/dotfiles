-- Packer Plugin Manager ----------------------------------

-- source packer on save
vim.cmd([[
 augroup packer_user_config
 autocmd!
 autocmd BufWritePost packer.lua source <afile>
 augroup end
]])

-- Install Plugins
return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- LSP (Language Server Protocol)
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")

	-- CMP (Completion)
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("saadparwaiz1/cmp_luasnip")
	use({ "tzachar/cmp-tabnine", run = "./install.sh" })

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("nvim-treesitter/playground")
	use("p00f/nvim-ts-rainbow")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Core Vim Plugins
	use("kana/vim-arpeggio")
	use("nvim-lualine/lualine.nvim")
	use("declancm/windex.nvim")
	use({ "akinsho/toggleterm.nvim", tag = "v2.*" })
	-- use("folke/which-key.nvim") -- check mappings
	use("lukas-reineke/indent-blankline.nvim") -- visual indent lines
	use("chentoast/marks.nvim")
	use("kyazdani42/nvim-web-devicons")
	use({ "akinsho/bufferline.nvim", tag = "v2.*" })
	use("petertriho/nvim-scrollbar")
	use("lambdalisue/suda.vim")

	-- Navigation
	use("kyazdani42/nvim-tree.lua")
	use("karb94/neoscroll.nvim")
	use("SmiteshP/nvim-navic")
	use({ "phaazon/hop.nvim", branch = "v2" }) -- easymotion
	use("ibhagwan/fzf-lua") -- requires fzf
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.x", requires = { { "nvim-lua/plenary.nvim" } } })

	-- Coding
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("norcalli/nvim-colorizer.lua")
	use("ur4ltz/surround.nvim")
	use("terrortylor/nvim-comment")
	use("mg979/vim-visual-multi")
	use("svermeulen/vim-extended-ft")

	-- Colorschemes
	use({ "Everblush/everblush.nvim", as = "everblush" })
	use("rktjmp/lush.nvim") -- colorscheme creation tool
	use("EdenEast/nightfox.nvim")
	use("ellisonleao/gruvbox.nvim")
	use("folke/tokyonight.nvim")
	use("coffee-monk/marakai")
	use("rockerBOO/boo-colorscheme-nvim")
	use("metalelf0/jellybeans-nvim")
	use("shaunsingh/moonlight.nvim")
	use("tanvirtin/monokai.nvim")
	use("sainnhe/sonokai")
	use("Mofiqul/vscode.nvim")
	use("savq/melange")
	use("shaunsingh/nord.nvim")
	use("sainnhe/everforest")
	use("ishan9299/nvim-solarized-lua")
	use("navarasu/onedark.nvim")
	use("Mofiqul/dracula.nvim")
	use("artanikin/vim-synthwave84")
	use("bluz71/vim-nightfly-guicolors")
	use("projekt0n/github-nvim-theme")
	use("JaySandhu/xcode-vim")
end)

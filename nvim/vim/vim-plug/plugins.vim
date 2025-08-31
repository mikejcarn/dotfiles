if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

let g:coc_global_extensions = [
	\ 'coc-prettier',
	\ 'coc-vimlsp',
	\ 'coc-tabnine',
	\ 'coc-snippets',
	\ 'coc-tsserver',
	\ 'coc-pyright',
	\ 'coc-html',
	\ 'coc-css',
	\ 'coc-json',
	\ 'coc-sh',
	\ 'coc-tailwindcss'
  \ ]

call plug#begin('~/.config/nvim/autoload/plugged')

	" CORE VIM PLUGINS
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vimwiki/vimwiki'
  Plug 'mileszs/ack.vim'
	Plug 'lambdalisue/suda.vim'
	Plug 'tpope/vim-eunuch'
	Plug 'airblade/vim-rooter'
	Plug 'itchyny/lightline.vim'
  Plug 'kana/vim-arpeggio'
  Plug 'kshenoy/vim-signature'
  Plug 'vim-scripts/taglist.vim'
  Plug 'metakirby5/codi.vim'
  Plug 'karb94/neoscroll.nvim'
  Plug 'voldikss/vim-floaterm'
  Plug 'puremourning/vimspector'
  Plug 'szw/vim-maximizer'
  Plug 'will133/vim-dirdiff'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

  " FILE MANAGEMENT
	Plug 'scrooloose/NERDTree'
	Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
	Plug 'junegunn/fzf.vim'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'

  " GIT
  Plug 'airblade/vim-gitgutter'
  Plug 'jreybert/vimagit'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'

  " CODING
  Plug 'neoclide/coc-snippets'
	Plug 'mattn/emmet-vim'
	Plug 'machakann/vim-sandwich'
	Plug 'tomtom/tcomment_vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'luochen1990/rainbow'
	Plug 'lilydjwg/colorizer'
  Plug 'mg979/vim-visual-multi'
  Plug 'easymotion/vim-easymotion'
  Plug 'alvan/vim-closetag'
  Plug 'AndrewRadev/tagalong.vim'
  Plug 'Valloric/MatchTagAlways'
  Plug 'airblade/vim-matchquote'
  Plug 'Yggdroot/indentLine'
  Plug 'chrisbra/improvedft'

  " SNIPPET PACKS
  " Plug 'honza/vim-snippets'
  Plug 'coffee-monk/my-vim-snippets'

  " FORMATTING
  Plug 'z0mbix/vim-shfmt', { 'for': 'sh' } "install shfmt 1st
  Plug 'neoclide/jsonc.vim'
  Plug 'beanworks/vim-phpfmt'

  " SYNTAX HIGHLIGHTING & COLORSCHEMES
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'coffee-monk/morokai'
  Plug 'coffee-monk/marakai'
  Plug 'coffee-monk/codedark'
  Plug 'sainnhe/sonokai'
  Plug 'sainnhe/edge'
  Plug 'sainnhe/everforest'
  Plug 'navarasu/onedark.nvim'

call plug#end()

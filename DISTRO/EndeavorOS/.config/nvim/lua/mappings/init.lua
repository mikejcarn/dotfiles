-- MAPPINGS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- set keymap with options if provided
local map = function(mode, key, result, options)
	options = options or { noremap = true, silent = true }
	vim.keymap.set(mode, key, result, options)
end

-- leader key
vim.g.mapleader = " "
map("n", "<SPACE>", "<Nop>") -- unmap <SPACE>
map("n", "ss", "<Nop>") -- unmap ss to hold key
map("v", "ss", "<Nop>") -- unmap ss to hold key

-- STANDARD KEYMAPS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- semicolon as colon
map("n", ";", ":", { noremap = true, silent = false })
map("v", ";", ":<BS><BS><BS><BS><BS>", { noremap = true, silent = false })

-- manual lookup of key under cursor
map("n", "0", "K")

-- word/char/line count
map("n", "<Leader><Leader>f", "g<C-g>")

-- capitalization toggle
map("n", "`", "~h")
map("v", "`", "~")

-- exit search highlight
map("n", "<ESC>", ":noh<CR>")

-- enter key behavior
map("n", "<CR>", "O<ESC>j")
map("n", "<Leader><CR>", "O<ESC>")

-- break line at character
map("n", "K", "i<CR><ESC>")

-- delete & move back
map("n", "X", "xh")

-- copy to end of line
map("n", "Y", "y$")

-- paste over text & keep original clipboard val
map("v", "p", '"_dP')

-- move lines/sections up & down
map("n", "<A-j>", ":m .+1<CR>")
map("n", "<A-k>", ":m .-2<CR>")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- remap go to column #
map("n", "<Leader><BAR>", "<BAR>")

-- go to matching paranthesis
map("n", "#", "%")
map("v", "#", "%")

-- swap left/right paragraph motion
map("n", "{", "}")
map("n", "}", "{")

-- custom paragraph motion
map("n", "=", "{{wwb")
map("n", "-", "}}{wwb")
map("v", "=", "{{wwb")
map("v", "-", "}}{wwb")

-- go to line start/end
map("n", "H", "^")
map("n", "L", "$")
map("v", "H", "^")
map("v", "L", "$")

-- save & quit
map("n", "<C-s>", ":w!<CR>")
map("n", "<Leader><Leader>s", ":w!<CR>")
map("i", "<C-s>", "<C-o>:w!<CR>")
map("n", "Q", ":q<CR>")

-- select all
map("n", "<C-a>", "ggVG")

-- invert lines vertically
map("v", "<Leader>v", "!tac<CR>")

-- backspace delete character
map("n", "<BS>", "hx")

-- move back a word to last character
map("n", "<Leader>b", "ge")
map("n", "<C-b>", "ge")

-- U for redo
map("n", "U", "<C-r>")

-- toggle relative mode for line numbers
map("n", "@", ":set relativenumber!<CR>")
map("v", "@", ":set relativenumber!<CR>")

-- highlight all words under cursor
map("n", "$", "*")
map("v", "$", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])

-- search & replace: all/word under cursor/selected
map("n", "S", ":%s///g<Left><Left><Left>", { noremap = true, silent = false })
map("n", "<Leader>S", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", { noremap = true, silent = false })
map("v", "S", '"hy:%s/<C-r>h//g<Left><Left>', { noremap = true, silent = false })

-- Windows ------------------------------------------------

-- create split windows
map("n", "<Leader><Left>", "<C-w>v<C-w>h")
map("n", "<Leader><Right>", "<C-w>v<C-w>l")
map("n", "<Leader><Down>", "<C-w>s<C-w>j")
map("n", "<Leader><Up>", "<C-w>s<C-w>k")

-- move to split window
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- expand/shrink vertical/horizontal window
map("n", "<A-Up>", "<C-w>+")
map("n", "<A-Down>", "<C-w>-")
map("n", "<A-Left>", "<C-w>>")
map("n", "<A-Right>", "<C-w><")

-- Buffers & Tabs -----------------------------------------

-- create/close buffer
map("n", "<Leader><Tab>", ":enew<CR>")
map("n", "qq", ":bd<CR>")

-- next/previous buffer
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- create new tab
map("n", "*", ":tabnew<CR>")

-- next/previous tab
map("n", ")", "gt")
map("n", "(", "gT")

-- tab-indentation
map("n", ">", "V>gv<ESC>")
map("n", "<", "V<gv<ESC>")
map("v", ">", ">gv")
map("v", "<", "<gv")

-- delete all marks
map("n", "M", ":wshada!<CR>", { noremap = true, silent = false })

-- reload vim with saved settings
map("n", "<Leader>\\", ":source<CR>")

-- command mode wildmenu
vim.cmd([[
set wildcharm=<C-Z>
"navigation (next/prev)
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"
cnoremap <expr> <C-k> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <C-j> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <C-h> wildmenumode() ? "\<up>" : "\<left>"
"choose selection
cnoremap <expr> <C-l> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"
"cnoremap <expr> / wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"
"cnoremap <expr> / wildmenumode() ? " \<bs><bs>/<C-Z>" : "\<right>"
cnoremap <expr> / wildmenumode() ? " \<bs><bs>/<C-Z>" : "/"
]])

-- CUSTOM FUNCTIONS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

vim.cmd([[
  "Paragraph movement down visual mode
  function! QuickMove_Down(arg)
    let mode = a:arg
    let lnum = line('.') + 1
    let empty_below = empty(getline(lnum))

    if empty_below == 1
      if mode == "n"
        :exe "normal V}}{wwb"
      elseif mode == "v"
        :exe "normal gv}}{wwb"
      endif
    else
      if mode == "n"
        :exe "normal V}ge^"
      elseif mode == "v"
        :exe "normal gv}ge"
      endif
    endif
  endfunction
]])

-- PLUGIN KEYMAPS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- windex (maximizer) -------------------------------------

local status = pcall(require, "windex")
if status then
	--
	map("n", "!", "<Cmd>lua require('windex').toggle_nvim_maximize()<CR>")
	--
end

-- nvim-tree ----------------------------------------------

local status = pcall(require, "nvim-tree")
if status then
	--
	map("n", "\\", ":NvimTreeToggle<CR>")
	--
end

-- nvim-comment ('<C-/>' & '<C-_>' are same) --------------

local status = pcall(require, "nvim_comment")
if status then
	--
	map("n", "<C-/>", ":CommentToggle<CR>")
	map("v", "<C-/>", [[:'<, '>CommentToggle<CR>]])
	map("n", "<C-_>", ":CommentToggle<CR>")
	map("v", "<C-_>", [[:'<, '>CommentToggle<CR>]])
	--
end

-- hop (normal + visual mode) -----------------------------

local status = pcall(require, "hop")
if status then
	--
	vim.cmd([[
  map <silent> fj <cmd>HopWordAC<CR>
  map <silent> fk <cmd>HopWordBC<CR>
  map <silent> fh <cmd>HopWordMW<CR>
]])
	--
end

-- telescope ----------------------------------------------

local status = pcall(require, "telescope")
if status then
	--
	map("n", "sf", ":Telescope find_files<CR>")
	pcall(
		vim.cmd,
		[[
  call arpeggio#map('n','','0','sf',':Telescope find_files<CR>')")
  ]]
	)
	--
end

-- fzf-lua (files + grep) ---------------------------------

pcall(
	vim.cmd,
	[[
  call arpeggio#map('n','s','0','we',':FzfLua files<CR>')
  call arpeggio#map('n','s','0','qw',':FzfLua grep<CR>')
]]
)

-- vim-extended-ft ----------------------------------------

pcall(
	vim.cmd,
	[[
    nnoremap <silent> f <plug>ExtendedFtSearchFForward
    nnoremap <silent> F <plug>ExtendedFtSearchFBackward
    nnoremap <silent> t <plug>ExtendedFtSearchTForward
    nnoremap <silent> T <plug>ExtendedFtSearchTBackward
  ]]
)

-- arpeggio -----------------------------------------------

pcall(
	vim.cmd,
	[[
    "new-line/escape insert mode
    call arpeggio#map('i', 's', '0', 'jk', '<Esc>')
    call arpeggio#map('n','s','0','kl','O')

    "visual select to beginning/end of paragraph
    call arpeggio#map('n','s','0','sj',":call QuickMove_Down('n')<CR>")
    call arpeggio#map('v','s','0','sj',":call QuickMove_Down('v')<CR>")
    call arpeggio#map('n','s','0','sk',"V{w")
    call arpeggio#map('v','s','0','sk',"{{wwb")

    "visual select to next/previous paragraph
    call arpeggio#map('n','s','0','sn','V}}{wwb')
    call arpeggio#map('n','s','0','so','V{{wwb')
    call arpeggio#map('v','s','0','sn','}}{wwb')
    call arpeggio#map('v','s','0','so','{{wwb}ge^')

    "visual select to beginning/end of line
    call arpeggio#map('n','s','0','sl','v$h')
    call arpeggio#map('n','s','0','sh','v^')
    call arpeggio#map('v','s','0','sl','v$h')

    pall arpeggio#map('v','s','0','sh','v^')
  ]]
)

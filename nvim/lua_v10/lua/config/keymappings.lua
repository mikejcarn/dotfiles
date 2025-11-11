-- KEY MAPPINGS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- set keymap with options if provided
local map = function(mode, key, result, options)
	options = options or { noremap = true, silent = true }
	vim.keymap.set(mode, key, result, options)
end

-- STANDARD KEYMAPS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- leader key set in lua/config/options

-- semicolon as colon
map("n", ";", ":", { noremap = true, silent = false })
map("x", ";", ":<BS><BS><BS><BS><BS>", { noremap = true, silent = false })

-- visual block mode
map("n", "<Leader>v", "<C-v>")

-- word/char/line count
map("n", "<Leader><Leader>f", "g<C-g>")

-- capitalization toggle
map("n", "`", "~h")
map("x", "`", "~")

-- exit search highlight + exit lsp window
map("n", "<ESC>", ":noh<CR>:lua require('notify').dismiss()<CR>jk")
-- map("n", "<ESC>", ":noh<CR>")

-- enter key behavior
map("n", "<CR>", "O<ESC>j")
map("n", "<S-CR>", "O<ESC>")
map("n", "<Leader><CR>", "O<ESC>")

-- emmet typing fix
map("i", ",i", ",i")
map("i", ",a", ",a")
map("i", ",g", ",g")

-- break line at character
map("n", "K", "i<CR><ESC>")

-- new line at cursor
map("n", "<Leader>o", "O")

-- insert mode enter with a space
map("n", "<Leader>i", "i <ESC>i")

-- delete & move back
map("n", "X", "xh")

-- copy to end of line
map("n", "Y", "y$")

-- paste UX improvements (_ is blackhole register)
map("n", "d", '"_d')
map("v", "d", '"_d')
map("x", "p", '"_dP') -- paste over highlighted
map("n", "D", '"_d$') -- delete to end of line
map("n", "dC", '"_d$a') -- delete to end of line & insert
map("n", "cd", 'cc<ESC>"_dd') -- copy text & delete line
map("n", "dc", '^"_d$i') -- delete line & insert
map("n", "dc", '^"_d$i') -- delete line & insert
map("n", "<Leader>p", "i <ESC>P") -- paste before word

-- remap go to column #
map("n", "<Leader><BAR>", "<BAR>")

-- go to matching paranthesis
map("n", "#", "%")
map("x", "#", "%")

-- swap left/right paragraph motion
map("n", "{", "}")
map("n", "}", "{")
map("v", "{", "}")
map("v", "}", "{")

-- custom paragraph motion
map("n", "=", "{{wwb")
map("n", "-", "}}{wwb")
map("x", "=", "{{wwb")
map("x", "-", "}}{wwb")

-- go to line start/end
map("n", "H", "^")
map("n", "L", "$")
map("x", "H", "^")
map("x", "L", "$")

-- start of sentence
map("n", "<Leader><BS>", "F.w")

-- save & quit
map("n", "<C-s>", ":w!<CR>")
map("n", "<Leader><Leader>s", ":w!<CR>")
map("i", "<C-s>", "<C-o>:w!<CR>")
map("n", "Q", ":q<CR>")

-- select all
map("n", "<Leader>a", "ggVG")
map("n", "<C-a>", "ggVG")

-- invert lines vertically
map("x", "<Leader>v", "!tac<CR>")

-- backspace delete character
map("n", "<BS>", "hx")

-- move back a word to last character
map("n", "<Leader>b", "ge")
map("n", "<C-b>", "ge")

-- U for redo
map("n", "U", "<C-r>")

-- toggle relative mode for line numbers
map("n", "@", ":set relativenumber!<CR>")
map("x", "@", ":set relativenumber!<CR>")

-- highlight all words under cursor
map("n", "$", "*")
map("x", "$", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])

-- search & replace: all/word under cursor/selected
map("n", "S", ":%s///g<Left><Left><Left>", { noremap = true, silent = false })
map("n", "<Leader>S", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", { noremap = true, silent = false })
map("x", "S", '"hy:%s/<C-r>h//g<Left><Left>', { noremap = true, silent = false })

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
map("n", ">", ">>")
map("n", "<", "<<")
map("x", ">", ">gv")
map("x", "<", "<gv")

-- reload vim with saved settings
map("n", "<Leader>\\", ":source<CR>")

-- spell checker toggle
map("n", "<Leader>s", ":set spell!<CR>")

-- COMMAND MODE WILDMENU >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
cnoremap <expr> / wildmenumode() ? " \<bs><bs>/<C-Z>" : "/"
]])

-- CUSTOM FUNCTIONS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- support for improved paragraph movement
vim.cmd([[
  function! QuickMove_Down(arg)
    let mode = a:arg
    let lnum = line('.') + 1
    let empty_below = empty(getline(lnum))

    if empty_below == 1
      if mode == "n"
        :exe "normal V{{}wwb"
      elseif mode == "x"
        :exe "normal gv{{}wwb"
      endif
    else
      if mode == "n"
        :exe "normal V{ge^"
      elseif mode == "x"
        :exe "normal gv{ge"
      endif
    endif
  endfunction
]])

-- PLUGIN KEYMAPS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- chatGPT.nvi --------------------------------------------

local status = pcall(require, "chatgpt")
if status then
	---
	map("n", "<Leader>;", "<cmd>ChatGPT<CR>i<BS>")
	map("v", "<Leader>;", "<cmd>ChatGPTEditWithInstructions<CR>")
	---
end

-- (maximizer) --------------------------------------------

local status = pcall(require, "maximizer")
if status then
	---
	map("n", "!", '<cmd>lua require("maximizer").toggle()<CR>')
	---
end

-- neo-tree -----------------------------------------------

local status = pcall(require, "neo-tree")
if status then
	---
	map("n", "|", ":NeoTreeRevealToggle<CR>")
	---
end

-- nvim-tree ----------------------------------------------

local status = pcall(require, "nvim-tree")
if status then
	---
	map("n", "\\", ":NeoTreeClose<CR>:NvimTreeToggle<CR>")
	---
end

-- oil ----------------------------------------------------

local status, oil = pcall(require, "oil")
if status then
	---
	map("n", "<Leader>\\", function()
		oil.close()
		oil.open_float()
	end)
	---
end

-- nvim-comment ('<C-/>' & '<C-_>' are same) --------------

local status = pcall(require, "nvim_comment")
if status then
	---
	map("n", "<C-/>", ":CommentToggle<CR>")
	map("x", "<C-/>", [[:'<, '>CommentToggle<CR>gv]])
	map("n", "<C-_>", ":CommentToggle<CR>")
	map("x", "<C-_>", [[:'<, '>CommentToggle<CR>gv]])
	---
end

-- move.nvim ----------------------------------------------

local status = pcall(require, "move")
if status then
	---
	map("n", "<A-j>", ":MoveLine(1)<CR>") -- move line up/down
	map("n", "<A-k>", ":MoveLine(-1)<CR>")
	map("n", "<A-h>", ":MoveHChar(-1)<CR>") -- move char left/right
	map("n", "<A-l>", ":MoveHChar(1)<CR>")
	---
	map("v", "<A-j>", ":MoveBlock(1)<CR>") -- move block up/down
	map("v", "<A-k>", ":MoveBlock(-1)<CR>")
	map("v", "<A-h>", ":MoveHBlock(-1)<CR>") -- move block left/right
	map("v", "<A-l>", ":MoveHBlock(1)<CR>")
	---
end

-- hop (normal + visual mode) -----------------------------

local status = pcall(require, "hop")
if status then
	---
	local function HopWordAC()
		vim.cmd([[
     :lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })
     ]])
	end
	local function HopWordBC()
		vim.cmd([[
     :lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })
     ]])
	end
	local function HopWordMW()
		vim.cmd([[
     :lua require'hop'.hint_words({ multi_windows = true })
     ]])
	end
	---
	map("n", "fj", function()
		local status = pcall(HopWordAC)
		if not status then
			HopWordMW()
		end
	end)
	map("n", "fk", function()
		local status = pcall(HopWordBC)
		if not status then
			HopWordMW()
		end
	end)
	map("n", "fh", function()
		HopWordMW()
	end)
	map("v", "fj", function()
		local status = pcall(HopWordAC)
		if not status then
			HopWordMW()
		end
	end)
	map("v", "fk", function()
		local status = pcall(HopWordBC)
		if not status then
			HopWordMW()
		end
	end)
	map("v", "fh", function()
		HopWordMW()
	end)
	---
end

-- codewindow ----------------------------------------------

local status, codewindow = pcall(require, "codewindow")
if status then
	---
	map("n", "<C-\\>", function()
		codewindow.toggle_minimap()
	end)
	---
end

-- marks --------------------------------------------------

local status, marks = pcall(require, "marks")
if status then
	---
	marks.setup({
		mappings = {
			next = "gm",
			prev = "gM",
			preview = "M",
			next_bookmark = "0",
		},
	})
	---
	map("n", "M<CR>", "<ESC>")
end

-- telescope ----------------------------------------------

pcall(
	vim.cmd,
	[[
    nnoremap sf :Telescope find_files<CR>
    call arpeggio#map('n','','0','sf',':Telescope find_files<CR>')
  ]]
)
pcall(
	vim.cmd,
	[[
    nnoremap <silent> <leader>df :Telescope dap frames<CR>
    nnoremap <silent> <leader>dt :Telescope dap list_breakpoints<CR>
  ]]
)
pcall(
	vim.cmd,
	[[
    nnoremap <silent> s; :Noice telescope<CR>
  ]]
)
pcall(
	vim.cmd,
	[[
    nnoremap <silent> s' :Telescope neoclip<CR>
    call arpeggio#map('n','','0',"s'",':Telescope neoclip<CR>')
  ]]
)

-- neoscroll -----------------------------------------------

pcall(
	vim.cmd,
	[[
    call arpeggio#map('n','s','0','jk',":lua require('neoscroll').scroll(0.25, { move_cursor=false; duration = 250 })<CR>")
    call arpeggio#map('n','s','0','kl',":lua require('neoscroll').scroll(-0.25, { move_cursor=false; duration = 250})<CR>")
  ]]
)

-- fzf-lua (files + grep) ---------------------------------

pcall(
	vim.cmd,
	[[
    call arpeggio#map('n','s','0','we',':FzfLua files<CR>')
    call arpeggio#map('n','s','0','qw',':FzfLua grep<CR>')
  ]]
)

-- vim-fugitive -------------------------------------------

pcall(
	vim.cmd,
	[[
    nnoremap <Leader>g :G
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
    "visual select to beginning/end of paragraph
    call arpeggio#map('n','s','0','sj',":call QuickMove_Down('n')<CR>")
    call arpeggio#map('x','s','0','sj',":call QuickMove_Down('x')<CR>")
    call arpeggio#map('n','s','0','sk',"V{w")
    call arpeggio#map('x','s','0','sk',"{{wwb")

    "visual select to next/previous paragraph
    call arpeggio#map('n','s','0','sn','V}}{wwb')
    call arpeggio#map('n','s','0','so','V{{wwb')
    call arpeggio#map('x','s','0','sn','}}{wwb')
    call arpeggio#map('x','s','0','so','{{wwb}ge^')

    "visual select to beginning/end of line
    call arpeggio#map('n','s','0','sl','v$h')
    call arpeggio#map('n','s','0','sh','v^')
    call arpeggio#map('x','s','0','sl','v$h')

    pall arpeggio#map('x','s','0','sh','v^')
  ]]
)

-- TEXT-OBJECTS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local chars = { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" }

for _, char in ipairs(chars) do
	for _, mode in ipairs({ "x", "o" }) do
		map(mode, "i" .. char, ":<C-u>silent! normal! f" .. char .. "F" .. char .. "lvt" .. char .. "<CR>")
		map(mode, "a" .. char, ":<C-u>silent! normal! f" .. char .. "F" .. char .. "vf" .. char .. "<CR>")
	end
end

"VIMRC >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

filetype off

"CONFIG FILES off >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/colors/colorscheme-config.vim

"VIM BASIC SETTINGS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
filetype plugin indent on

set clipboard=unnamedplus

set cursorline

"toggle word-wrap (linebreak)
set linebreak

"set height of cmd
set cmdheight=1

"update interval
set updatetime=150

"tab/arrow completion for vim cmd
set wildmenu
set wildignorecase
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

syntax on
set mouse=a
set noshowmode
set number
set ignorecase
set smartcase
set nocompatible
set noshowcmd
set relativenumber
filetype plugin on

autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

autocmd BufRead,BufNewFile *.ejs setfiletype html

"PLUGIN SETTINGS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

let g:vimwiki_list = [{'path':'~/.config/nvim/vimwiki', 'path_html':'~/.config/nvim/vimwiki/vimwiki-HTML'}]

"coc-snippets next placeholder
" let g:coc_snippet_next = '<C-j>'
" let g:coc_snippet_prev = '<C-k>'
let g:coc_snippet_next = '<CR>'

"coc gutter sign colors
" hi! CocErrorSign guifg=#d1666a
hi! CocInfoSign guifg=#777777
hi! CocWarningSign guifg=#777777

"Lightline Config
let g:lightline = {
      \ 'component_function': {
      \ 'filename': 'LightlineFilename',
      \ },
      \ 'colorscheme': g:colors_name,
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified'  ] ]
      \ },
      \ 'inactive': {
      \   'right': [ ['lineinfo'] ]
      \ },
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

"Tcomment prevent mappings
let g:tcomment_maps=''

" Typescript: tsconfig.json > tsconfig.jsonc
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

"Markdown-Preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0

" Floaterm Terminal
let g:floaterm_width=1.0
let g:floaterm_height=0.4
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
let g:floaterm_position='bottom'
let g:floaterm_title=''

"GitGutter symbols
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '~'
"background color
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn ctermbg=NONE
"symbol colors
highlight GitGutterAdd ctermfg=34 guifg=#00ff00
highlight GitGutterChange ctermfg=223 guifg=#00ffff
highlight GitGutterDelete ctermfg=160 guifg=#ff0000 

"Magit enable deletion of untracked files
let g:magit_discard_untracked_do_delete=1

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "javascript", 
  highlight = {
    enable = true,
    disable = {},  -- list of language that will be disabled
  },
}
EOF

"visual-multi init/remap
let g:VM_leader = '<SPACE>'
let g:VM_maps = {}
let g:VM_maps['Reselect Last'] = '' "remove conflicting map
let g:VM_maps['Add Cursor At Pos'] = '' "remove conflicting map
let g:VM_custom_noremaps = {'`':'~'}
let g:VM_mouse_mappings = 1

"tagalong
let g:tagalong_filetypes = ['html', 'xml', 'jsx', 'eruby', 'ejs', 'eco', 'php', 'htmldjango', 'javascriptreact', 'typescriptreact', 'javascript']

"rainbow
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,jsx' 
let g:rainbow_active = 1
let g:rainbow_conf = {
            \	'ctermfgs': ['lightblue', '190', '175', '121'],
            \	'guifgs': ['#ffff00', '#00ffff', '#d787ff', '#00ff00'],
            \	'separately': {
            \		'*': {},
            \		'css': 0, 
            \       'html': 0,
            \       'scss': 0,
            \	}
            \}

"Codi Alignment & COLOR
hi CodiVirtualText ctermfg=82

"MatchTagAlways filetypes
let g:mta_filetypes = {
            \ 'html' : 1,
            \ 'xhtml' : 1,
            \ 'xml' : 1,
            \ 'jinja' : 1,
            \ 'javascript' : 1,
            \ 'jsx' : 1,
            \}

"change MatchTagAlways colors
let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0
hi MatchTag cterm=underline

"indentLine · ⎸| ▏┊¦
let g:indentLine_char = '⎸'
let g:indentLine_defaultGroup = 'LineNr'

"NerdTree
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 35
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMapMenu = 'v'
let g:NERDTreeMapToggleFilters = '<C-f>'
"refresh Nerdtree when buffer is entered
autocmd BufEnter NERD_tree* | execute 'normal R'
"change Nerdtree root to pwd
let NERDTreeChDirMode=2
"update nerdtree directory when :cd command is run
" augroup DIRCHANGE
"     au!
"     autocmd DirChanged global :NERDTreeCWD
" augroup END
" let Tlist_WinWidth = 45

"exit vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" autocmd BufEnter * :call NerdTreeLastWindowCloseVim()

" ranger.vim disable default keymaps
let g:ranger_map_keys = 0

"Improved ft searching
let g:ft_improved_ignorecase = 1

"EasyMotion
let g:EasyMotion_keys = 'mglshdweruiopvbnkfj'
hi EasyMotionTarget2First ctermfg=207 ctermbg=NONE cterm=bold 
hi EasyMotionTarget ctermfg=213 ctermbg=NONE cterm=bold 
hi EasyMotionTarget2Second ctermfg=206 ctermbg=NONE cterm=italic
hi EasyMotionShade ctermfg=240 ctermbg=NONE 

"EasyMotion - prevent file text error checking
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

"signature-mark mappings
let g:SignatureMap = {
    \ 'GotoNextSpotAlpha': "'[",
    \ 'GotoPrevSpotAlpha': "']",
    \ 'GotoNextLineAlpha': "'{",
    \ 'GotoPrevLineAlpha': "'}"
  \ }

"time-delay (ms) for key-combo execution
let g:arpeggio_timeoutlen = 100

" easy-motion bug fix
let g:easymotion#is_active = 0
function! EasyMotionCoc() abort
    if EasyMotion#is_active()
        let g:easymotion#is_active = 1
        silent! CocDisable
    else
        if g:easymotion#is_active == 1
            let g:easymotion#is_active = 0
            silent! CocEnable
        endif
    endif
endfunction
autocmd TextChanged,CursorMoved * call EasyMotionCoc()

"don't apply cmd to NerdTree window
function! NerdTreeOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    :uns exe "normal! \<c-w>\<c-w>"
  else
    :uns exe 'normal!  ' . a:command_str . "\<cr>"
  endif
endfunction

"Close Vim is Vim is final window
function! NerdTreeLastWindowCloseVim ()
    sleep 100m
    if tabpagenr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
        quit
    endif
endfunction

"NEOSCROLL
lua << EOF
require('neoscroll').setup({
    -- All these keys will be mapped. Pass an empty table ({}) for no mappings
    mappings = {'<PageUp>', '<PageDown>', '<S-PageUp>', '<S-PageDown>', '(', ')', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor 
    stop_eof = true,             -- Stop at <EOF> 
    respect_scrolloff = false,   -- Stop when cursor reaches scrolloff margin 
    cursor_scrolls_alone = true  -- Scroll even if window cannot scroll further
})
local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<PageUp>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '300'}}
t['<PageDown>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '300'}}
t['<S-PageUp>'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
t['<S-PageDown>'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
t['+'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
t['_'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
t['zt'] = {'zt', {'100'}}
t['zz'] = {'zz', {'100'}}
t['zb'] = {'zb', {'100'}}
require('neoscroll.config').set_mappings(t)
EOF

"vim-shfmt - autoformat on save
let g:shfmt_fmt_on_save = 1

"Keymaps >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

"Check keystroke = [InsertMode] <C-v> $key
"Check value of keystroke = :map $key

"redefine leader key
let mapleader="\<SPACE>"
"unmap Space/Backslash in [Normal]
nnoremap <SPACE> <Nop>
nnoremap <Bslash> <Nop>

"unmap macro-recording
nmap <C-q> q

"semicolon as colon
nmap ; :
vmap ; :<BS><BS><BS><BS><BS>

"define vim-emmet leader key
imap ,, <C-y>,

"vim wiki
nmap <Leader>` <Plug>VimwikiTabIndex

"Floaterm enter & exit
nnoremap <silent> ~ :FloatermToggle<CR>
tnoremap <silent> ~ <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <leader><ESC> <C-\><C-n>

"delete marks
nnoremap M :delm!<CR>:wshada!<CR>

"FZF Search
map <silent> <C-z> :Files<CR>
map <silent> <C-p> :Files<CR>
" map <C-Bslash> :Files<CR>
" map <leader><Bslash> :Files<CR>
call arpeggio#map('n','','0','we',':Files<CR>')

"Ranger.vim
call arpeggio#map('n','','0','er',':Ranger<CR>')

"Ack Search
call arpeggio#map('n','','0','zx',':Ack ')

"Rg Search
call arpeggio#map('n','','0','qw',':Rg ')

"Tag List of Variables
nmap <leader>z :TlistToggle<CR><C-h>
nmap <C-Bslash> :TlistToggle<CR><C-h>

"CocVim - GoTo code navigation.
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

"Manual Lookup of key under cursor
nnoremap 0 K

"Word/Char/Line Count
nnoremap <leader>f g<C-g>
vnoremap <leader>f g<C-g>

"capitalization toggle instead of signature-mark
nnoremap ` ~
vnoremap ` ~

"Substitute
call arpeggio#map('n','','0','ds','s')

"exit search highlight 
nnoremap <silent> <ESC> :noh<CR>

"highlight all words under cursor
nnoremap $ *

"<Enter> key behavior
nmap <CR> O<ESC>j
nmap <leader><CR> O<ESC>
nmap <leader><leader><CR> i<CR><ESC>

"carriage return break line
nnoremap K i<CR><Esc>

"open (Insert) line below
nmap <leader>o O

"delete and move back 
nnoremap X xh

"copy to end-of-line
nnoremap Y y$

"paste after word
nnoremap <leader>p viwo<Esc>ea<SPACE><ESC>p
nnoremap <leader><leader>p gea<SPACE><ESC>p

"delete/insert line
nnoremap <leader>d S

"undo break points
inoremap . .<c-g>u
inoremap , ,<c-g>u

"remap search column by number
nnoremap <leader><Bar> <Bar>

"exit 
call arpeggio#map('i','','0','jk','<ESC>')

"go to matching parenthesis
nnoremap # %
vnoremap # %

"swap left/right paragraph motion for curly brackets
noremap { }
noremap } {

"go to beginning/end of paragraph
nnoremap <leader>- }ge^
nnoremap <leader>= {w
vnoremap <leader>- }ge^
vnoremap <leader>= {w

"visual select to beginning/end of paragraph
call arpeggio#map('n','','0','sj','V}ge^')
call arpeggio#map('n','','0','sk','V{w')
call arpeggio#map('v','','0','sj','}ge^')
call arpeggio#map('v','','0','sk','{w')

"visual select to next/previous paragraph
call arpeggio#map('n','','0','sn','V}}{wwb')
call arpeggio#map('n','','0','so','V{{wwb')
call arpeggio#map('v','','0','sn','}}{wwb')
call arpeggio#map('v','','0','so','{{wwb')

"set -/= as paragraph motion (top)
nnoremap = {{wwb
nnoremap - }}{wwb
vnoremap = {{wwb
vnoremap - }}{wwb

"go to line start/end
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

"visual select to beginning/end of line
call arpeggio#map('n','','0','sl','v$h')
call arpeggio#map('n','','0','sh','v^')

"save and quit commands
nmap <C-s> :w!<CR>
inoremap <C-s> <C-o>:w!<CR>
nmap <leader>s :SudaWrite<CR>
nmap Q :q<CR>
nmap <leader>Q! :q!<CR>

"Buffers & Tabs --------------------------------------------

"next buffer (NerdTreeOpen to prevent NerdTree window bug)
nnoremap <silent> <Tab> :call NerdTreeOpen(':bn')<CR>
nnoremap <silent> <S-Tab> :call NerdTreeOpen(':bp')<CR>

"view all buffers
nnoremap <silent> <Bar> :call NerdTreeOpen(':Buffers')<CR>

"new buffer/write new buffer to file
nnoremap <leader><Tab> :call NerdTreeOpen(':enew')<CR>
nnoremap <leader><leader><Tab> :call NerdTreeOpen(':enew')<CR>:w 

"close buffer (':bp\|:bd #' to prevent Vim exiting)
nnoremap <silent> qq :call NerdTreeOpen(':bp\|:bd #')<CR> 
nnoremap <silent> <leader><leader>q :call NerdTreeOpen(':bp\|:bd! #')<CR> 

"tab create/close
nnoremap <silent> * :call NerdTreeOpen(':tabnew')<CR>

"tab next/prev
nnoremap ) gt
nnoremap ( gT

"NERDTree
nnoremap <silent> <nowait> <Bslash> :NERDTreeToggle<CR>

"NERDTree - set root as Vim's :pwd
nnoremap <leader><Bslash> :NERDTree .<CR>

"move lines/sections up and down
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
inoremap <A-j> <ESC>:m .+1<CR>gi
inoremap <A-k> <ESC>:m .-2<CR>gi
vnoremap <A-j> :m '>+1<CR>gvgv
vnoremap <A-k> :m '<-2<CR>gvgv

"tab-indentation
vnoremap > >gv  
vnoremap < <gv  

"move words left & right
nmap <A-l> dawEla<SPACE><ESC>pB
nmap <A-h>  dawBPB

"select all
nnoremap <C-a> ggVG

"easy-motion word upwards/downwards
nmap <silent> fk <leader><leader>b
nmap <silent> fj <leader><leader>w
vmap <silent> fk <leader><leader>b
vmap <silent> fj <leader><leader>w

"easy-motion search letter upwards/downwards
nmap <silent> Fk <leader><leader>F
nmap <silent> Fj <leader><leader>f
vmap <silent> Fk <leader><leader>F
vmap <silent> Fj <leader><leader>f

nmap <silent> fh <Plug>(easymotion-overwin-w)

"comment lines 
noremap <silent> <C-_> :TComment<CR>
vnoremap <silent> gc :TComment<CR>

"vertical reverse lines
vnoremap <leader>v !tac<CR>

"Backspace delete char
nmap <BS> hx

"back a word to last character
nnoremap <leader>b ge
nnoremap <C-b> ge

"U for redo
nmap U <C-r>

"show cursorline at middle/top
nmap <leader>j zz
nmap <leader>k zt
nmap <leader>h zb
vmap <leader>j zz
vmap <leader>k zt
vmap <leader>h zb

"toggle relative mode or line numbers
nmap <silent> @ :set relativenumber!<CR>
vnoremap <silent> @ :set relativenumber!<CR>

"toggle indentLines
nnoremap & :set linebreak!<CR>

"! toggles split screen maximize
nmap <silent> ! :MaximizerToggle!<CR>
nmap <silent> <leader>m :MaximizerToggle!<CR>

"create split window
nnoremap <silent> <leader><Left> <C-w>v<C-w>h
nnoremap <silent> <leader><Down> <C-w>s<C-w>j
nnoremap <silent> <leader><Up> <C-w>s<C-w>k
nnoremap <silent> <leader><Right> <C-w>v<C-w>l

"move to split window
nnoremap <silent> <Insert> <C-w>w
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

"expand/shrink vertical window
nnoremap <silent> <A-Left> <C-w>>
nnoremap <silent> <A-Right> <C-w><
nnoremap <silent> <A-Up> <C-w>+
nnoremap <silent> <A-Down> <C-w>-

"search and replace: all/word under cursor/selected
nnoremap S :%s///g<Left><Left><Left>
nnoremap <leader>S :%s/\<<C-r><C-w>\>//g<Left><Left>
vnoremap S "hy:%s/<C-r>h//g<left><left>

"enter append mode with 'kl'
call arpeggio#map('n','','0','kl','a')

"Github Maps -----------------------------------------------

"GitGutter Mappings
nmap ^ :GitGutterSignsToggle<CR>
nmap <C-9> <Plug>(GitGutterNextHunk)
nmap <C-0> <Plug>(GitGutterPrevHunk)
nmap gj <Plug>(GitGutterNextHunk)
nmap gk <Plug>(GitGutterPrevHunk)

"Stage hunk / stage all hunks in file
nmap ga <Plug>(GitGutterStageHunk)
nmap gA :Gw<CR>
nmap <leader>gA :Git add .<CR>

"Undo hunk / undo all hunks
nmap gu <Plug>(GitGutterUndoHunk)
nnoremap gU :! git reset<CR>

"Preview hunk changes
nmap gP <Plug>(GitGutterPreviewHunk)

"Commit
nnoremap gc :Git commit<CR>

"Push to remote
nnoremap gp :! git push<CR>

"Vimagit Status Pane
nnoremap g<Bslash> :Magit<CR>

"Fugitive - Show commits for every source line
nnoremap gb :Git blame<CR>
"Open current line in the browser
nnoremap gB :.GBrowse<CR>
"Open visual selection in the browser
vnoremap gB :GBrowse<CR>

"Compare current file to previous commit
command Gvdiff Gvdiffsplit

"Debugger --------------------------------------------------

"Maximize into debugger windows
function! GotoWindow(id)
  call win_gotoid(a:id)
  MaximizerToggle
endfunction

"Vimspector Remaps
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nmap <leader>d<SPACE> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

"Source config file to restart config
nnoremap <C-SPACE> :source $MYVIMRC<CR>

"Commands --------------------------------------------------

" Ranger file manager
command R Ranger

"compare two vertical windows
command Vdiff windo diffthis  

"Colorschemes ----------------------------------------------

command Morokai colo morokai
command Marakai colo marakai
command Sonokai colo sonokai
command Everforest colo everforest
command Edge colo edge
command Codedark colo codedark
command Onedark colo onedark

"Open Current File -----------------------------------------

command Open !xdg-open %
command OpenMarkdown MarkdownPreview

"Word Count ------------------------------------------------

command Wordcount :call WordCount()

function WordCount()
  if mode() == 'n'
    execute "normal g\<C-g>"
  elseif mode() == 'v'
    execute "visual g\<C-g>"
  endif
endfunction

"Transcription Maps ----------------------------------------

"set one space at start of next sentence
nnoremap <leader><BS> bf.whvblxi<SPACE><ESC>l

">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

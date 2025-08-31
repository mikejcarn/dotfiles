"COLORSCHEME CONFIG ==================================================

"ColorScheme Description: :h gui-colors

set termguicolors

"Colorscheme Tweaks for All Colorschemes
autocmd ColorScheme * highlight CursorLine guibg=NONE ctermbg=NONE | highlight SignColumn guibg=NONE ctermbg=NONE | highlight CursorLineNr guibg=NONE ctermbg=NONE | highlight StatusLine gui=bold | highlight StatusLineNC gui=italic 

colorscheme marakai

"Github Colorscheme Configs ------------------------------------------
let g:onedark_config = {
    \ 'style': 'deep',
\}

"Update lightline color with colorscheme change =====================
augroup LightLineColorscheme
  autocmd!
  autocmd ColorScheme * call s:colorscheme2lightline()
augroup END

function! s:colorscheme2lightline()
  if !exists('g:loaded_lightline')
    return
  endif
  try
    "Transparent Background
    if g:colors_name =~# 'morokai\|marakai\|codedark'
      hi Normal guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
      hi LineNr guibg=NONE ctermbg=NONE
      hi TabLineFill guibg=NONE ctermbg=NONE
      hi Directory guibg=NONE ctermbg=NONE
      call s:lightline_update()
      hi CocInfoSign guifg=#777777
      hi CocWarningSign guifg=#777777
    "Opaque Background
    elseif g:colors_name =~# 'sonokai\|everforest\|edge'
      call s:lightline_update()
    endif 
  catch
  endtry
endfunction

"Lightline Init Function
function! s:lightline_update()
      let g:lightline.colorscheme = substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '') 
      " call s:lightline_init()
      call lightline#init()
      call lightline#colorscheme()
      call lightline#update()
endfunction

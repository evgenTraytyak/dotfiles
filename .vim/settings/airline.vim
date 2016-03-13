" vim-airline
"-------------------------

" Colorscheme for airline
" https://github.com/joshdick/airline-onedark.vim
let g:airline_theme='onedark'

" Set custom left separator
let g:airline_left_sep = ''

" Set custom right separator
let g:airline_right_sep = ''

" Enable airline for tab-bar
let g:airline#extensions#tabline#enabled = 1

" Don't display buffers in tab-bar with single tab
let g:airline#extensions#tabline#show_buffers = 0

" Display only filename in tab
let g:airline#extensions#tabline#fnamemod = ':t'

" Powerline font support
let g:airline_powerline_fonts = 1

" Show branch
let g:airline#extensions#branch#enabled=1

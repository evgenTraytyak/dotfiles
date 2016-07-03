" General
"--------------------------------------------------

" Enable Indent in plugins
filetype plugin indent on

" Enable syntax highlighting
syntax on

" Auto reload changed files
set autoread

" Indicates fast terminal connection
set ttyfast

" Set character encoding to use in vim
set encoding=utf-8

" Let vim know what encoding we use in our terminal
set termencoding=utf-8

" Which EOl used. For us it's unix
" Not works with modifiable=no
if &modifiable
    set fileformat=unix
endif


" Display options
"--------------------------------------------------

" Hide showmode
" Showmode is useless with airline
set noshowmode

" Mute error bell
set novisualbell

" Enable display whitespace characters
set list

" Setting up how to display whitespace characters
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~

" Numbers of rows to keep to the left and to the right off the screen
set scrolloff=10

" Numbers of columns to keep to the left and to the right off the screen
set sidescrolloff=10

" Vim will move to the previous/next line after reaching first/last char in
" the line with this commnad (you can add 'h' or 'l' here as well)
" <,> stand for arrows in command mode and [,] arrows in visual mode
set whichwrap=b,s,<,>,[,],

" Display command which you typing and other command related stuff
set showcmd

" Indicate that last window have a statusline too
set laststatus=2

" The cursor should stay where you leave it, instead of moving to the first non
" blank of the line
set nostartofline

" Disable wrapping long string
set nowrap

" Display Line numbers
set number

" Highlight line with cursor
set cursorline

" Colorscheme
"--------------------------------------------------

let g:onedark_termcolors=16
let g:onedark_terminal_italics=1

" OneDark colorscheme https://github.com/joshdick/onedark.vim
colorscheme solarized

" highlight Comment ctermfg=darkGray ctermbg=lightGray

"--------------------------------------------------
" NeoBundle Init

" Use 256 colors in vim some plugins not work without it
set t_Co=256

" Turn off filetype plugins before bundles init
filetype off

" Auto installing NeoNeoBundle
let isNpmInstalled = executable("npm")
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    if !isNpmInstalled
        echo "==============================================="
        echo "Your need to install npm to enable all features"
        echo "==============================================="
    endif
    echo "Installing NeoBundle.."
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif

" Call NeoBundle
if has('vim_starting')
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand($HOME.'/.vim/bundle/'))

" Determine make or gmake will be used for making additional deps for Bundles
let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
    let g:make = 'make'
endif

"--------------------------------------------------
" Bundles

" Let NeoNeoBundle manage NeoNeoBundle
NeoBundle 'Shougo/neobundle.vim'

" Install vimproc. Is uses by unite and neocomplcache for async searches and calls
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'mac' : 'make -f make_mac.mak',
\     'unix': g:make
\    },
\ }

" Some support functions used by delimitmate, and snipmate
NeoBundle 'vim-scripts/tlib'

" Great file system explorer, it appears when you open dir in vim
" Allow modification of dir, and may other things
" Must have
NeoBundle 'scrooloose/nerdtree'

" Add smart commands for comments like:
" gcc - Toggle comment for the current line
" gc  - Toggle comments for selected region or number of strings
NeoBundle 'tomtom/tcomment_vim'

" Cool statusline for vim
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

" OneDark colorscheme for vim from Atom editor
NeoBundle 'joshdick/onedark.vim'

" Best git wrapper for vim
NeoBundle 'tpope/vim-fugitive'

" Shows a git diff in the 'gutter' (sign column)
NeoBundle 'airblade/vim-gitgutter'

" Editorconfig vim support
NeoBundle 'editorconfig/editorconfig-vim'

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"--------------------------------------------------
" Bundles settings

source ~/.dotfiles/.vim/settings/main.vim
source ~/.dotfiles/.vim/settings/nerdtree.vim
source ~/.dotfiles/.vim/settings/airline.vim
source ~/.dotfiles/.vim/settings/fugitive.vim

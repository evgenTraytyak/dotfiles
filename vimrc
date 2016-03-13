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

call neobundle#end()

" Enable Indent in plugins
filetype plugin indent on

" Enable syntax highlighting
syntax on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"--------------------------------------------------
" NeoBundle Init

" Use 256 colors in vim some plugins not work without it
set t_Co=256
set background=dark

set encoding=utf-8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

" Toggle auto-indenting for code paste
set tabstop=2
set expandtab
set backspace=2
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
NeoBundle 'mhartington/oceanic-next'

" Best git wrapper for vim
NeoBundle 'tpope/vim-fugitive'

" Shows a git diff in the 'gutter' (sign column)
NeoBundle 'airblade/vim-gitgutter'

" Editorconfig vim support
NeoBundle 'editorconfig/editorconfig-vim'

NeoBundle 'easymotion/vim-easymotion'

NeoBundle 'statianzo/vim-jade'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'ap/vim-css-color'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-surround'
NeoBundle 'isRuslan/vim-es6'

NeoBundle 'ryanoasis/vim-devicons'


" Ruby on Rails section
"--------------------------------------------------
" Slim lang syntax highlight
NeoBundle 'slim-template/vim-slim'
" Ruby on Rails power tools
NeoBundle 'tpope/vim-rails'
" Lightweight support for Ruby's Bundler
NeoBundle 'tpope/vim-bundler'

NeoBundle 'elixir-lang/vim-elixir'

NeoBundle 'slashmili/alchemist.vim'
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


" neosnippets

" Enable snipMate compatibility
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Disables standart snippets. We use vim-snippets bundle instead
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }

" Expand snippet and jimp to next snippet field on Enter key.
imap <expr><CR> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>""

"-------------------------
" neocomplcache

" Enable NeocomplCache at startup
let g:neocomplcache_enable_at_startup = 1

" Max items in code-complete
let g:neocomplcache_max_list = 10

" Max width of code-complete window
let g:neocomplcache_max_keyword_width = 80

" Code complete is ignoring case until no Uppercase letter is in input
let g:neocomplcache_enable_smart_case = 1

" Auto select first item in code-complete
let g:neocomplcache_enable_auto_select = 1

" Disable auto popup
let g:neocomplcache_disable_auto_complete = 1

" Smart tab Behavior
function! CleverTab()
    " If autocomplete window visible then select next item in there
    if pumvisible()
        return "\<C-n>"
    endif
    " If it's begining of the string then return just tab pressed
    let substr = strpart(getline('.'), 0, col('.') - 1)
    let substr = matchstr(substr, '[^ \t]*$')
    if strlen(substr) == 0
        " nothing to match on empty string
        return "\<Tab>"
    else
        " If not begining of the string, and autocomplete popup is not visible
        " Open this popup
        return "\<C-x>\<C-u>"
    endif
endfunction
inoremap <expr><TAB> CleverTab()

" Undo autocomplete
inoremap <expr><C-e> neocomplcache#undo_completion()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" For cursor moving in insert mode
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"

" disable preview in code complete
set completeopt-=preview

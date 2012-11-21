runtime bundle/pathogen/autoload/pathogen.vim

filetype off
call pathogen#infect()
call pathogen#helptags()

set nocompatible

syntax on
filetype on
filetype plugin indent on

set hidden
set textwidth=80
set autoindent
set cindent
set tabstop=8
set expandtab
set noerrorbells
set backup
set ruler
set showmode
highlight ModeMsg guibg=blue guifg=green gui=NONE cterm=NONE term=NONE
set wildignore=*.o,*.obj,*.class,*~,.bak,*.pyc,*.pyo,_build,dist,cabal-dev

set foldmethod=indent
set foldlevel=1
set foldcolumn=1

let g:tagbar_width=28

colorscheme two2tango

set autoread
set autowrite
"set nohlsearch
set incsearch
set showmatch
set ignorecase

set spell spelllang=en

let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 8

let &guicursor = &guicursor . ",a:blinkon0"

set encoding=utf-8

let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

nnoremap <m-Down> :cnext<cr>zvzz
nnoremap <m-Up> :cprevious<cr>zvzz

let g:ctrlp_map = '<c-t>'

" Remember last location in file, but not for commit messages.
" Seems not to work though...
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

" Python stuff
autocmd BufRead,BufNewFile *.py,*.pyx syntax on
autocmd BufRead,BufNewFile *.py,*.pyx set ai
autocmd BufRead,BufNewFile *.py,*.pyx set tabstop=4 expandtab shiftwidth=4
au BufRead,BufNewFile *.pyx set filetype=python

highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let python_highlight_all=1
let python_highlight_numbers=1
let python_highlight_builtins=1
let python_highlight_space_errors=1

let g:python_highlight_all=1

autocmd FileType python compiler pylint
let g:pylint_onwrite = 0

au FileType python set omnifunc=pythoncomplete#Complete

let g:pyflakes_use_quickfix = 0


" haskell stuff
let g:haskell_conceal_wide = 1
let g:neocomplcache_enable_at_startup = 1

let g:haddock_browser="xdg-open"
let g:haddock_indexfiledir="/home/nicolas/.vim/"

au Bufenter *.hs,*.lhs compiler ghc
autocmd BufWritePost *.hs GhcModCheckAndLintAsync

au FileType haskell let b:ghc_staticoptions = '-isrc -ibin'
let g:ghcmod_ghc_options = ['-isrc', '-ibin']
let g:ghcmod_use_basedir = getcwd()

au FileType haskell nnoremap <leader>t :GhcModType<cr>

" OCaml stuff
let g:syntastic_ocaml_use_ocamlbuild = 1

" gitv settings
let g:Gitv_OpenHorizontal = 1

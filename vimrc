" Set up vim-pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

" Set colorscheme
colorscheme flatlandia

" Basic settings
set textwidth=80
set autoindent
set cindent
set tabstop=8
set expandtab
set noerrorbells
set backup
set ruler
set showmode
set wildignore=*.o,*.obj,*.class,*~,.bak,*.pyc,*.pyo,_build,dist,cabal-dev

set foldmethod=indent
set foldlevel=2
set foldcolumn=1

set autoread
set autowrite
set incsearch
set showmatch
set ignorecase

set spell spelllang=en

let &guicursor = &guicursor . ",a:blinkon0"

set encoding=utf-8

" Tagbar
let g:tagbar_width=28

" OCaml
" Set up Merlin for OCaml support
let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','''') .  "/ocamlmerlin"
execute "set rtp+=".s:ocamlmerlin."/vim"
execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
let g:syntastic_ocaml_checkers = ['merlin']

let g:syntastic_ocaml_use_ocamlbuild = 1

" Python
au FileType python set tabstop=4 expandtab shiftwidth=4
au FileType python set omnifunc=pythoncomplete#Complete
let g:python_highlight_all=1

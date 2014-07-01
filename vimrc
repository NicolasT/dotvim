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

nnoremap <m-Down> :cnext<cr>zvzz
nnoremap <m-Up> :cprevious<cr>zvzz

" Git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Tagbar
let g:tagbar_width=28

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" OCaml
" Set up Merlin for OCaml support
let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','''') .  "/ocamlmerlin"
execute "set rtp+=".s:ocamlmerlin."/vim"
execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
let g:syntastic_ocaml_checkers = ['merlin']

let g:syntastic_ocaml_use_ocamlbuild = 1

let g:ocp_indent_vimfile = system("opam config var share")
let g:ocp_indent_vimfile = substitute(g:ocp_indent_vimfile, '[\r\n]*$', '', '')
let g:ocp_indent_vimfile = g:ocp_indent_vimfile . "/vim/syntax/ocp-indent.vim"

autocmd FileType ocaml exec ":source " . g:ocp_indent_vimfile

" Python
au FileType python set tabstop=4 expandtab shiftwidth=4
au FileType python set omnifunc=pythoncomplete#Complete
let g:python_highlight_all=1

" Haskell
au BufWritePost *.hs GhcModCheckAndLintAsync
au FileType haskell nnoremap <leader>t :GhcModType<cr>
au FileType haskell nnoremap <leader>T :GhcModTypeInsert<cr>
au FileType haskell set omnifunc=necoghc#omnifunc

let g:necoghc_enable_detailed_browse = 1

au FileType haskell nnoremap <silent> <leader>i :HoogleInfo<CR>

let g:cumino_default_terminal = "gnome-terminal"
let g:cumino_use_hsenv = 0
let g:cumino_use_cabal_repl = 1

" Support 'codex'
set tags=tags;/,codex.tags;/

" EasyMotion setup
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

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

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap call unite#filters#sorter_default#use(['sorter_rank'])

let g:unite_enable_start_insert = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'
let g:unite_prompt = '» '

nnoremap <C-P> :<C-u>Unite -start-insert buffer file_rec/async:!<cr>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <TAB>   <Plug>(unite_select_next_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

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

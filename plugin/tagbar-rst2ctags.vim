if executable('rst2ctags.py')
    let g:tagbar_type_rst = {
    \ 'ctagstype': 'rst',
    \ 'ctagsbin' : 'rst2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
            \ 's' : 'section',
    \ },
    \ 'sort': 0,
    \ }
endif


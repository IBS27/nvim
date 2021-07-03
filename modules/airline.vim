"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-airline statusbar Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0

" unicode symbols -> optional
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'

" airline symbols -> optional
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
" let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#tabline#formatter = 'default'
" let g:airline#extensions#tabline#left_sep = '' " -> optional

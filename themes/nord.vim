"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nord Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:nord_italic = 1
let g:nord_italic_comments = 0

augroup nord-theme-overrides
    autocmd!
    autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB " Use 'nord7' as foreground color for Vim comment titles.
    autocmd ColorScheme nord highlight IndentBlanklineContextChar ctermfg=4 guifg=#D8DEE9 " Set a color for context indent highlighting
augroup END


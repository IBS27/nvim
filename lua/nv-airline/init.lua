local cmd = vim.cmd
local g = vim.g

-- enable tabline
cmd "let g:airline#extensions#tabline#enabled = 1"
cmd "let g:airline#extensions#tabline#left_sep = ''"
cmd "let g:airline#extensions#tabline#left_alt_sep = ''"
cmd "let g:airline#extensions#tabline#right_sep = ''"
cmd "let g:airline#extensions#tabline#right_alt_sep = ''"

-- don't show buffers
cmd "let g:airline#extensions#bufferline#enabled = 0"
cmd "let g:airline#extensions#tabline#show_buffers = 0"

-- enable powerline fonts
g.airline_powerline_fonts = 1

-- set statusline separators
g.airline_left_sep = ''
g.airline_right_sep = ''

-- switch to current theme
g.airline_theme = 'base16_nord'

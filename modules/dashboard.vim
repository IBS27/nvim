"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Dashboard Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:dashboard_default_executive='telescope'

let g:dashboard_custom_section={
  \ 'a': {
    \ 'description': ['  Find File          '],
    \ 'command': 'Telescope find_files' },
  \ 'b': {
    \ 'description': ['  Recently Used Files'],
    \ 'command': 'Telescope oldfiles' },
  \ 'c': {
    \ 'description': ['  Load Last Session  '],
    \ 'command': 'SessionLoad' },
  \ 'd': {
    \ 'description': ['  Find Word          '],
    \ 'command': 'Telescope live_grep' },
  \ 'e': {
    \ 'description': ['  Settings           '],
    \ 'command': ':e ~/.config/nvim/init.vim' }
  \ }

let g:dashboard_custom_header = [
\ '',
\ '                                               ',
\ '        ███████████           █████      ██',
\ '       ███████████             █████ ',
\ '       ████████████████ ███████████ ███   ███████',
\ '      ████████████████ ████████████ █████ ██████████████',
\ '     █████████████████████████████ █████ █████ ████ █████',
\ '   ██████████████████████████████████ █████ █████ ████ █████',
\ '  ██████  ███ █████████████████ ████ █████ █████ ████ ██████',
\ '  ██████   ██  ███████████████   ██ █████████████████',
\ '  ██████   ██  ███████████████   ██ █████████████████ ',
\ '',
\ ]

let g:dashboard_custom_footer = [
\ '',
\ 'Github:  IBS27'
\ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neovim Tree-sitter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
}
EOF

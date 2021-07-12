-- General
require('settings')
require('plugins')
require('mappings')
require('neovide')

-- Plugins
require('nv-airline')
require('nv-autopairs')
require('nv-colorizer')
require('nv-dashboard')
require('nv-easymotion')
require('nv-floaterm')
require('nv-gitsigns')
require('nv-indentline')
require('nv-nvimtree')
require('nv-quickscope')
require('nv-sneak')
require('nv-spectre')
require('nv-treesitter')
require('nv-vimspector')

-- LSP
require('nv-compe')
require('nv-vsnip')
require('lsp')

-- Language Servers
require('lsp.clangd-ls')
require('lsp.css-ls')
require('lsp.html-ls')
require('lsp.json-ls')
require('lsp.lua-ls')
require('lsp.python-ls')
require('lsp.tsserver-ls')
require('lsp.vim-ls')

-- Colorscheme
vim.cmd("silent! colorscheme nord")

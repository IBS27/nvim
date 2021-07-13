-- General
require("settings")
require("plugins")
require("mappings")
require("neovide")

-- Plugins
require("nv-autopairs")
require("nv-colorizer")
require("nv-dashboard")
require("nv-easymotion")
require("nv-floaterm")
require("nv-formatter")
require("nv-gitsigns")
require("nv-indentline")
require("nv-nvimtree")
require("nv-quickscope")
require("nv-sneak")
require("nv-spectre")
require("nv-treesitter")
require("nv-vimspector")

-- Statusline and Bufferline
require("nv-galaxyline")
require("nv-bufferline")

-- LSP
require("lsp")
require("nv-lspsaga")
require("nv-compe")
require("nv-vsnip")

-- Language Servers
require("lsp.languages.clangd-ls")
require("lsp.languages.css-ls")
require("lsp.languages.html-ls")
require("lsp.languages.json-ls")
require("lsp.languages.lua-ls")
require("lsp.languages.python-ls")
require("lsp.languages.tsserver-ls")
require("lsp.languages.vim-ls")

-- Colorscheme
vim.cmd("silent! colorscheme onedark")
vim.cmd("let g:prettier#autoformat = 1")

print("Welcome to Neovim! Happy coding!")

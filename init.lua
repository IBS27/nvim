--  _____   _____   _____
-- |_   _| | ___ \ /  ___|    I B Srinivas
--   | |   | |_/ / \ `--.     Github: IBS27
--   | |   | ___ \  `--. \
--  _| |_  | |_/ / /\__/ /
--  \___/  \____/  \____/
--
-- A customized init.lua for neovim (https://neovim.io/)

-- General
require "settings"
require "plugins"
require "mappings"
require "neovide"

-- Plugins
require "nv-autopairs"
require "nv-colorizer"
require "nv-dashboard"
require "nv-floaterm"
require "nv-formatter"
require "nv-galaxyline"
require "nv-gitsigns"
require "nv-indentline"
require "nv-nvimtree"
require "nv-quickscope"
require "nv-sneak"
require "nv-telescope"
require "nv-todo"
require "nv-treesitter"
require "nv-trouble"
require "nv-whichkey"

-- LSP
require "lsp"
require "nv-lspsaga"
require "nv-compe"
require "nv-vsnip"
-- require "nv-luadev"

-- Language Servers
require "lsp.languages.clangd-ls"
require "lsp.languages.css-ls"
require "lsp.languages.html-ls"
require "lsp.languages.json-ls"
require "lsp.languages.lua-ls"
require "lsp.languages.python-ls"
require "lsp.languages.tsserver-ls"
require "lsp.languages.vim-ls"

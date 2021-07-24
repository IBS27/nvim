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
require "nv-galaxyline"
require "nv-indentline"
require "nv-quickscope"
require "nv-sneak"
require "nv-treesitter"

-- LSP
require "lsp"
require "nv-lspsaga"
require "nv-vsnip"

-- Language Servers
require "lsp.lang.clangd-ls"
require "lsp.lang.css-ls"
require "lsp.lang.html-ls"
require "lsp.lang.json-ls"
require "lsp.lang.lua-ls"
require "lsp.lang.python-ls"
require "lsp.lang.tsserver-ls"
require "lsp.lang.vim-ls"

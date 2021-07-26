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

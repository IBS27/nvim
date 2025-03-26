--  _____   _____   _____
-- |_   _| | ___ \ /  ___|    I B Srinivas
--   | |   | |_/ / \ `--.     Github: IBS27
--   | |   | ___ \  `--. \
--  _| |_  | |_/ / /\__/ /
--  \___/  \____/  \____/
--
-- A customized init.lua for neovim (https://neovim.io/)

-- Loading core config
require "user.launch"
require "user.options"
require "user.keymaps"
require "user.autocmds"

-- Adding plugins to lazy.nvim
spec "user.colorscheme"
spec "user.devicons"
spec "user.treesitter"
spec "user.mason"
spec "user.schemastore"
spec "user.lspconfig"
spec "user.cmp"
spec "user.telescope"
spec "user.none-ls"
spec "user.illuminate"
spec "user.gitsigns"
spec "user.whichkey"
spec "user.nvimtree"
spec "user.comment"
spec "user.lualine"
spec "user.navic"
spec "user.breadcrumbs"
spec "user.harpoon"
spec "user.autopairs"
spec "user.neogit"
spec "user.alpha"
spec "user.project"
spec "user.indentline"
spec "user.toggleterm"
spec "user.tmux"
spec "user.extras.bqf"
-- spec "user.extras.copilot"
spec "user.extras.tabby"
spec "user.extras.neoscroll"
spec "user.extras.oil"
spec "user.extras.ufo"
spec "user.extras.lab"
spec "user.extras.cellular-automaton"
spec "user.extras.eyeliner"
spec "user.extras.neotab"
spec "user.extras.gitlinker"
spec "user.extras.tabnine"
spec "user.extras.fidget"
spec "user.extras.colorizer"
spec "user.extras.dressing"
spec "user.extras.modicator"
spec "user.extras.navbuddy"

-- Loading lazy.nvim
require "user.lazy"

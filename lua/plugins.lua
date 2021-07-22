local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path }
  execute "packadd packer.nvim"
end

return require("packer").startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Intellisense
  use "neovim/nvim-lspconfig"
  use { "glepnir/lspsaga.nvim", event = "BufWinEnter" }
  use {
    "hrsh7th/nvim-compe",
    config = function()
      require("nv-compe").setup()
    end,
    event = "InsertEnter",
  }

  -- Lua development use "folke/lua-dev.nvim"

  -- Zen Mode
  use {
    "folke/zen-mode.nvim",
    event = "BufRead",
    cmd = "ZenMode",
  }

  -- Comment highlights
  use {
    "folke/todo-comments.nvim",
    config = function()
      require("nv-todo").setup()
    end,
    event = "BufRead",
  }

  -- Code Formatter
  use {
    "mhartington/formatter.nvim",
    config = function()
      require("nv-formatter").setup()
    end,
    event = "BufWinEnter",
  }

  -- Snippets
  use { "hrsh7th/vim-vsnip", event = "InsertEnter" }
  use { "hrsh7th/vim-vsnip-integ", event = "InsertEnter" }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("nv-gitsigns").setup()
    end,
    event = "BufRead",
  }

  -- LSP Diagnostics
  use {
    "folke/trouble.nvim",
    config = function()
      require("nv-trouble").setup()
    end,
    event = "BufWinEnter",
  }

  -- Which Key
  use {
    "folke/which-key.nvim",
    config = function()
      require("nv-whichkey").setup()
    end,
    event = "BufRead",
  }

  -- File-tree
  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("nv-nvimtree").setup()
    end,
    event = "BufWinEnter",
  }

  -- Auto pairs
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"

  -- Commentary
  use { "tpope/vim-commentary", cmd = "Commentary" }

  -- Statusline and Bufferline
  use "glepnir/galaxyline.nvim"
  use "romgrk/barbar.nvim"

  -- Telescope fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("nv-telescope").setup()
    end,
    requires = { "nvim-telescope/telescope-fzy-native.nvim", "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
  }

  -- Dashboard
  use { "glepnir/dashboard-nvim", event = "VimEnter" }

  -- Debugging
  use { "mfussenegger/nvim-dap", event = "BufWinEnter" }

  -- Window Maximizer
  use { "szw/vim-maximizer", cmd = "MaximizerToggle" }

  -- Neovim TreeSitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" }

  -- Colorizer
  use "norcalli/nvim-colorizer.lua"

  -- Indent guide
  use "lukas-reineke/indent-blankline.nvim"

  -- Find & Replace
  use { "windwp/nvim-spectre", event = "BufRead" }

  -- Better navigation
  use { "justinmk/vim-sneak", event = "BufWinEnter" }
  use { "unblevable/quick-scope", event = "BufWinEnter" }

  -- Floating terminal
  use { "voldikss/vim-floaterm", event = "BufWinEnter" }

  -- Ranger
  use { "kevinhwang91/rnvimr", cmd = "RnvimrToggle" }
end)

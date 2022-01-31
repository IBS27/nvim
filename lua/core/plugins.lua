local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path }
  execute "packadd packer.nvim"
end

require("packer").init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Completion & Snippets
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require "lsp"
    end,
  }
  use "williamboman/nvim-lsp-installer"
  use "glepnir/lspsaga.nvim"
  use {
    "hrsh7th/cmp-nvim-lsp",
    config = function()
      require "lsp.cmp"
    end,
    requires = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
    },
  }
  use { "dsznajder/vscode-es7-javascript-react-snippets", run = "yarn install --frozen-lockfile && yarn compile" }
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use "jose-elias-alvarez/null-ls.nvim"

  -- Colourscheme
  use "folke/tokyonight.nvim"
  use "sainnhe/everforest"
  use "sainnhe/sonokai"
  use "LunarVim/Colorschemes"

  -- Neovim TreeSitter
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugins.treesitter"
    end,
  }
  use { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" }

  -- Comment highlights
  use {
    "folke/todo-comments.nvim",
    config = function()
      require("plugins.todo").setup()
    end,
    event = "BufRead",
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.gitsigns").setup()
    end,
    event = "BufRead",
  }

  -- LSP Diagnostics
  use {
    "folke/trouble.nvim",
    config = function()
      require("plugins.trouble").setup()
    end,
    event = "BufRead",
  }

  -- Which Key
  use {
    "folke/which-key.nvim",
    config = function()
      require("plugins.whichkey").setup()
    end,
    event = "BufRead",
  }

  -- File-tree
  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require "plugins.nvimtree"
    end,
    -- event = "BufWinEnter",
  }

  -- Auto pairs
  use {
    "windwp/nvim-autopairs",
    -- after = "nvim-cmp",
    config = function()
      require "plugins.autopairs"
    end,
  }
  use { "windwp/nvim-ts-autotag", after = "nvim-cmp" }

  -- Commentary
  use { "tpope/vim-commentary", cmd = "Commentary" }

  -- Statusline and Bufferline
  use {
    "feline-nvim/feline.nvim",
    config = function()
      require("plugins.statusline").setup()
    end,
  }
  use {
    "akinsho/bufferline.nvim",
    config = function()
      require "plugins.bufferline"
    end,
  }

  -- Telescope fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins.telescope").setup()
    end,
    requires = { "nvim-telescope/telescope-fzy-native.nvim", "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
  }

  -- Dashboard
  use {
    "glepnir/dashboard-nvim",
    config = function()
      require "plugins.dashboard"
    end,
  }

  -- Window Maximizer
  use { "szw/vim-maximizer", cmd = "MaximizerToggle" }

  -- Colorizer
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
    event = "BufRead",
  }

  -- Indent guide
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require "plugins.indentline"
      vim.api.nvim_exec(
        [[
      augroup IndentBlanklineContextAutogroup
      autocmd!
      autocmd CursorMoved * IndentBlanklineRefresh
      augroup END
      ]],
        false
      )
    end,
  }

  -- Find & Replace
  use { "windwp/nvim-spectre", event = "BufRead" }

  -- Better navigation
  use { "justinmk/vim-sneak", event = "BufRead" }
  use { "unblevable/quick-scope", event = "BufRead" }

  -- Floating terminal
  use {
    "voldikss/vim-floaterm",
    config = function()
      vim.g.floaterm_gitcommit = "floaterm"
      vim.g.floaterm_autoinsert = 1
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_wintitle = 0
      vim.g.floaterm_autoclose = 1
    end,
    event = "BufWinEnter",
  }

  -- Ranger
  use { "kevinhwang91/rnvimr", cmd = "RnvimrToggle" }

  -- Minimap
  use {
    "wfxr/minimap.vim",
    config = function()
      vim.g.minimap_width = 15
    end,
    cmd = "MinimapToggle",
  }
end)

local M = {
  "folke/which-key.nvim",
  -- 'echasnovski/mini.nvim',
}

function M.config()
  local mappings = {
    q = { "<cmd>confirm q<CR>", "Quit" },
    h = { "<cmd>nohlsearch<CR>", "NOHL" },
    [";"] = { "<cmd>tabnew | terminal<CR>", "Term" },
    v = { "<cmd>vsplit<CR>", "Split" },
    b = { name = "Buffers" },
    d = { name = "Debug" },
    f = { name = "Find" },
    g = { name = "Git" },
    l = { name = "LSP" },
    p = { name = "Plugins" },
    t = { name = "Test" },
    a = {
      name = "Tab",
      n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
      N = { "<cmd>tabnew %<cr>", "New Tab" },
      o = { "<cmd>tabonly<cr>", "Only" },
      h = { "<cmd>-tabmove<cr>", "Move Left" },
      l = { "<cmd>+tabmove<cr>", "Move Right" },
    },
    T = { name = "Treesitter" },
  }

  local which_key = require "which-key"
  which_key.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    -- icons = {
    --   breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    --   separator = "➜", -- symbol used between a key and it's label
    --   group = "+", -- symbol prepended to a group
    -- },
    window = {
      border = "rounded",
      position = "bottom",
      padding = { 2, 2, 2, 2 },
    },
    ignore_missing = true,
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }

  which_key.register(mappings, opts)
end

-- Fixex whickey symbol not being displayed in italic colourscheme
local function set_separator_hl()
  local hl_cmt = vim.api.nvim_get_hl_by_name("Comment", true)
  local hl_sep = vim.tbl_extend("force", hl_cmt, {italic = false})
  return vim.api.nvim_set_hl(0, "WhichKeySeparator", hl_sep)
end

set_separator_hl()

do
  local group = vim.api.nvim_create_augroup("whichkey_setting", {clear = true})
  vim.api.nvim_create_autocmd({"ColorScheme"}, {pattern = {"*"}, callback = set_separator_hl, group = group})
end

return M

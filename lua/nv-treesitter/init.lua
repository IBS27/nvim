require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "python", "c", "cpp" },
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-d>",
      node_incremental = "<C-d>",
      scope_incremental = "<C-d>",
      node_decremental = "<C-d>",
    },
  },
}

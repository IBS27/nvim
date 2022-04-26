require("nvim-tree").setup {
  side = "left",
  auto_open = false,
  quit_on_open = false,
  update_focused_file = {
    enable = true,
  },
  git_hl = true,
  root_folder_modifier = ":t",
  tab_open = false,
  allow_resize = true,
  diagnostics = {
    enable = true,
  },
  filters = {
    custom = { ".git", "node_modules", ".cache", ".DS_Store" },
  },
  auto_ignore_ft = { "startify", "dashboard" },
  hijack_cursor = true,
  icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      deleted = "",
      untracked = "★",
      ignored = "",
    },
    folder = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
    },
  },
}
vim.g["nvim_tree_show_icons"] = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 0,
}

vim.g["nvim_tree_indent_markers"] = 1

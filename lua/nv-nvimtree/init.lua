local M = {}

require("nvim-tree").setup {
  side = "left",
  show_icons = {
    git = true,
    folders = true,
    files = true,
    tree_width = 30,
  },
  -- ignore = { ".git", "node_modules", ".cache", ".DS_Store" },
  gitignore = false,
  auto_open = false,
  auto_close = true,
  quit_on_open = false,
  update_focused_file = {
    enable = true,
  },
  hide_dotfiles = false,
  git_hl = true,
  root_folder_modifier = ":t",
  tab_open = false,
  allow_resize = true,
  diagnostics = {
    enable = true,
  },
  ignore_ft_on_setup = { ".git", "node_modules", ".cache", ".DS_Store" },
  auto_ignore_ft = { "startify", "dashboard" },
  hijack_cursor = true,
  indent_markers = true,
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

M.toggle_tree = function()
  local view_status_ok, view = pcall(require, "nvim-tree.view")
  if not view_status_ok then
    return
  end
  if view.win_open() then
    require("nvim-tree").close()
    if package.loaded["bufferline.state"] then
      require("bufferline.state").set_offset(0)
    end
  else
    if package.loaded["bufferline.state"] then
      -- require("bufferline.state").set_offset(31, "File Explorer")
      require("bufferline.state").set_offset(30, "")
    end
    require("nvim-tree").toggle()
  end
end

return M

local g = vim.g

g.nvim_tree_side = 'left'
g.nvim_tree_width = 30
g.nvim_tree_ignore = { '.git', '.cache', '.DS_Store' }
g.nvim_tree_gitignore = 0
g.nvim_tree_auto_open = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }
g.nvim_tree_quit_on_open = 0
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_root_folder_modifier = ':~'
g.nvim_tree_tab_open = 1
g.nvim_tree_width_allow_resize = 0
g.nvim_tree_disable_netrw = 1
g.nvim_tree_hijack_netrw = 1
g.nvim_tree_add_trailing = 0
g.nvim_tree_group_empty = 0
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_disable_window_picker = 1
g.nvim_tree_hijack_cursor = 1
g.nvim_tree_icon_padding = ' '
g.nvim_tree_update_cwd = 0
g.nvim_tree_window_picker_exclude = {
    filetype = {
        'packer',
        'qf'
    },
    buftype = {
        'terminal'
    }
}
g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' }
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
}

g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = ""
    }
}

vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', {noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFindFile<CR>', {noremap = true, silent = false })

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_bindings = {
    { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
    { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
    { key = "<C-v>",                        cb = tree_cb("vsplit") },
    { key = "<C-x>",                        cb = tree_cb("split") },
    { key = "t",                            cb = tree_cb("tabnew") },
    { key = "<",                            cb = tree_cb("prev_sibling") },
    { key = ">",                            cb = tree_cb("next_sibling") },
    { key = "P",                            cb = tree_cb("parent_node") },
    { key = "<BS>",                         cb = tree_cb("close_node") },
    { key = "<S-CR>",                       cb = tree_cb("close_node") },
    { key = "<Tab>",                        cb = tree_cb("preview") },
    { key = "K",                            cb = tree_cb("first_sibling") },
    { key = "J",                            cb = tree_cb("last_sibling") },
    { key = "I",                            cb = tree_cb("toggle_ignored") },
    { key = "H",                            cb = tree_cb("toggle_dotfiles") },
    { key = "R",                            cb = tree_cb("refresh") },
    { key = "a",                            cb = tree_cb("create") },
    { key = "d",                            cb = tree_cb("remove") },
    { key = "r",                            cb = tree_cb("rename") },
    { key = "<C-r>",                        cb = tree_cb("full_rename") },
    { key = "x",                            cb = tree_cb("cut") },
    { key = "c",                            cb = tree_cb("copy") },
    { key = "p",                            cb = tree_cb("paste") },
    { key = "y",                            cb = tree_cb("copy_name") },
    { key = "Y",                            cb = tree_cb("copy_path") },
    { key = "gy",                           cb = tree_cb("copy_absolute_path") },
    { key = "[c",                           cb = tree_cb("prev_git_item") },
    { key = "]c",                           cb = tree_cb("next_git_item") },
    { key = "-",                            cb = tree_cb("dir_up") },
    { key = "q",                            cb = tree_cb("close") },
    { key = "g?",                           cb = tree_cb("toggle_help") },
}
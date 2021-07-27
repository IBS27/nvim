local M = {}

M.config = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ...
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
    spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label group = "+", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 7, -- spacing between columns
  },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
}

M.opts = {
  mode = "n", -- NORMAL mode prefix = "<leader>",
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

M.vopts = {
  mode = "v", -- NORMAL mode prefix = "<leader>",
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

M.gopts = {
  mode = "n",
  prefix = "g",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

M.vmappings = {
  ["/"] = { ":Commentary<CR>", "Comment" },
}

M.mappings = {
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["/"] = { "<cmd>Commentary<CR>", "Comment" },
  ["e"] = { "<cmd>lua require'nv-nvimtree'.toggle_tree()<CR>", "Explorer" },
  ["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
  ["h"] = { "<cmd>noh<CR>", "No Highlight" },
  ["m"] = { "<cmd>MaximizerToggle<CR>", "Maximize Window" },
  ["r"] = { "<cmd>RnvimrToggle<CR>", "Ranger" },
  ["Z"] = { "<cmd>ZenMode<CR>", "Zen Mode" },
  [";"] = { "<cmd>Dashboard<CR>", "Dashboard" },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    r = { "<cmd>luafile ~/.config/nvim/init.lua<cr>", "Reload" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
    C = { "<cmd>PackerClean<cr>", "Clean" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
  },
  l = {
    name = "LSP",
    a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    e = {
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>silent Format<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = O.lsp.popup_border}})<cr>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = O.lsp.popup_border}})<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>silent lua require('lint').try_lint()<cr>", "Lint" },
    q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
    r = { "<cmd>Lspsaga rename<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    x = { "<cmd>Lspsaga signature_help<CR>", "Signature" },
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
    R = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
  },
  g = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    p = {
      "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
      "Colorscheme with Preview",
    },
  },
  T = {
    name = "Treesitter",
    i = { ":TSConfigInfo<cr>", "Info" },
  },
  b = {
    name = "Buffer",
    j = { "<cmd>BufferPick<CR>", "Jump to Buffer" },
    f = { "<cmd>Telescope buffers<CR>", "Find Buffer" },
    w = { "<cmd>BufferWipeout<CR>", "Wipeout Buffer" },
    c = { "<cmd>BufferClose<CR>", "Close Buffer" },
    h = { "<cmd>BufferMovePrevious<CR>", "Move Buffer Left" },
    l = { "<cmd>BufferMoveNext<CR>", "Move Buffer Right" },
    H = { "<cmd>BufferCloseBuffersLeft<cr>", "Close Buffers to the left" },
    L = { "<cmd>BufferCloseBuffersRight<cr>", "Close Buffers to the right" },
    D = { "<cmd>BufferOrderByDirectory<cr>", "Sort Buffers by directory" },
  },
  S = {
    name = "Spectre",
    S = { "<cmd>lua require('spectre').open()<CR>", "Search" },
    w = { "viw:lua require('spectre').open_visual()<CR>", "Search Word" },
    f = { "viw:lua require('spectre').open_file_search()<CR>", "Search in File" },
  },
  t = {
    name = "Terminal",
    g = { "<cmd>FloatermNew lazygit<CR>", "git" },
    n = { "<cmd>FloatermNew node<CR>", "node" },
    p = { "<cmd>FloatermNew python3<CR>", "python" },
    r = { "<cmd>FloatermNew ranger<CR>", "ranger" },
    t = { "<cmd>FloatermToggle<CR>", "toggle" },
    y = { "<cmd>FloatermNew ytop<CR>", "ytop" },
    s = { "<cmd>FloatermNew ncdu<CR>", "ncdu" },
    l = { "<cmd>FloatermNew live-server<CR>", "live-server" },
    R = { "<cmd>FloatermNew npm start<CR>", "react server" },
  },
  c = {
    name = "Run Code",
    c = { "<cmd>FloatermNew --autoclose=0 --name=C gcc % -o %< && ./%< <CR>", "C" },
    C = { "<cmd>FloatermNew --autoclose=0 --name=C++ g++ -std=c++20 % -o %< <CR>", "C++" },
    p = { "<cmd>FloatermNew --autoclose=0 --name=Python python3 % <CR>", "Python" },
    j = { "<cmd>FloatermNew --autoclose=0 --name=JavaScript node % <CR>", "JavaScript" },
    l = { "<cmd>FloatermNew --autoclose=0 --name=Lua lua % <CR>", "Lua" },
    m = { "<cmd>FloatermNew --autoclose=0 --name=Markdown grip<CR>", "Markdown" },
  },
  d = {
    name = "Debug",
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    q = { "<cmd>lua require'dap'.stop()<cr>", "Quit" },
  },
}

M.g_mappings = {
  ["s"] = { "Sneak Forward" },
  ["S"] = { "Sneak Backward" },
  ["c"] = { "Comment" },
}

M.setup = function()
  local status_ok, wk = pcall(require, "which-key")
  if not status_ok then
    return
  end

  wk.setup(M.config)

  wk.register(M.mappings, M.opts)
  wk.register(M.vmappings, M.vopts)
  wk.register(M.g_mappings, M.gopts)
end

return M

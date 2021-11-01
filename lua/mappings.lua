-- Map leader key
vim.g.mapleader = " "

-- better window movement
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Move lines
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv'", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv'", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>j", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>k", ":m .-2<CR>==", { noremap = true, silent = true })

-- New indented line
vim.api.nvim_set_keymap("i", "<S-CR>", "<CR><Esc>O", { noremap = false, silent = false })

-- Entering normal mode in terminal
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = false })

-- Using alt + hjkl to resize windows
vim.api.nvim_set_keymap("n", "<M-j>", ":resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-k>", ":resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-h>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-l>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- Compiling C/C++
vim.api.nvim_set_keymap("n", "<F8>", ":!gcc % -o %< <CR>", { noremap = false, silent = false })
vim.api.nvim_set_keymap("n", "<F7>", ":!g++ -std=c++20 % -o %< <CR>", { noremap = false, silent = false })

-- Buffer switch
vim.api.nvim_set_keymap("n", "L", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "H", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- LSP
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })

-- Snippets
vim.api.nvim_set_keymap("i", "<C-l>", "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", { expr = true })
vim.api.nvim_set_keymap("s", "<C-l>", "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", { expr = true })

-- Remaps for navigating completion menu
vim.cmd 'inoremap <expr> <c-j> ("\\<C-n>")'
vim.cmd 'inoremap <expr> <c-k> ("\\<C-p>")'

-- Hover documentation
local lsp = vim.lsp
local handlers = lsp.handlers

-- Hover doc popup
local pop_opts = { border = "shadow", max_width = 90, zindex = 100 }
handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)

vim.api.nvim_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

-- Scrolling hover documentation
vim.api.nvim_set_keymap(
  "n",
  "<C-f>",
  "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-b>",
  "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
  { noremap = true, silent = true }
)

-- jump diagnostic
vim.api.nvim_set_keymap("n", "[e", ":Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = true }) -- cursor
vim.api.nvim_set_keymap("n", "]e", ":Lspsaga diagnostic_jump_prev<CR>", { noremap = true, silent = true }) -- cursor

-- Behave vim
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

-- Keep it centered
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true })

-- Undo break points
vim.api.nvim_set_keymap("i", ",", ",<C-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", ".", ".<C-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", "!", "!<C-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", "?", "?<C-g>u", { noremap = true })

-- Jumplist mutations
vim.cmd [[nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k']]
vim.cmd [[nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j']]

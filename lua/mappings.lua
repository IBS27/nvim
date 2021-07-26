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

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv'", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv'", { noremap = true, silent = true })

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
vim.api.nvim_set_keymap("n", "L", ":BufferNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "H", ":BufferPrevious<CR>", { noremap = true, silent = true })

-- LSP
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })

-- Snippets
vim.api.nvim_set_keymap("i", "<C-l>", "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", { expr = true })
vim.api.nvim_set_keymap("s", "<C-l>", "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", { expr = true })

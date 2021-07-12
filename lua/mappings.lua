vim.g.mapleader = ' '

-- hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true })

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true })

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true })

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv\'', {noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv\'', {noremap = true, silent = true })

-- New indented line
vim.api.nvim_set_keymap('i', '<S-CR>', '<CR><Esc>O', {noremap = false, silent = false })

-- Commentary
vim.api.nvim_set_keymap('n', '<Leader>/', ':Commentary<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>/', ':Commentary<CR>', {noremap = true, silent = true })

-- Telescope command-line sugar
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', {noremap = true, silent = true })

-- Entering normal mode in terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = false })

-- Using alt + hjkl to resize windows
vim.api.nvim_set_keymap('n', '<M-j>', ':resize -2<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-k>', ':resize +2<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-h>', ':vertical resize -2<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize +2<CR>', {noremap = true, silent = true })

-- Compiling C/C++
vim.api.nvim_set_keymap('n', '<F8>', ':!gcc % -o %< <CR>', {noremap = false, silent = false })
vim.api.nvim_set_keymap('n', '<F7>', ':!g++ -std=c++20 % -o %< <CR>', {noremap = false, silent = false })

-- Close buffer
vim.api.nvim_set_keymap('n', '<Leader>c', ':bdelete<CR>', {noremap = true, silent = true })

-- Buffer switch
vim.api.nvim_set_keymap('n', 'L', ':BufferLineCycleNext<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'H', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true })

-- Buffer order change
vim.api.nvim_set_keymap('n', '<Leader><Leader>l', ':BufferLineMoveNext<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><Leader>h', ':BufferLineMovePrev<CR>', {noremap = true, silent = true })

-- Pick buffer
vim.api.nvim_set_keymap('n', 'gb', ':BufferLinePick<CR>', {noremap = true, silent = true })

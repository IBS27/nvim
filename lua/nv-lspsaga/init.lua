-- Signature help
vim.api.nvim_set_keymap("n", "gs", ":Lspsaga signature_help<CR>", {noremap = true, silent = true})

-- Remaps for navigating completion menu
-- vim.api.nvim_set_keymap("i", "<C-j>", "\\<C-n>", {expr = true, noremap = true, silent = true})
-- vim.api.nvim_set_keymap("i", "<C-k>", "\\<C-p>", {expr = true, noremap = true, silent = true})
vim.cmd 'inoremap <expr> <c-j> ("\\<C-n>")'
vim.cmd 'inoremap <expr> <c-k> ("\\<C-p>")'

-- Code actions
vim.api.nvim_set_keymap("n", "<Leader>ca", ":Lspsaga code_action<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<Leader>ca", ":<C-U>Lspsaga range_code_action<CR>", {noremap = true, silent = true})

-- Hover documentation
vim.api.nvim_set_keymap("n", "K", ":Lspsaga hover_doc<CR>", {noremap = true, silent = true})

-- Scrolling hover documentation
vim.api.nvim_set_keymap(
  "n",
  "<C-f>",
  "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<C-b>",
  "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
  {noremap = true, silent = true}
)

-- Rename
vim.api.nvim_set_keymap("n", "<Leader>gr", ":Lspsaga rename<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>gr", ":Lspsaga rename<CR>", {noremap = true, silent = true})

-- Preview definition
vim.api.nvim_set_keymap("n", "<Leader>gd", ":Lspsaga preview_definition<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>gd", ":Lspsaga preview_definition<CR>", {noremap = true, silent = true})

-- Diagnostics
-- show
vim.api.nvim_set_keymap("n", "<Leader>cd", ":Lspsaga show_line_diagnostics<CR>", {noremap = true, silent = true}) -- line
vim.api.nvim_set_keymap("n", "<Leader>cd", ":Lspsaga show_cursor_diagnostics<CR>", {noremap = true, silent = true}) -- cursor

-- jump diagnostic
vim.api.nvim_set_keymap("n", "[e", ":Lspsaga diagnostic_jump_next<CR>", {noremap = true, silent = true}) -- cursor
vim.api.nvim_set_keymap("n", "]e", ":Lspsaga diagnostic_jump_prev<CR>", {noremap = true, silent = true}) -- cursor

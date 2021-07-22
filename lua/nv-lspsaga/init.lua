-- Remaps for navigating completion menu
-- vim.api.nvim_set_keymap("i", "<C-j>", "\\<C-n>", {expr = true, noremap = true, silent = true})
-- vim.api.nvim_set_keymap("i", "<C-k>", "\\<C-p>", {expr = true, noremap = true, silent = true})
vim.cmd 'inoremap <expr> <c-j> ("\\<C-n>")'
vim.cmd 'inoremap <expr> <c-k> ("\\<C-p>")'

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

-- jump diagnostic
vim.api.nvim_set_keymap("n", "[e", ":Lspsaga diagnostic_jump_next<CR>", {noremap = true, silent = true}) -- cursor
vim.api.nvim_set_keymap("n", "]e", ":Lspsaga diagnostic_jump_prev<CR>", {noremap = true, silent = true}) -- cursor

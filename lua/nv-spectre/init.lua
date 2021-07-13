vim.api.nvim_set_keymap("n", "<Leader>S", ":lua require('spectre').open()<CR>", {noremap = true, silent = true})

-- search current word
vim.api.nvim_set_keymap(
  "n",
  "<Leader>sw",
  "viw:lua require('spectre').open_visual()<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("n", "<Leader>s", ":lua require('spectre').open_visual()<CR>", {noremap = true, silent = true})

-- search in current file
vim.api.nvim_set_keymap(
  "n",
  "<Leader>sp",
  "viw:lua require('spectre').open_file_search()<CR>",
  {noremap = true, silent = true}
)

vim.fn.sign_define("DapBreakpoint", {text = "🔴", texthl = "", linehl = "", numhl = ""})
vim.fn.sign_define("DapStopped", {text = "🟢", texthl = "", linehl = "", numhl = ""})

-- Stepping out, over and into
vim.api.nvim_set_keymap("n", "˚", ":lua require'dap'.step_out()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "-", ":lua require'dap'.step_into()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "ˍ", ":lua require'dap'.step_over()<CR>", {noremap = true, silent = true})

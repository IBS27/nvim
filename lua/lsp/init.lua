local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require "lsp.lsp-installer"
require("lsp.handlers").setup()
require "lsp.null-ls"
require "lsp.settings.tsserver"

-- LSP Keymaps
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true })
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true })
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", { noremap = true })
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]

-- Format on save
vim.api.nvim_exec(
    [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePre *.py,*.js,*.ts,*.css,*.scss,*.md,*.html,*.lua lua vim.lsp.buf.format()
augroup END
]],
    true
)

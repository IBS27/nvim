local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "lsp.lsp-installer"
require("lsp.handlers").setup()
require "lsp.null-ls"

-- Format on save
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePre *.py,*.js,*.ts,*.css,*.scss,*.md,*.html,*.lua : Format
augroup END
]],
  true
)

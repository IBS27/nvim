-- Tab size
vim.cmd "setl ts=2 sw=2 sts=2"

-- Autoformat
vim.cmd [[
augroup fmt
autocmd!
autocmd BufWritePre * Neoformat
augroup END
]]

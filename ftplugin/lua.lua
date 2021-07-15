-- TODO: Set the formatter to use 2 spaces
-- Tab size
vim.cmd "setl ts=4 sw=4 sts=4"

-- Autoformat
vim.cmd [[
augroup fmt
autocmd!
autocmd BufWritePre * Neoformat
augroup END
]]

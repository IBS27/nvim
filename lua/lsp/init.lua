vim.fn.sign_define(
  "LspDiagnosticsSignError",
  {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
)

vim.cmd 'command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()'

-- Go-to defenition, declaration, references and implementation
vim.api.nvim_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})

-- Set Default Prefix.
-- Note: You can set a prefix per lsp server in the lv-globals.lua file
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = {
      prefix = "",
      spacing = 0
    },
    signs = true,
    underline = true
  }
)

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
  "  ",
  "  ",
  "  ",
  "  ",
  " ﴲ ",
  "[]",
  "  ",
  " ﰮ ",
  "  ",
  " 襁",
  "  ",
  "  ",
  " 練",
  "  ",
  "  ",
  "  ",
  "  ",
  "  ",
  "  ",
  "  ",
  " ﲀ ",
  " ﳤ ",
  " ",
  " ",
  " "
}

-- auto-format
-- vim.cmd "autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)"
-- vim.cmd "autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)"

require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require "lspconfig"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.lua_ls.setup {
    settings = require "lsp.settings.lua_ls",
}
lspconfig.pyright.setup {}
lspconfig.solidity_ls.setup {
    capabilities = capabilities,
}
lspconfig.solang.setup {}
lspconfig.html.setup {
    capabilities = capabilities,
}
lspconfig.cssls.setup {
    capabilities = capabilities,
}
lspconfig.jsonls.setup {
    capabilities = capabilities,
}

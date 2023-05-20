require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").lua_ls.setup {
    settings = require "lsp.settings.lua_ls",
}
require("lspconfig").pyright.setup {
    require "lsp.settings.pyright",
}
require("lspconfig").solidity.setup {}
require("lspconfig").html.setup {
    capabilities = capabilities,
}
require("lspconfig").cssls.setup {
    capabilities = capabilities,
}
require("lspconfig").jsonls.setup {
    capabilities = capabilities,
}

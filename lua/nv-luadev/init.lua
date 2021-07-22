local luadev = require("lua-dev").setup({})

local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup(luadev)

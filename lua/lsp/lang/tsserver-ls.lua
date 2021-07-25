require("lspconfig").tsserver.setup {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  -- root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}

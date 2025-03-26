local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "html", "css", "java", "javascript", "typescript", "tsx" },
    highlight = { enable = true },
    indent = { enable = true },
  }
  require("nvim-ts-autotag").setup({})
end

return M

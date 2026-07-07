local M = {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
}

local parsers = {
  "bash",
  "c",
  "cpp",
  "css",
  "html",
  "java",
  "javascript",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "tsx",
  "typescript",
}

local highlight_filetypes = {
  "bash",
  "c",
  "cpp",
  "css",
  "html",
  "java",
  "javascript",
  "javascriptreact",
  "lua",
  "markdown",
  "python",
  "sh",
  "typescript",
  "typescriptreact",
}

local indent_filetypes = {
  "bash",
  "c",
  "cpp",
  "css",
  "html",
  "java",
  "javascript",
  "javascriptreact",
  "lua",
  "python",
  "sh",
  "typescript",
  "typescriptreact",
}

function M.config()
  local treesitter = require "nvim-treesitter"

  treesitter.setup {
    install_dir = vim.fn.stdpath "data" .. "/site",
  }
  treesitter.install(parsers)

  local group = vim.api.nvim_create_augroup("user_treesitter", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = highlight_filetypes,
    callback = function(args)
      pcall(vim.treesitter.start, args.buf)
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = indent_filetypes,
    callback = function(args)
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })

  require("nvim-ts-autotag").setup({})
end

return M

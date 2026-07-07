local M = {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
  require("kanagawa").setup {
    theme = "dragon",
  }

  vim.cmd.colorscheme "kanagawa-dragon"
end

return M

local M = {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000
}

function M.config()
  vim.cmd.colorscheme "gruvbox-material"
end

return M

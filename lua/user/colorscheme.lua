local M = {
  "Mofiqul/vscode.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  require("vscode").setup {
    disable_nvimtree_bg = true,
    underline_links = true,
    terminal_colors = true,

    color_overrides = {
      vscCursorDarkDark = "#252525",
    }
  }

  vim.cmd.colorscheme "vscode"
end

return M

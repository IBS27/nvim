local M = {
  "nvim-lualine/lualine.nvim",
}

local function lsp_clients()
  local clients = vim.lsp.get_clients { bufnr = 0 }

  if #clients == 0 then
    return ""
  end

  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end

  table.sort(names)
  return "LSP: " .. table.concat(names, ",")
end

function M.config()
  require("lualine").setup {
    options = {
      theme = "kanagawa",
      icons_enabled = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {},
      globalstatus = true,
      refresh = {
        statusline = 100,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = {
        {
          "filename",
          path = 1,
          symbols = {
            modified = " [+]",
            readonly = " [ro]",
            unnamed = "[No Name]",
            newfile = "[New]",
          },
        },
        "diagnostics",
      },
      lualine_x = {
        lsp_clients,
        "encoding",
        {
          "fileformat",
          icons_enabled = false,
        },
        "filetype",
      },
      lualine_y = { "searchcount", "selectioncount", "progress" },
      lualine_z = { "location" },
    },
    extensions = { "nvim-tree", "quickfix", "mason", "lazy", "toggleterm", "nvim-dap-ui" },
  }
end

return M

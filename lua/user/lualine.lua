local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
    "askfiy/visual_studio_code",
  },
}

function M.config()
  -- require("lualine").setup {
  --   options = {
  --     -- component_separators = { left = "", right = "" },
  --     -- section_separators = { left = "", right = "" },
  --     theme = "vscode",
  --     ignore_focus = { "NvimTree" },
  --   },
  --   sections = {
  --     lualine_a = {},
  --     lualine_b = { "branch" },
  --     lualine_c = { "diagnostics" },
  --     lualine_x = { "copilot", "filetype" },
  --     lualine_y = { "progress" },
  --     lualine_z = {},
  --   },
  --   extensions = { "quickfix", "man", "fugitive" },
  -- }
  require("lualine").setup {
    options = {
      theme = "visual_studio_code",
      icons_enabled = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {},
      globalstatus = true,
      refresh = {
        statusline = 100,
      },
    },
    sections = require("visual_studio_code").get_lualine_sections(),
  }
end

return M

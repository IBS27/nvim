-- Prettier function for formatter
local prettier = function()
  return {
    exe = "prettier",
    args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
    stdin = true,
  }
end

local M = {}

M.config = {
  logging = false,
  filetype = {
    javascript = { prettier },
    typescript = { prettier },
    html = {
      -- function()
      --   return {
      --     exe = "prettydiff",
      --     args = { "beautify", vim.api.nvim_buf_get_name(0), "options", "indent_size=2" },
      --     stdin = true,
      --   }
      -- end,
      prettier,
    },
    css = { prettier },
    scss = { prettier },
    markdown = { prettier },
    lua = {
      function()
        return {
          exe = "stylua",
          args = { "--config-path", "/Users/srinivasib/.config/nvim/.stylua.toml", vim.api.nvim_buf_get_name(0) },
          stdin = false,
        }
      end,
    },
    python = {
      function()
        return {
          exe = "black",
          args = {},
          stdin = false,
        }
      end,
    },
  },
}

M.setup = function()
  local status_ok, formatter = pcall(require, "formatter")
  if not status_ok then
    return
  end

  formatter.setup(M.config)
end

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.py,*.js,*.ts,*.css,*.scss,*.md,*.html,*.lua : FormatWrite
augroup END
]],
  true
)

return M

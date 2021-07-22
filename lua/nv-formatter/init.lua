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
    html = { prettier },
    css = { prettier },
    scss = { prettier },
    markdown = { prettier },
    lua = {
      -- luafmt
      function()
        return {
          exe = "stylua",
          args = { "--config-path", "/Users/srinivasib/.config/stylua.toml", vim.api.nvim_buf_get_name(0) },
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
  autocmd BufWritePost *.js,*.ts,*.css,*.scss,*.md,*.html,*.lua : FormatWrite
augroup END
]],
  true
)

return M

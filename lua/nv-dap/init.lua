local M = {}

M.config = {
  active = true,
  breakpoint = {
    text = "",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  },
}

M.setup = function()
  local status_ok, dap = pcall(require, "dap")
  if not status_ok then
    return
  end

  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "" })
  vim.fn.sign_define("DapStopped", { text = "", texthl = "#b2d77c", linehl = "", numhl = "" })
end

return M

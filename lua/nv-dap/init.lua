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

  local dap_install = require "dap-install"
  dap_install.config("python_dbg", {})
  dap_install.config("jsnode_dbg", {})
  dap_install.config("lua_dbg", {})
  dap_install.config("ccppr_lldb_dbg", {})

  vim.fn.sign_define("DapBreakpoint", { text = "ﴫ", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "" })
end

return M

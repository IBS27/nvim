local M = {}

M.setup = function()
  local dap_install = require "dap-install"
  dap_install.config("python_dbg", {})
  dap_install.config("jsnode_dbg", {})
  dap_install.config("lua_dbg", {})
  dap_install.config("ccppr_lldb_dbg", {})
end

return M

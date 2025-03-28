local M = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    {
      "Joakker/lua-json5",
      run = "./install.sh",
    },
  },
}

function M.config()
  local dap = require "dap"
  local dapui = require "dapui"

  require("dapui").setup()
  require("dap-python").setup("python3")

  vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

  vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg=0, fg='#E51500' })
  vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg=0, fg='#61afef' })
  vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg=0, fg='#98c379' })

  vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', numhl='DapBreakpoint' })
  vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', numhl='DapBreakpoint' })
  vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', numhl= 'DapBreakpoint' })
  vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
  vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

  require("nvim-dap-virtual-text").setup()

  dap.defaults.fallback.exception_breakpoints = { "uncaught" }

  -- Set keymaps
  vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Togggle UI" })
  vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
  vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Run/Continue" })
  vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step Into" })
  vim.keymap.set("n", "<leader>do", function() dap.step_out() end, { desc = "Step Out" })
  vim.keymap.set("n", "<leader>dO", function() dap.step_over() end, { desc = "Step Over" })
  vim.keymap.set("n", "<leader>dB", function() dap.step_back() end, { desc = "Step Back" })
  vim.keymap.set("n", "<leader>dP", function() dap.pause() end, { desc = "Pause" })
  vim.keymap.set("n", "<leader>dC", function() dap.run_to_cursor() end, { desc = "Run to Cursor" })
  vim.keymap.set("n", "<leader>dv", function() dapui.eval(nil, { enter = true }) end, { desc = "Evaluate Variable" })
  vim.keymap.set("n", "<leader>dg", function() dap.goto_() end, { desc = "Go to Line (No Execute)" })
  vim.keymap.set("n", "<leader>dj", function() dap.down() end, { desc = "Down" })
  vim.keymap.set("n", "<leader>dk", function() dap.up() end, { desc = "Up" })
  vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, { desc = "Run Last" })
  vim.keymap.set("n", "<leader>dr", function() dap.repl.toggle() end, { desc = "Toggle REPL" })
  vim.keymap.set("n", "<leader>ds", function() dap.session() end, { desc = "Session" })
  vim.keymap.set("n", "<leader>dt", function() dap.terminate() end, { desc = "Terminate" })
  vim.keymap.set("n", "<leader>dw", function() dap.ui.widgets.hover() end, { desc = "Widgets" })
  vim.keymap.set("n", "<leader>ddc", function()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
  end, { desc = "Conditional Breakpoint" })
  vim.keymap.set("n", "<Leader>ddC", function() dap.clear_breakpoints() end, { desc = "Clear all breakpoints" })
  vim.keymap.set("n", "<Leader>ddl", function() dap.list_breakpoints() end, { desc = "List all breakpoints" })

  for _, adapterType in ipairs { "node", "chrome", "msedge" } do
    local pwaType = "pwa-" .. adapterType

    dap.adapters[pwaType] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          vim.fn.stdpath "data" .. "/js-debug-adapter/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }

    -- this allow us to handle launch.json configurations
    -- which specify type as "node" or "chrome" or "msedge"
    dap.adapters[adapterType] = function(cb, config)
      local nativeAdapter = dap.adapters[pwaType]

      config.type = pwaType

      if type(nativeAdapter) == "function" then
        nativeAdapter(cb, config)
      else
        cb(nativeAdapter)
      end
    end
  end

  local enter_launch_url = function()
    local co = coroutine.running()
    return coroutine.create(function()
      vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:" }, function(url)
        if url == nil or url == "" then
          return
        else
          coroutine.resume(co, url)
        end
      end)
    end)
  end

  for _, language in ipairs { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" } do
    dap.configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file using Node.js (nvim-dap)",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach to process using Node.js (nvim-dap)",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
      -- requires ts-node to be installed globally or locally
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file using Node.js with ts-node/register (nvim-dap)",
        program = "${file}",
        cwd = "${workspaceFolder}",
        runtimeArgs = { "-r", "ts-node/register" },
      },
      {
        type = "pwa-chrome",
        request = "launch",
        name = "Launch Chrome (nvim-dap)",
        url = enter_launch_url,
        webRoot = "${workspaceFolder}",
        sourceMaps = true,
      },
    }
  end

  local convertArgStringToArray = function(config)
    local c = {}

    for k, v in pairs(vim.deepcopy(config)) do
      if k == "args" and type(v) == "string" then
        c[k] = require("dap.utils").splitstr(v)
      else
        c[k] = v
      end
    end

    return c
  end

  for key, _ in pairs(dap.configurations) do
    dap.listeners.on_config[key] = convertArgStringToArray
  end

  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end


  local continue = function()
    -- support for vscode launch.json is partial.
    -- not all configuration options and features supported
    if vim.fn.filereadable ".vscode/launch.json" then
      require("dap.ext.vscode").load_launchjs()
    end
    dap.continue()
  end

  vim.keymap.set("n", "<Leader>da", continue, { desc = "Continue With Args" })
end

return M

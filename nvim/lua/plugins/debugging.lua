return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio'
  },
  keys = {
    -- normal mode is default
    { "<leader>ui", function() require 'dapui'.toggle() end },
    { "<leader>b", function() require 'dap'.toggle_breakpoint() end },
    { "<leader>B", function() require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition:')) end },
    { "<F5>",      function() require 'dap'.continue() end },
    { "<F10>",     function() require 'dap'.step_over() end },
    { "<F11>",     function() require 'dap'.step_into() end },
    { "<F12>",     function() require 'dap'.step_out() end },
  },
  config = function()
    local dap = require('dap')

    local js_based_languages = { "typescript", "javascript", "typescriptreact" }

    for _, language in ipairs(js_based_languages) do
      require("dap").configurations[language] = {
        {
          name = 'Launch file in new node process',
          type = 'pwa-node',
          request = 'launch',
          program = '${file}',
          port = 9222,
          rootPath = '${workspaceFolder}',
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          skipFiles = { '<node_internals>/**' },
          protocol = 'inspector',
          console = 'integratedTerminal',
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Auto Attach",
          cwd = "${workspaceFolder}/src",
          sourceMaps = true,
          processId = require 'dap.utils'.pick_process,
          skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
          resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**" },
        },
        {
          type = "pwa-chrome",
          name = "Launch Chrome to debug client",
          request = "launch",
          url = "http://localhost:5173",
          webRoot = "${workspaceFolder}/src",
          -- skip files from vite's hmr
          skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
          userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
        },
      }
    end

    require("dapui").setup()
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({ reset = true })
    end
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
  end
}

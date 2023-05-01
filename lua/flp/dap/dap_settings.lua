local adapters = {

}
adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = { os.getenv("HOME") .. "/js-debug/src/dapDebugServer.js", "${port}" },
  }
}

local configs = {
  typescript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}"
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require "dap.utils".pick_process,
      cwd = "${workspaceFolder}"
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "--inspect-brk",
        "./node_modules/jest/bin/jest.js",
        "--runInBand",
        "${file}"
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen"
    }
  },
  javascript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}"
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require "dap.utils".pick_process,
      cwd = "${workspaceFolder}"
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand"
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen"
    }
  },
  rust = {
    {
      name = "Launch build",
      type = "codelldb",
      request = "launch",
      cargo = {
        args = { "build" }
      },
      cwd = "${workspaceFolder}",
      stopOnEntry = true
    },
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = true
    }
  },
  go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}"
    },
    {
      type = "go",
      name = "Debug test", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${file}"
    },
    -- works with go.mod packages and sub packages
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}"
    }
  }
}

return {
  adapters = adapters,
  configuration = configs
}

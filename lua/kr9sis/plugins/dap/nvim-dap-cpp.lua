return {
  "mfussenegger/nvim-dap",
  ft = { "cpp", "c" },
  event = { "BufReadPre", "BufNewFile", "VeryLazy" },
  config = function()
    local dap = require("dap")

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
        env = {
          LLDB_LIBRARY_PATH = "/usr/local/lib/lldb/lib/liblldb.so", -- Updated path for lldb
          RUST_BACKTRACE = "1",
        },
      },
    }

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
      },
      {
        name = "Attach to process",
        type = "codelldb",
        request = "attach",
        pid = require("dap.utils").pick_process,
        args = {},
      },
    }

    -- Also support C files
    dap.configurations.c = dap.configurations.cpp
  end,
}

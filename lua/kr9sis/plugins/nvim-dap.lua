return {
  "rcarriga/nvim-dap-ui",
  event = { "BufReadPre", "BufNewFile", "VeryLazy" },
  dependencies = {
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap",
  },
  keys = {
    { "<leader>dt", "<cmd>DapUiToggle<CR>", desc = "Toggle debug menu" },
    { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle breakpoint at cursor" },
    { "<leader>dc", "<cmd>DapContinue<CR>", desc = "Continue execution to the next breakpoint" },
    { "<leader>do", "<cmd>lua require('dap').step_over()<CR>", desc = "Step forward in debug mode" },
    { "<leader>di", "<cmd>DapStepInto<CR>", desc = "Step into functions in debug mode" },

    {
      "<leader>dB",
      "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
      desc = "Set conditional breakpoint",
    },

    {
      "<leader>dR",
      "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
      desc = "Inspect state with REPL",
    },
    { "<leader>dr", "<cmd>lua require('dapui').open({ reset = true })<CR>", desc = "Reset debug UI" },
  },
  config = function()
    local dap_ui = require("dapui")
    dap_ui.setup()

    vim.api.nvim_create_user_command("DapUiToggle", function()
      require("dapui").toggle()
    end, { nargs = 0 })
  end,
}

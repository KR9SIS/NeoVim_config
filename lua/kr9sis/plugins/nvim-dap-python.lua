return {
  "mfussenegger/nvim-dap-python",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    local dap_python = require("dap-python")

    dap_python.setup("~/.virtualenv/debugpy/bin/python")
  end,
}
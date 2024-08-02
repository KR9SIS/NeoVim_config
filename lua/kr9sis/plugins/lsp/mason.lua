return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver", -- TypeScript
        "html", -- HTML
        "cssls", -- CSS
        "tailwindcss", -- CSS
        "lua_ls", -- Lua
        "pyright", -- Python
        "clangd", -- C
        "gopls", -- Go
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- Javascript, HTML, CSS
        "eslint_d", -- Javascript
        "stylua", -- Lua
        "clang-format", -- C
        "sqlfmt", -- SQL
        "pylint", -- Python
        "isort", -- Python
        "black", -- Python
        "debugpy", -- Python

        "gofumpt", -- Go
      },
    })
  end,
}

local on_attach = require("lazyvim.plugins.formatting").on_attach

local lsp_servers = {
  "pyright",
  "lua_ls",
  "clangd",
  "cmake",
  "dockerls",
}
local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "mypy",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lsp = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      require("mason-lspconfig").setup({
        ensure_installed = lsp_servers,
      })
      -- Lua config
      lsp["lua_ls"].setup({
        settings = {
          Lua = {
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "lua" },
          },
        },
      })
      -- Python config
      lsp["pyright"].setup({
        settings = {
          python = {
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "python" },
          },
        },
      })
      -- C/C++ config
      lsp["clangd"].setup({
        settings = {
          clangd = {
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "c", "cpp" },
          },
        },
      })
    end,
  },
}
return plugins

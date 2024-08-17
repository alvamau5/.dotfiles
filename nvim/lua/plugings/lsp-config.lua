return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    config = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.set_sign_icons({
        error = "",
        warn = "",
        hint = "",
        info = ""
      })

      lsp_zero.setup()

      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = false,
        underline = true,
        update_in_insert = false,
        float = {
          source = "always", -- Or "if_many"
        },
      })
    end
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local lsp_zero = require("lsp-zero")
      require("mason-lspconfig").setup({
        ensure_installed = { "tsserver", "eslint", "lua_ls" },
        automatic_installation = false,
        automatic_setup = true,
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.solargraph.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

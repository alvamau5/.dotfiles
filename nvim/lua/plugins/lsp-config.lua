return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.set_sign_icons({
        error = "",
        warn = "",
        hint = "󰠠",
        info = "",
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
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local lsp_zero = require("lsp-zero")
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "eslint", "lua_ls" },
        automatic_installation = false,
        automatic_setup = true,
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
          end,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()
      local navic = require("nvim-navic")

      vim.lsp.config("tsserver", {
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
          end
        end,
        flags = { debounce_text_changes = 300 },
      })
      vim.lsp.enable({ "tsserver" })

      vim.lsp.config("html", {
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
          end
        end,
        flags = { debounce_text_changes = 300 },
      })
      vim.lsp.enable({ "html" })

      vim.lsp.config("lua_ls", {
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
          end
        end,
        flags = { debounce_text_changes = 300 },
      })
      vim.lsp.enable({ "lua_ls" })

      vim.lsp.config("jsonls", {
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
          end
        end,
      })
      vim.lsp.enable({ "jsonls" })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

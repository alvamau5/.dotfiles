return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local formatting = null_ls.builtins.formatting
    --local diagnostics = null_ls.builtins.diagnostics
    local completion = null_ls.builtins.completion
    local null_sources = {
      completion.spell,
      --diagnostics.eslint,
      formatting.prettier,
      formatting.stylua.with({ extra_args = { "--indent_type", "Spaces", "indent_width", "2" } }),
    }

    local function format_on_save(client, bufnr)
      if client.supports_method('textDocument/formatting') then
        vim.api.nvim_clear_autocmds({
          group = augroup,
          buffer = bufnr,
        })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end

    null_ls.setup({
      debug = false,
      sources = null_sources,
      on_attach = format_on_save
    })

    -- null_ls.setup({
    --   sources = {
    --     null_ls.builtins.formatting.stylua,
    --     null_ls.builtins.formatting.prettier,
    --     null_ls.builtins.diagnostics.eslint_d,
    --   },
    -- })
    --
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}

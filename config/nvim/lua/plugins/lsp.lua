return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'mason-org/mason.nvim',
      opts = {
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      },
    },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'saghen/blink.cmp',
  },
  config = function()
    local langs = require('config.languages').load()

    local function unified_hover()
      local bufnr = vim.api.nvim_get_current_buf()
      local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
      local diagnostics = vim.diagnostic.get(bufnr, { lnum = lnum })
      local clients = vim.lsp.get_clients { bufnr = bufnr }
      local enc = clients[1] and clients[1].offset_encoding or 'utf-16'
      local params = vim.lsp.util.make_position_params(0, enc)
      local severity = { 'Error', 'Warn', 'Info', 'Hint' }

      vim.lsp.buf_request_all(bufnr, 'textDocument/hover', params, function(results)
        local lines = {}
        for _, d in ipairs(diagnostics) do
          local tag = severity[d.severity] or 'Diagnostic'
          if d.source then
            tag = tag .. ' (' .. d.source .. (d.code and (': ' .. tostring(d.code)) or '') .. ')'
          end
          table.insert(lines, '**' .. tag .. '**')
          vim.list_extend(lines, vim.split(d.message, '\n', { trimempty = false }))
          table.insert(lines, '')
        end

        local hover_lines = {}
        for _, res in pairs(results or {}) do
          if res.result and res.result.contents then
            vim.list_extend(hover_lines, vim.lsp.util.convert_input_to_markdown_lines(res.result.contents))
          end
        end
        if #hover_lines > 0 then
          if #lines > 0 then table.insert(lines, '---') end
          vim.list_extend(lines, hover_lines)
        end

        while #lines > 0 and lines[#lines] == '' do table.remove(lines) end
        if #lines == 0 then return end

        vim.lsp.util.open_floating_preview(lines, 'markdown', {
          border = 'rounded',
          focusable = true,
          focus_id = 'unified-hover',
          max_width = 90,
        })
      end)
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentSymbolProvider then
          require('nvim-navic').attach(client, event.buf)
        end

        local map = function(keys, fn, desc)
          vim.keymap.set('n', keys, fn, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        -- Nuevos (charliesbot)
        map('gd', vim.lsp.buf.definition, 'Goto definition')
        map('gD', vim.lsp.buf.declaration, 'Goto declaration')
        map('gh', unified_hover, 'Hover (type + diagnostics)')
        -- Tuyos, conservados
        map('K', vim.lsp.buf.hover, 'Hover')
        map('<leader>gd', vim.lsp.buf.definition, 'Goto definition')
        map('<leader>gr', vim.lsp.buf.references, 'References')
        map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
      end,
    })

    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.HINT] = '󰠠',
          [vim.diagnostic.severity.INFO] = '',
        },
      },
      virtual_text = true,
    }

    local capabilities = require('blink.cmp').get_lsp_capabilities()
    vim.lsp.config('*', { capabilities = capabilities })
    for name, cfg in pairs(langs.servers) do
      vim.lsp.config(name, cfg)
    end


    local server_names = vim.tbl_keys(langs.servers)
    require('mason-lspconfig').setup {
      ensure_installed = server_names,
      automatic_enable = server_names,
    }
    require('mason-tool-installer').setup { ensure_installed = langs.mason }
  end,
}

return {
  'sagebind/blink.nvim',
  version = '1.*',
  dependencies = {
    {
    'L3MON4D3/LuaSnip',
      version = '2.*',
      build = 'make install_jsregexp',
      dependencies = {
        'rafamadriz/friendly-snippets',
        'mlaursen/vim-react-snippets',
      },
      opts = {}
      config = function(_, opts)
        require('luasnip').setup(opts)

        -- Carga los snippets de friendly-snippets (formato VS Code)
        require('luasnip.loaders.from_vscode').lazy_load()

        -- vim-react-snippets tiene su propio setup con opciones
        require('vim-react-snippets').setup {
          readonly_props = true,
          test_framework = '@jest/globals',
          test_renderer_path = '@testing-library/user-event',
        }
      end,
    }
    'folke/lazydev.nvim',
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'none', -- sin preset: solo tus teclas, nada asignado por defecto

      ['<C-m>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },

      ['<Tab>'] = { 'select_next', 'show', 'fallback' },
      ['<S-Tab>'] = { 'select_prev' },
    },
    completion = { documentation = { auto_show = true } },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
  },
}

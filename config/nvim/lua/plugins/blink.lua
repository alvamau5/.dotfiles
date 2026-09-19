return {
  {
    'saghen/blink.cmp',
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
        opts = {},
        config = function(_, opts)
          require('luasnip').setup(opts)
          require('luasnip.loaders.from_vscode').lazy_load()
          require('vim-react-snippets').setup {
            readonly_props = true,
            test_framework = '@jest/globals',
            test_renderer_path = '@testing-library/user-event',
          }
        end,
      },
    },
    opts = {
      keymap = {
        preset = 'none',
        ['<C-m>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'select_next', 'show', 'fallback' },
        ['<S-Tab>'] = { 'select_prev' },
      },
      completion = { documentation = { auto_show = true } },
      sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
      snippets = { preset = 'luasnip' },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      signature = { enabled = true },
    },
  },

  {
    'github/copilot.vim',
    event = 'InsertEnter',
  },
}

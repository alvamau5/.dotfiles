return {
  server = {
    name = 'lua_ls',
    settings = {
      Lua = {
        completion = { callSnippet = 'Replace' },
      },
    },
  },
  mason = { 'stylua' },
  parsers = { 'lua', 'luadoc' },
  formatters = { lua = { 'stylua' } },
}

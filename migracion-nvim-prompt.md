# Migración Neovim: unificar LSP/completado/formateo en nvim-test

## Contexto

Trabaja exclusivamente dentro de `~/.config/nvim-test` (copia aislada de mi
config real vía NVIM_APPNAME=nvim-test). NO toques `~/.config/nvim`.
Antes de empezar, confirma que `~/.config/nvim-test` existe y es una copia
de mi config actual; si no existe, créala con:
cp -r ~/.config/nvim ~/.config/nvim-test

Dentro de mi repo de dotfiles, trabaja en la rama `nvim-backup`
(créala si no existe, partiendo de `default`).

## Objetivo

Reemplazar mi stack actual (lsp-zero.nvim + nvim-cmp + none-ls.nvim) por:
blink.cmp + LuaSnip (motor) + native vim.lsp.config/vim.lsp.enable +
un loader de lenguajes por archivo + conform.nvim.

## Archivos a BORRAR

- lua/plugins/autocomplete.lua
- lua/plugins/lsp-config.lua
- lua/plugins/none-ls.lua

## Archivos a CREAR

### lua/plugins/blink.lua

- saghen/blink.cmp, version '1.*'
- Dependencia: L3MON4D3/LuaSnip version '2.*', build 'make install_jsregexp'
- snippets = { preset = 'luasnip' }
- sources.default = { 'lsp', 'path', 'snippets', 'buffer' }
- Mantén github/copilot.vim en un archivo aparte (plugins/copilot.lua) sin
  tocarlo, tal cual estaba en mi autocomplete.lua original.
- Conserva las dependencias de snippets que ya tenía LuaSnip:
  rafamadriz/friendly-snippets y mlaursen/vim-react-snippets (con sus
  opts: readonly_props=true, test_framework='@jest/globals',
  test_renderer_path='@testing-library/user-event'). Carga
  friendly-snippets con require('luasnip.loaders.from_vscode').lazy_load().

### lua/config/languages.lua

Loader que lee lua/languages/_.lua vía
vim.api.nvim_get_runtime_file('lua/languages/_.lua', true), agrega
`server` (string o tabla con name+settings), `mason` (lista de
herramientas) y `formatters` (tabla por filetype) de cada archivo, y
expone M.load() devolviendo { servers, mason, formatters }.

### lua/languages/lua.lua

server = { name='lua_ls', settings={ Lua={ completion={ callSnippet='Replace' } } } }
mason = { 'stylua' }
formatters = { lua = { 'stylua' } }

### lua/languages/typescript.lua

server = 'ts_ls' -- NUNCA 'tsserver', es el nombre deprecado
mason = { 'prettierd' }
formatters = { typescript={'prettierd'}, typescriptreact={'prettierd'}, javascript={'prettierd'} }

### lua/languages/html.lua

server = 'html'

### lua/languages/json.lua

server = 'jsonls'

### lua/languages/eslint.lua

server = 'eslint'

### lua/plugins/lsp.lua

Basado en neovim/nvim-lspconfig con dependencias: mason-org/mason.nvim,
mason-org/mason-lspconfig.nvim, WhoIsSethDaniel/mason-tool-installer.nvim,
j-hui/fidget.nvim (SIN tag fijo, usar la versión más reciente), saghen/blink.cmp.

Debe incluir, literal:

- función unified_hover() (combina vim.diagnostic.get + textDocument/hover
  en un solo floating preview con border='rounded')
- autocmd LspAttach con keymaps de buffer: 'gd' -> vim.lsp.buf.definition,
  'gD' -> vim.lsp.buf.declaration, 'gh' -> unified_hover
- DENTRO del mismo autocmd LspAttach: adjuntar nvim-navic solo si
  client.server_capabilities.documentSymbolProvider es true (usar
  client:supports_method donde aplique, NO client.supports_method,
  que está deprecado desde Nvim 0.11)
- vim.diagnostic.config con:
  severity_sort=true, float={border='rounded', source='if_many'},
  underline={severity=vim.diagnostic.severity.ERROR},
  virtual_text = true, -- IMPORTANTE: true, no false
  signs.text usando estos íconos exactos (los que ya tenía en lsp-zero):
  ERROR = '', WARN = '', HINT = '󰠠', INFO = ''
- capabilities = require('blink.cmp').get_lsp_capabilities(), aplicado
  con vim.lsp.config('*', {capabilities=capabilities})
- loop `for name, cfg in pairs(langs.servers) do vim.lsp.config(name, cfg) end`
- mason-lspconfig.setup con ensure_installed = vim.tbl_keys(langs.servers)
  y automatic_enable = esa misma lista (NO automatic_enable = true)
- mason-tool-installer.setup con ensure_installed = langs.mason

### lua/plugins/lsp.lua (nota adicional)

En la dependencia de mason-org/mason.nvim, usar estos íconos en vez de
opts={}:
ui.icons.package_installed = '✓'
ui.icons.package_pending = '➜'
ui.icons.package_uninstalled = '✗'

### lua/plugins/conform.lua

stevearc/conform.nvim, event='BufWritePre', cmd='ConformInfo',
keymap '<leader>gf' (mismo atajo que usaba antes, en vez de <leader>f)
llamando require('conform').format{async=true, lsp_format='fallback'}.
config: format_on_save={timeout_ms=500, lsp_format='fallback'},
formatters_by_ft = require('config.languages').load().formatters

## Archivos a EDITAR

### lua/plugins/navic.lua

- Cambiar `lazy = false` a `lazy = true`
- ELIMINAR el bloque `Snacks.util.lsp.on(...)` completo dentro de opts()
  (queda duplicado con el attach que ahora vive en lsp.lua)
- Mantener el resto (iconos, separator, highlight, etc.) intacto

## Validación al terminar

1. Corre `:Lazy clean` y confirma que se desinstalan: lsp-zero.nvim,
   hrsh7th/nvim-cmp, hrsh7th/cmp-nvim-lsp, saadparwaiz1/cmp_luasnip,
   nvimtools/none-ls.nvim
2. Corre `:checkhealth vim.deprecated` — no debe haber warnings de
   client.supports_method
3. Abre un archivo .ts y confirma con `:LspInfo` que el cliente activo
   se llama `ts_ls`, NUNCA `tsserver`
4. Guarda ese archivo .ts y confirma que se formatea automáticamente
   (conform.nvim vía format_on_save)
5. Provoca un error de sintaxis a propósito y confirma que aparece el
   texto inline (virtual_text) Y que 'gh' abre el popup combinado
6. Reporta cualquier archivo donde tuviste que adivinar algo que no
   estaba especificado aquí, en vez de asumir silenciosamente.

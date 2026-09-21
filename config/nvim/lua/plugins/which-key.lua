-- which-key: when you pause on a prefix key (leader, g, s, [, ]...), a popup lists
-- every key that can follow, with its description. It reads the `desc` set on our
-- keymaps, so it is a live, self-updating cheatsheet. Discovery-only: type the
-- sequence quickly and no popup appears.
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    spec = {
      { '<leader>x', group = 'Diagnostics' }, -- xx, xX (snacks.lua)
      { '<leader>g', group = 'LSP / Format' }, -- gd, gr, ca... (lsp.lua), gf (conform.lua)
      { '<leader>v', group = 'Split' }, -- v, V (keymaps.lua)
      { '<leader>r', group = 'Review' }, -- rd (codediff.lua)
    },
  },
}

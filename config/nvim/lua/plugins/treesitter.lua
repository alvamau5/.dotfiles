return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      local base = { 'vimdoc', 'html', 'css', 'json', 'pug' }
      local parsers = vim.list_extend(base, require('config.languages').load().parsers)

      require('nvim-treesitter').setup {}
      require('nvim-treesitter').install(parsers)
      vim.treesitter.language.register('bash', 'zsh')

      vim.api.nvim_create_autocmd('FileType', {
        pattern = parsers,
        callback = function() vim.treesitter.start() end,
      })
      vim.api.nvim_create_autocmd('FileType', {
        pattern = parsers,
        callback = function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'windwp/nvim-ts-autotag',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },
}

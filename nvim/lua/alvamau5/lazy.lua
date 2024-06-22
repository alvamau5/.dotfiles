local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  --custmo UI
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function()
      require("fidget").setup {
        -- options
      }
    end,
  },
  'goolord/alpha-nvim',
  'romgrk/barbar.nvim',
  'lewis6991/gitsigns.nvim',
  'navarasu/onedark.nvim',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'echasnovski/mini.nvim',
  'folke/trouble.nvim',
  'lukas-reineke/indent-blankline.nvim',
  'HiPhish/nvim-ts-rainbow2',
  'windwp/nvim-ts-autotag',
  -- 's1n7ax/nvim-terminal',
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
  },
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.5',
    -- or                            , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
  },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      -- Snippet Collection (Optional)
      { 'rafamadriz/friendly-snippets' },
    }
  },

  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
  },
  {
    'nvimtools/none-ls.nvim',
    'jay-babu/mason-null-ls.nvim',
  },

  --DAP
})

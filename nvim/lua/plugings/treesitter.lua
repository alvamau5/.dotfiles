return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'HiPhish/rainbow-delimiters.nvim',
      'windwp/nvim-ts-autotag'
    },
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        -- A list of parser names, or "all"
        ensure_installed = {
          "vimdoc",
          "lua",
          "typescript",
          "javascript",
          "css",
          "python",
          "json",
          "tsx"
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        rainbow = {
          enable = true,
          -- list of languages you want to disable the plugin for
          disable = { 'jsx', 'cpp' },
          -- Which query to use for finding delimiters
          query = 'rainbow-delimiters',
          -- Highlight the entire buffer all at once
          strategy = require('rainbow-delimiters').strategy.global,
        },

        highlight = {
          -- `false` will disable the whole extension
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },

        indent = { enable = true },
      })
    end
  }
}
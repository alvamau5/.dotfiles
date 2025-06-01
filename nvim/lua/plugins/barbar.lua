return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Tree",
            highlight = "Directory",
          },
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        color_icons = false,
        indicator_icon = " ",
        separator_style = { "", "" },
        tab_size = 0,
      },
    })

    -- fix transparency
    vim.g.transparent_groups = vim.list_extend(
      vim.g.transparent_groups or {},
      vim.tbl_map(function(v)
        return v.hl_group
      end, vim.tbl_values(require("bufferline.config").highlights))
    )
  end,
  -- 'akinsho/bufferline.nvim',
  -- version = "v1*",
  -- dependencies = {
  --   'nvim-tree/nvim-web-devicons'
  -- },
  --
  -- config = function()
  --   require 'bufferline'.setup {
  --
  --     options = {
  --       -- highlights = require("vitesse.plugins.bufferline"),
  --       offsets = {
  --         {
  --           filetype = "NvimTree",
  --           text = "File Tree",
  --           highlight = "Directory",
  --           separator = true, -- use a "true" to enable the default, or set your own character
  --         },
  --       },
  --       numbers = "ordinal",
  --       diagnostics = "nvim_lsp",
  --       -- separator_style = { "", "" },
  --       separator_style = "thick",
  --       modified_icon = "●",
  --       indicator = {
  --         icon = '▎', -- this should be omitted if indicator style is not 'icon'
  --         style = 'underline',
  --       },
  --       show_close_icon = true,
  --       show_buffer_close_icons = true,
  --       diagnostics_indicator = function(count, level, diagnostics_dict, context)
  --         local icon = level:match("error") and " " or " "
  --         return " " .. icon .. count
  --       end
  --     },
  --   }
  --   -- fix transparency
  --   vim.g.transparent_groups = vim.list_extend(
  --     vim.g.transparent_groups or {},
  --     vim.tbl_map(function(v)
  --       return v.hl_group
  --     end, vim.tbl_values(require("bufferline.config").highlights))
  --   )
  -- end
}

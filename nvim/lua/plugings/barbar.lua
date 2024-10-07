return {
  'akinsho/bufferline.nvim',
  version = "v1*",
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },

  config = function()
    require 'bufferline'.setup {

      options = {
        -- highlights = require("vitesse.plugins.bufferline"),
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Tree",
            highlight = "Directory",
            separator = true, -- use a "true" to enable the default, or set your own character
          },
        },
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        -- separator_style = { "", "" },
        separator_style = "thick",
        modified_icon = "●",
        indicator = {
          icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'underline',
        },
        show_close_icon = true,
        show_buffer_close_icons = true,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end
      },
    }
  end
}

return {
  -- "olimorris/onedarkpro.nvim",
  -- priority = 1000, -- Ensure it loads first
  -- config = function()
  --   require("onedarkpro").setup({
  --     colors = {},             -- Override default colors or create your own
  --     highlights = {},         -- Override default highlight groups or create your own
  --     styles = {               -- For example, to apply bold and italic, use "bold,italic"
  --       types = "NONE",        -- Style that is applied to types
  --       methods = "NONE",      -- Style that is applied to methods
  --       numbers = "NONE",      -- Style that is applied to numbers
  --       strings = "NONE",      -- Style that is applied to strings
  --       comments = "italic",   -- Style that is applied to comments
  --       keywords = "NONE",     -- Style that is applied to keywords
  --       constants = "NONE",    -- Style that is applied to constants
  --       functions = "italic",  -- Style that is applied to functions
  --       operators = "NONE",    -- Style that is applied to operators
  --       variables = "italic",  -- Style that is applied to variables
  --       parameters = "NONE",   -- Style that is applied to parameters
  --       conditionals = "NONE", -- Style that is applied to conditionals
  --       virtual_text = "NONE", -- Style that is applied to virtual text
  --     },
  --   })
  --   vim.cmd("colorscheme onedark_dark")
  -- end,
  -- "ramojus/mellifluous.nvim",
  -- priority = 1000, --Ensure it loads first
  -- -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
  -- config = function()
  --   require("mellifluous").setup({
  --     colorset = 'mountain',
  --   }) -- optional, see configuration section.
  --   vim.cmd("colorscheme mellifluous")
  -- end,
  --
  -- "2nthony/vitesse.nvim",
  -- dependencies = {
  --   "tjdevries/colorbuddy.nvim"
  -- },
  -- config = function()
  -- priority = 1000,
  --   require("vitesse").setup {
  --     comment_italics = true,
  --     transparent_background = true,
  --     transparent_float_background = true, -- aka pum(popup menu) background
  --     reverse_visual = false,
  --     dim_nc = false,
  --     cmp_cmdline_disable_search_highlight_group = false, -- disable search highlight group for cmp item
  --     -- if `transparent_float_background` false, make telescope border color same as float background
  --     telescope_border_follow_float_background = false,
  --     -- similar to above, but for lspsaga
  --     lspsaga_border_follow_float_background = false,
  --     -- diagnostic virtual text background, like error lens
  --     diagnostic_virtual_text_background = false,
  --   }
  --
  --   vim.cmd("colorscheme vitesse")
  -- end,

  -- "scottmckendry/cyberdream.nvim",
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  --   require("cyberdream").setup {
  --     transparent = true,
  --     italic_comments = true,
  --   }
  --   vim.cmd("colorscheme cyberdream")
  -- end,

  "anAcc22/sakura.nvim",
  dependencies = { "rktjmp/lush.nvim" },
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("sakura")
    local purple = "#a289a1"

    local highlights = {
      --general
      ModeMsg = { fg = purple },
      CursorLineNr = { fg = purple },

      -- git signs
      GitSignsAdd = { fg = purple },
      GitSignsAddNr = { fg = purple },
      GitSignsAddLn = { fg = purple },
      GitSignsChange = { fg = purple },
      GitSignsChangeNr = { fg = purple },
      GitSignsChangeLn = { fg = purple },
      GitSignsChangedelete = { fg = purple },

      -- file tree
      NvimTreeGitDirty = { fg = purple },
      NvimTreeGitStaged = { fg = purple },
      NvimTreeGitMerge = { fg = purple },
      NvimTreeGitRenamed = { fg = purple },
      NvimTreeGitNew = { fg = purple },
      NvimTreeGitDeleted = { fg = purple },
      NvimTreeSpecialFile = { bold = true },
    }

    -- set highlight colors
    for group, colors in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, colors)
    end
  end,
  --
  -- "navarasu/onedark.nvim",
  -- priority = 1000, -- make sure to load this before all the other start plugins
  -- config = function()
  --   require('onedark').setup {
  --     style = 'warmer',
  --     transparent = true,
  --
  --     -- Change code style ---
  --     code_style = {
  --       comments = 'italic',
  --       keywords = 'none',
  --       functions = 'italic',
  --       strings = 'none',
  --       variables = 'none'
  --     },
  --
  --     -- Plugins Config --
  --     diagnostics = {
  --       darker = true,     -- darker colors for diagnostic
  --       undercurl = true,  -- use undercurl instead of underline for diagnostics
  --       background = true, -- use background color for virtual text
  --     },
  --   }
  --   -- Enable theme
  --   require('onedark').load()
  -- end,
}

-- require("onedarkpro").setup({
--   styles = {
--     comments = "italic",
--     functions = "italic",
--     variabales = "italic",
--   }
-- })
--
-- -- somewhere in your config:
-- vim.cmd("colorscheme onedark")


-- -- Lua
-- require('onedark').setup {
--   -- Main options --
--   style = 'warmer',             -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
--   transparent = false,          -- Show/hide background
--   term_colors = true,           -- Change terminal color as per the selected theme style
--   ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
--   cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
--
--   -- toggle theme style ---
--   toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
--   toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between
--
--   -- Change code style ---
--   -- Options are italic, bold, underline, none
--   -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
--   code_style = {
--     comments = 'italic',
--     keywords = 'none',
--     functions = 'italic',
--     strings = 'none',
--     variables = 'italic'
--   },
--
--   -- Lualine options --
--   lualine = {
--     transparent = false, -- lualine center bar transparency
--   },
--
--   -- Custom Highlights --
--   colors = {},     -- Override default colors
--   highlights = {}, -- Override highlight groups
--
--   -- Plugins Config --
--   diagnostics = {
--     darker = true,     -- darker colors for diagnostic
--     undercurl = true,  -- use undercurl instead of underline for diagnostics
--     background = true, -- use background color for virtual text
--   },
-- }
-- require('onedark').load()

require("onedarkpro").setup({
  colors = {}, -- Override default colors or create your own
  highlights = {}, -- Override default highlight groups or create your own
  styles = { -- For example, to apply bold and italic, use "bold,italic"
    types = "NONE", -- Style that is applied to types
    methods = "NONE", -- Style that is applied to methods
    numbers = "NONE", -- Style that is applied to numbers
    strings = "NONE", -- Style that is applied to strings
    comments = "italic", -- Style that is applied to comments
    keywords = "NONE", -- Style that is applied to keywords
    constants = "NONE", -- Style that is applied to constants
    functions = "italic", -- Style that is applied to functions
    operators = "NONE", -- Style that is applied to operators
    variables = "italic", -- Style that is applied to variables
    parameters = "NONE", -- Style that is applied to parameters
    conditionals = "NONE", -- Style that is applied to conditionals
    virtual_text = "NONE", -- Style that is applied to virtual text
  },
})

vim.cmd("colorscheme onedark_dark")

function ToggleTheme()
  if vim.o.background == "dark" then
    vim.cmd("colorscheme onelight")
  else
    vim.cmd("colorscheme onedark_dark")
  end
end

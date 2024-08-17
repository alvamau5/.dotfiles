return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  config = function()
    require("onedarkpro").setup({
      colors = {},             -- Override default colors or create your own
      highlights = {},         -- Override default highlight groups or create your own
      styles = {               -- For example, to apply bold and italic, use "bold,italic"
        types = "NONE",        -- Style that is applied to types
        methods = "NONE",      -- Style that is applied to methods
        numbers = "NONE",      -- Style that is applied to numbers
        strings = "NONE",      -- Style that is applied to strings
        comments = "italic",   -- Style that is applied to comments
        keywords = "NONE",     -- Style that is applied to keywords
        constants = "NONE",    -- Style that is applied to constants
        functions = "italic",  -- Style that is applied to functions
        operators = "NONE",    -- Style that is applied to operators
        variables = "italic",  -- Style that is applied to variables
        parameters = "NONE",   -- Style that is applied to parameters
        conditionals = "NONE", -- Style that is applied to conditionals
        virtual_text = "NONE", -- Style that is applied to virtual text
      },
    })

    vim.cmd("colorscheme onedark_dark")
  end
}

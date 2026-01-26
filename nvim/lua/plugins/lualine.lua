return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "archibate/lualine-time",
    "SmiteshP/nvim-navic",
  },
  config = function()
    local lazy_status = require("lazy.status")
    local Snacks = require("snacks")
    local navic = require("nvim-navic")

    require("lualine").setup({
      options = {
        icons_enabled = vim.g.have_nerd_font,
        theme = "auto",
        component_separators = { left = " ╱ ", right = " ╱ " },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1):upper() .. str:sub(2):lower()
            end,
          },
        },
        lualine_b = {},
        lualine_c = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          {
            "filename",
            file_status = true, -- displays file status (readonly status, modified status)
            path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
            color = { bg = "dynamic", fg = "#d8dee9" },
          },
          {
            "diagnostics",
            symbols = {
              error = "",
              warn = "",
              info = "",
              hint = "󰠠",
            },
          },
          {
            function()
              return navic.get_location()
            end,
            cond = function()
              return navic.is_available()
            end,
            color_correction = "dynamic",
          },
        },
        lualine_x = {
          Snacks.profiler.status(),
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return { fg = Snacks.util.color("Statement") } end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return { fg = Snacks.util.color("Constant") } end,
          },
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = function()
              return { fg = Snacks.util.color("Special") }
            end,
          },
          -- 'filetype',
          {
            "branch",
            icon = "󰊢",
          },
          {
            "diff",
            symbols = { added = "", modified = "", removed = "" },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          "fileformat",
        },
        lualine_y = { { "location", padding = { left = 0, right = 1 } } },
        lualine_z = {
          -- -- time o'clock
          function()
            return " " .. os.date("%R")
          end,
        },
      },
    })
  end,
}

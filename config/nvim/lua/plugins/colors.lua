-- return {
--   "anAcc22/sakura.nvim",
--   dependencies = { "rktjmp/lush.nvim" },
--   priority = 1000,
--   init = function()
--     vim.cmd.colorscheme("sakura")
--     local purple = "#a289a1"
--
--     local highlights = {
--       --general
--       ModeMsg = { fg = purple },
--       CursorLineNr = { fg = purple },
--
--       -- git signs
--       GitSignsAdd = { fg = purple },
--       GitSignsAddNr = { fg = purple },
--       GitSignsAddLn = { fg = purple },
--       GitSignsChange = { fg = purple },
--       GitSignsChangeNr = { fg = purple },
--       GitSignsChangeLn = { fg = purple },
--       GitSignsChangedelete = { fg = purple },
--
--       -- file tree
--       NvimTreeGitDirty = { fg = purple },
--       NvimTreeGitStaged = { fg = purple },
--       NvimTreeGitMerge = { fg = purple },
--       NvimTreeGitRenamed = { fg = purple },
--       NvimTreeGitNew = { fg = purple },
--       NvimTreeGitDeleted = { fg = purple },
--       NvimTreeSpecialFile = { bold = true },
--     }
--
--     -- set highlight colors
--     for group, colors in pairs(highlights) do
--       vim.api.nvim_set_hl(0, group, colors)
--     end
--   end,
-- }

-- return {
--   "Aejkatappaja/sora",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     require("sora").setup({
--       transparent = true, -- transparent background (also strips float/statusline bg)
--       italic = true, -- italics globally
--       italic_comments = true, -- italics for comments (ignored if italic = false)
--     })
--     vim.cmd("colorscheme sora")
--   end,
-- }

-- return {
--   "xero/evangelion.nvim",
--   lazy = false,
--   priority = 1000,
--   -- opts = {
--   --   overrides = {
--   --     keyword = { fg = "#00ff00", bg = "#222222", undercurl = true },
--   --     ["@boolean"] = { link = "Special" },
--   --   },
--   -- },
--   init = function()
--     vim.cmd.colorscheme("evangelion")
--   end,
-- }

-- return {
--   "Aejkatappaja/sora",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     require("sora").setup({
--       transparent = true, -- transparent background (also strips float/statusline bg)
--       italic = true, -- italics globally
--       italic_comments = true, -- italics for comments (ignored if italic = false)
--
--       on_colors = function(colors)
--         colors.func = "#a0d8f0" -- brighter functions
--         colors.string = colors.sage
--       end, -- override palette before highlights build
--       on_highlights = function(hl, colors)
--         hl.Comment = { fg = colors.fg_comment, italic = true }
--         hl.LineNr = { fg = colors.fg_gutter }
--         hl.CursorLineNr = { fg = colors.cyan, bold = true }
--         hl.FloatBorder = { fg = colors.border, bg = colors.bg_float }
--       end, -- override highlight groups after they build
--     })
--     vim.cmd("colorscheme sora")
--   end,
-- }

-- return {
--   "mitander/flume.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.opt.termguicolors = true
--     require("flume").setup({
--       schema = "dusk",
--       transparent = true,
--       terminal_colors = true,
--       styles = {
--         comments = { italic = true },
--         keywords = { bold = true, italic = true },
--         functions = { italic = true },
--         types = { bold = true, italic = true },
--         strings = { italic = true },
--         variables = { italic = true },
--       },
--     })
--   end,
-- }

-- return {
--   "mitander/flume.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     require("flume").setup({
--       transparent = true,
--       terminal_colors = true,
--       styles = {
--         comments = { italic = true },
--         keywords = { bold = true, italic = true },
--         functions = { italic = true },
--         types = { bold = true, italic = true },
--         strings = { italic = true },
--         variables = { italic = true },
--       },
--       overrides = {
--         accent = "#73a6b6",
--       },
--       highlights = {
--         FloatBorder = function(c)
--           return { fg = c.accent, bg = c.bg }
--         end,
--       },
--     })
--     vim.cmd("colorscheme flume")
--   end,
-- }

-- return {
--   "mryodo/rwth.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("rwth").setup({
--       transparent = false,
--       italic_comments = true,
--     })
--     vim.cmd("colorscheme rwth-dark")
--   end,
-- }

return {
  'nyoom-engineering/oxocarbon.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.api.nvim_set_hl(0, 'Keyword', { italic = true })
    vim.api.nvim_set_hl(0, 'Function', { italic = true })
    vim.api.nvim_set_hl(0, 'Type', { italic = true })
    vim.api.nvim_set_hl(0, 'String', { italic = true })

    vim.opt.background = 'dark'
    vim.cmd.colorscheme 'oxocarbon'

    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
  end,
}

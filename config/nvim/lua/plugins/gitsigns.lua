return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  -- config = function()
  --   require("gitsigns").setup({
  --
  --     current_line_blame = true,
  --     current_line_blame_opts = {
  --       virt_text = true,
  --       virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
  --       delay = 1000,
  --       virt_text_priority = 100,
  --     },
  --   })
  -- end,
    opts = {
    attach_to_untracked = true,
    on_attach = function(buf)
      local gitsigns = require 'gitsigns'
      local function map(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, { buffer = buf, desc = desc })
      end

      map(']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, 'Next hunk')
      map('[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, 'Previous hunk')
    end,
  },
}

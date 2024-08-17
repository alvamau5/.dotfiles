return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    require("nvim-tree").setup({
      view = {
        width = 30,
        relativenumber = false,
      },

      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },

      renderer = {
        indent_markers = {
          enable = false,
          icons = {
            corner = "└ ",
            edge = "│ ",
            none = "  ",
          },
        },


        icons = {
          webdev_colors = true,
          git_placement = "before",
          padding = " ",
          symlink_arrow = " ➛ ",

          show = {
            folder = true,
            folder_arrow = true,
            file = true,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_closed = "⏵",
              arrow_open = "⏷",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    })
    -- This closes the tree as soon as a file buffer is opened
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*",
      callback = function()
        if vim.bo.buftype == "" then
          vim.cmd("NvimTreeClose")
        end
      end,
    })

    vim.keymap.set("n", "<C-b>", ":NvimTreeFindFileToggle<CR>", { silent = true })
  end,
}

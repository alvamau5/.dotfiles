return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  config = function()
    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    require("nvim-tree").setup({
      view = {
        width = 30,
        relativenumber = false,
        side = "left",
      },

      renderer = {
        root_folder_label = function(path)
          return vim.fn.fnamemodify(path, ":t")
        end,
        highlight_git = "all",

        icons = {
          web_devicons = {
            file = {
              color = false,
            },
          },
          glyphs = {
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

    vim.opt.fillchars:append({ vert = " " }) -- remove window seperator

    -- This closes the tree as soon as a file buffer is opened
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*",
      callback = function()
        if vim.bo.buftype == "" then
          vim.cmd("NvimTreeClose")
        end
      end,
    })

    vim.keymap.set("n", "<C-b>", ":NvimTreeFindFileToggle<CR>", { silent = true }, { desc = "Toggle file explorer" }) -- toggle file explorer
  end,
}

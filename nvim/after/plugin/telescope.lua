
-- This is your opts table Telescope UI
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}
local builtin = require("telescope.builtin")

-- vim.keymap.set('n', '<C-p>', builtin.find_files, {})
builtin.project_files = function()
  local opts = {
    show_untracked = true,
  } -- define here if you want to define something
  vim.fn.system("git rev-parse --is-inside-work-tree")
  if vim.v.shell_error == 0 then
    builtin.git_files(opts)
  else
    builtin.find_files(opts)
  end
end
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-f>", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")

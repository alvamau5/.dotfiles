return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 12,
      open_mapping = [[<c-t>]],
      direction = "horizontal",
      persist_size = true,
      shell = vim.o.shell,
      winbar = {
        enabled = false,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end,
      },
      shade_filetypes = { "none", "fzf" },
      shade_terminals = false,
    })
  end,
}

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup {
      size = 10,
      open_mapping = [[<c-t>]],
      direction = 'horizontal',
    }
  end
}

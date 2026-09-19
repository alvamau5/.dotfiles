return {
  "nvim-tree/nvim-web-devicons",
  enabled = vim.g.have_nerd_font,
  dependencies = { "SomeCoder99/darkslate.nvim" },
  opts = function(_, opts)
    return require("darkslate.plugin.nvim_web_devicons").tweak_opts(opts)
  end,
}

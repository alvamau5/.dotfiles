return {
  "j-hui/fidget.nvim",
  lazy = true,
  opts = {
    -- options
    progress = {
      display = {
        done_ttl = 5,
        done_icon = " ",
      },
    },

    notification = {
      override_vim_notify = true,
      window = {
        x_padding = 0,
        y_padding = 0,
        normal_hl = "Comment",
      },
    },
  },
}

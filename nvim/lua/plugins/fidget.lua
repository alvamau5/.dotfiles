return {
  "j-hui/fidget.nvim",
  tag = "v1.0.0", --Make sure to update this to someting recent!
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

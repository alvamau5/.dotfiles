return {
  "SmiteshP/nvim-navic",
  lazy = false,
  init = function()
    vim.g.navic_silence = true
  end,
  opts = function()
    local Snacks = require('snacks')
    Snacks.util.lsp.on({ method = "textDocument/documentSymbol" }, function(buffer, client)
      require("nvim-navic").attach(client, buffer)
    end)
    return {
      separator = " ",
      highlight = false,
      depth_limit = 5,
      icons = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = ' ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' '
      },
      lazy_update_context = true,
    }
  end,
}

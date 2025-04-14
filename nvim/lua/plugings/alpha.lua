return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

	dashboard.section.buttons.val = {
	dashboard.button("f", "󰈞 Find file", ":Telescope find_files<CR>"),
	dashboard.button("n", " New file", ":ene <BAR> startinsert<CR>"),
	dashboard.button("r", "󰥔 Recent files", ":Telescope oldfiles<CR>"),
	dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
  	dashboard.button("q", " Quit", ":qa<CR>"),
	}
	dashboard.section.footer.val = "Alvamau5 󰣇"

	alpha.setup(dashboard.opts)


	vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = "#7BA2F6", bg = "NONE" })
	vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = "#7BA2F6", bg = "NONE" })
	vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = "#7BA2F6", bg = "NONE" })


	vim.opt.termguicolors = true
  end,
}

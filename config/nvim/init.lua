-- Modern AI Neovim, rebuilt from scratch.
-- init.lua is a thin loader: leader first, then each config module runs in order.
-- See modern-ai-nvim.md for the full plan.

require 'config.settings'
require 'config.keymaps'
require 'config.autocmds'
require 'config.lazy'

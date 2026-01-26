-- Appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.o.pumheight = 10 -- Max items to show in pop up menu
vim.o.cmdheight = 1  -- Max items to show in command menu
vim.g.have_nerd_font = true

-- Files & Others
vim.g.mapleader = " "
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.ambiwidth = "single"

-- Update & backups
vim.opt.backup = false
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.o.showmode = false
vim.o.writebackup = false

-- Split Windows
vim.opt.splitright = true

-- Wrapping
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

-- use native clipboard
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- set case insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indentation
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- highlight matching parenthesis
vim.opt.showmatch = true

-- Mouse & Scrollings
vim.opt.mouse = "a"

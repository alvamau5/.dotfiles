-- Appearance
vim.opt.termguicolors = true
vim.o.pumheight = 10 -- Max items to show in pop up menu
vim.o.cmdheight = 1  -- Max items to show in command menu

-- Files & Others
vim.g.mapleader = " "
vim.opt.fileencoding = "utf-8" -- File Encoding

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
vim.opt.clipboard = "unnamedplus"

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

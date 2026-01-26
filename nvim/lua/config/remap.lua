-- vim.keymap.set mode, shortcut, action, config
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.keymap.set("i", "jj", "<ESC>", opts)
vim.keymap.set("n", "<A-v>", "<cmd>vsplit<CR>", { desc = "Vertical split current buffer" })
vim.keymap.set("n", "<A-V>", "<cmd>vnew<CR>", { desc = "Vertical split with new buffer" })

-- toggle terminal
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)

--Github Copilot
vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
-- Clear search highlight
vim.keymap.set("n", "<esc>", ":noh<return><esc>", opts)

-- Move to previous/next
vim.keymap.set("n", "<tab>", ":bprevious<CR>")
vim.keymap.set("n", "<s-tab>", ":bnext<CR>")
-- -- Pin/unpin buffer
vim.keymap.set("n", "<A-p>", ":BufferLineTogglePin<CR>")
-- map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
vim.keymap.set("n", "<A-x>", ":bdelete<CR>")
-- -- Magic buffer-picking mode
vim.keymap.set("n", "<C-i>", ":BufferLinePick<CR>")

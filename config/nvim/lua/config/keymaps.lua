-- vim.keymap.set mode, shortcut, action, config
local map = vim.keymap.set

map("i", "jj", "<ESC>", opts)

-- Window focus.
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })

-- Vertical splits.
map("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Vertical split current buffer" })
map("n", "<leader>V", "<cmd>vnew<CR>", { desc = "Vertical split with new buffer" })

-- toggle terminal
map("t", "<esc>", [[<C-\><C-n>]], opts)

--Github Copilot
map("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

-- Clear search highlight
map("n", "<esc>", ":noh<return><esc>", opts)

-- Move to previous/next
map("n", "<tab>", ":bprevious<CR>")
map("n", "<s-tab>", ":bnext<CR>")
-- -- Pin/unpin buffer
map("n", "<A-p>", ":BufferLineTogglePin<CR>")
-- map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map("n", "<A-x>", ":bdelete<CR>")
-- -- Magic buffer-picking mode
map("n", "<C-i>", ":BufferLinePick<CR>")

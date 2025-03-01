-- Set space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Exit terminal mode on ESC
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Clear highlight on pressing ESC
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Map 'jj' to exit insert mode
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

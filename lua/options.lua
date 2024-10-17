-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- window splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- normal sized tabs
-- set tabs to 4 on saving and opening files
vim.opt.tabstop = 4
-- indentation width i.e. >> <<
vim.opt.shiftwidth = 4

-- copy paste from system
vim.opt.clipboard = "unnamedplus"

-- cursor in middle at all times
vim.opt.scrolloff = 9999

-- allows traversal one more character beyond a line and in visual block mode way beyond
vim.opt.virtualedit = "onemore"

-- when using e.g. %s/x/y show all changes that will be made
vim.opt.inccommand = "split"

-- ignorecase sensitive completions
vim.opt.ignorecase = true

-- better color support
vim.opt.termguicolors = true

-- set space as leader
vim.g.mapleader = " "

-- highlight on search but clear on pressing esc in normalmode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- exit terminal mode on Esc
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode'})

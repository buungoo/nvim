-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Window splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Normal sized tabs
-- Set tabs to 4 on saving and opening files
vim.opt.tabstop = 4
-- Indentation width i.e. >> <<
vim.opt.shiftwidth = 4
vim.o.showtabline = 4

-- Copy paste from system
vim.opt.clipboard = "unnamedplus"

-- Cursor in middle at all times
vim.opt.scrolloff = 9999

-- Allows traversal one more character beyond a line and in visual block mode way beyond
vim.opt.virtualedit = "onemore"

-- When using e.g. %s/x/y show all changes that will be made
vim.opt.inccommand = "split"

-- Ignorecase sensitive completions
vim.opt.ignorecase = true

-- Better color support
vim.opt.termguicolors = true

-- Set space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Highlight on search but clear on pressing esc in normalmode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode on Esc
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode'})

-- Highlight cursor line number
vim.opt.cursorline = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- If set to "yes" adds a signcolumn to the left of the line numbers when there are warning etc.
vim.opt.signcolumn = "no"


vim.keymap.set("n", "<leader>d", "<cmd>NoiceDismiss<cr>", { desc = "Dismiss Noice notification" })
	-- keys = {
	-- 	"<leader>d",
	-- 	"<cmd>NoiceDismiss<cr>",
	-- 	desc = "Dismiss Noice notification."
	-- },
vim.opt.wrap = false

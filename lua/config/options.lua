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
vim.opt.showtabline = 4

-- Copy paste from system
vim.opt.clipboard = "unnamedplus"

-- Cursor in middle at all times
vim.opt.scrolloff = 9999

-- Allows traversal one more character beyond a line and in visual block mode way beyond
vim.opt.virtualedit = "onemore"

-- When using e.g. %s/x/y show all changes that will be made
vim.opt.inccommand = "split"

-- Better color support
vim.opt.termguicolors = true

-- Highlight on search
vim.opt.hlsearch = true

-- Highlight cursor line number
vim.opt.cursorline = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- If set to "yes" adds a signcolumn to the left of the line numbers when there are warning etc.
vim.opt.signcolumn = "no"

-- Do not wrap to newline by default
vim.opt.wrap = false

-- Centralized float configuration for LSP-related popups
local float_config = {
    border = "rounded",  -- Use rounded borders
    -- max_width = 80,      -- Optional: Limit width of floats
    focusable = false,   -- Optional: Prevent focus stealing
}

-- Set default configuration for diagnostics
vim.diagnostic.config({
	-- float = {
	-- 	border = "rounded", -- This will apply rounded borders to all diagnostic floats
	-- 	focusable = false,  -- Optional: Makes the float not steal focus
	-- 	max_width = 80,
	-- },
	float = float_config
})

-- Customize the hover handler to use the same float style
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
-- 	border = "rounded", -- Apply rounded borders to hover floats
-- 	max_width = 80,     -- Optional: Limit the width of the hover float
-- 	focusable = true,   -- Optional: Prevent the hover float from stealing focus
-- })

-- Apply float settings to hover and signature help handlers
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float_config)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float_config)

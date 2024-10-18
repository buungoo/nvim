return {
	"shellRaining/hlchunk.nvim",
	event = { "UIEnter" },
	enabled = true,
	opts = {
		chunk = {
			enable = true,
			-- use_treesitter = true,
			chars = {
				horizontal_line = "━",
				vertical_line = "┃",
				left_top = "┏",
				left_bottom = "┗",
				right_arrow = "━",
			},
			delay = 0,
			duration = 100,
			style = {
				{ fg = "#ff9e3b" }, -- Same color as CursorLineNr
				{ bg = "#ff9e3b" }, -- Set a background color to match CursorLine
				-- These don't seem to work, or atleast I couldn't get it to work
				-- { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("CursorLineNr")), "fg", "gui") },
				-- { bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("CursorLineNr")), "fg", "gui") },
			},
		},
		indent = {
			enable = true,
			chars = {
				"│",
			},
			style = {
				vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
			},
		},
	},
}

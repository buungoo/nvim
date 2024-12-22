return {
	"shellRaining/hlchunk.nvim",
	event = { "UIEnter" },
	enabled = true,
	opts = {
		chunk = {
			enable = true,
			use_treesitter = true,
			chars = {
				right_arrow = "─",
			},
			delay = 0,
			duration = 100,
			style = {
				"#ff9e3b", -- Same color as CursorLineNr in Kanagawa
				"#f35336", -- Fallback color for erroneous chunk
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

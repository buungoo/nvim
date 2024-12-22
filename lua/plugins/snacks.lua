return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = {
			enabled = true
		},
		dashboard = {
			-- Kurama622/profile.nvim
			enabled = true
		},
		debug = { enabled = true },
		indent = { enabled = false },
		input = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = false },
	},
}

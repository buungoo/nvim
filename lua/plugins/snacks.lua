return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = {
			enabled = true
		},
		dashboard = {
			-- Kurama622/profile.nvim
			enabled = true
		},
		debug = { enabled = true },
		git = { enabled = true },
		gitbrowse = { enabled = true },
		indent = { enabled = false },
		input = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = false },
	},
	keys = {
		{ "<leader>g", function () Snacks.gitbrowse() end, desc = "Gitbrowse" },
		{ "<leader>gl", function () Snacks.lazygit() end, desc = "Lazygit" },
		{ "<leader>gh", function() Snacks.git.blame_line() end, desc = "Gitblame" },
	},
}

return {
	"folke/zen-mode.nvim",
	enabled = false,
	dependencies = {
		"junegunn/limelight.vim",
	},
	-- opts = {},
	keys = {
		{
			"<leader>zl",
			"<cmd>ZenMode<cr><cmd>Limelight!!<cr>",
			desc = "Toggle Zen Mode and Limelight",
		},
		{
			"<leader>zz",
			"<cmd>ZenMode<cr>",
			desc = "Toggle Zen Mode",
		},
	},
}

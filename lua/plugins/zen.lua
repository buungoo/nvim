return {
	"folke/zen-mode.nvim",
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

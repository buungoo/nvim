return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<Leader>b",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Open Telescope Buffers",
		},
	},
}

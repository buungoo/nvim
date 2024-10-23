return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>ob",
			-- function()
			-- 	require("telescope.builtin").buffers()
			-- end,
			"<cmd>Telescope buffers<cr>",
			desc = "Telescope buffers",
		},
		{
			"<leader>of",
			"<cmd>Telescope find_files<cr>",
			desc = "Telescope find files"
		},
		{
			"<leader>ol",
			"<cmd>Telescope live_grep<cr>",
			desc = "Telescope live grep"
		}
	},
}

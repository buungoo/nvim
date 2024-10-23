return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
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
			desc = "Telescope find files",
		},
		{
			"<leader>ol",
			"<cmd>Telescope live_grep<cr>",
			desc = "Telescope live grep",
		},
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					-- Return deferred functions to still allow for lazy loading
					["<C-k>"] = function(...)
						return require("telescope.actions").move_selection_previous(...)
					end,
					["<C-j>"] = function(...)
						return require("telescope.actions").move_selection_next(...)
					end,
					["C-q"] = function(...)
						require("telescope.actions").send_selected_to_qflist(...)
						require("telescope.actions").open_qflist(...)
					end,
				},
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
	end
}

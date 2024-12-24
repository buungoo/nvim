local example = "hi"
print(example)
if example then
	print("EOE")
end
return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{
			"<leader>ob",
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
		{
			"<leader>oh",
			"<cmd>Telescope help_tags<cr>",
			desc = "Telescope help tags",
		},
		{
			"<leader>op",
			function ()
				require("telescope.builtin").find_files {
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
				}
			end
		}
	},
	opts = {
		defaults = {
			path_display = "filename_first",
			-- Key mappings inside the telescope gui
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
		pickers = {
			find_files = {
				-- theme = "dropdown"
			}
		}
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
	end
}

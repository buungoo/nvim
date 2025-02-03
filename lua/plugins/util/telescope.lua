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
			function()
				require("telescope.builtin").find_files({
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
				})
			end,
		},
		{
			"<leader>ld",
			"<cmd>Telescope lsp_definitions<cr>",
			desc = "Go to definition",
		},
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
			layout_config = {
				width = 0.95, -- Slightly wider window
				preview_width = 0.6,
			},
		},
		pickers = {
			find_files = {
				-- theme = "dropdown"
			},
		},
	},
	config = function(_, opts)
		-- Get Kanagawa colors
		local kanagawa = require("kanagawa.colors").setup({ theme = "wave" })

		-- Set Telescope highlights
		vim.api.nvim_set_hl(0, "TelescopeBorder", {
			fg = kanagawa.palette.sumiInk6,
			-- bg = kanagawa.palette.sumiInk1,
		})

		vim.api.nvim_set_hl(0, "TelescopeTitle", {
			fg = kanagawa.palette.roninYellow,
			-- bg = kanagawa.palette.sumiInk4,
			bold = true,
		})

		vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {
			fg = kanagawa.palette.roninYellow,
			bg = kanagawa.palette.sumiInk1,
		})

		vim.api.nvim_set_hl(0, "TelescopeSelection", {
			fg = kanagawa.palette.fujiWhite,
			bg = kanagawa.palette.sumiInk5,
			bold = true,
		})

		-- Additional highlights for full theme integration
		local telescope_hl = {
			TelescopeNormal = { bg = kanagawa.palette.sumiInk1 },
			TelescopePromptNormal = { bg = kanagawa.palette.sumiInk2 },
			TelescopeResultsNormal = { bg = kanagawa.palette.sumiInk1 },
			TelescopePreviewNormal = { bg = kanagawa.palette.sumiInk1 },
			TelescopeMatching = { fg = kanagawa.palette.roninYellow },
			TelescopeSelectionCaret = { fg = kanagawa.palette.roninYellow },
		}

		for group, color in pairs(telescope_hl) do
			vim.api.nvim_set_hl(0, group, color)
		end

		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
	end,
}

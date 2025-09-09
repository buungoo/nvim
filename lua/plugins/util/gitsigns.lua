-- return {
-- 	"lewis6991/gitsigns.nvim",
-- 	lazy = false,
-- 	-- stylua: ignore start
-- 	keys = {
-- 		{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Gitsisgns preview hunk" },
-- 	},
-- 	-- stylua: ignore end
-- 	opts = {
-- 		signs = {
-- 			add = { text = "┃" },
-- 			change = { text = "┃" },
-- 			delete = { text = "_" },
-- 			topdelete = { text = "‾" },
-- 			changedelete = { text = "~" },
-- 			untracked = { text = "┆" },
-- 		},
-- 		signs_staged = {
-- 			add = { text = "┃" },
-- 			change = { text = "┃" },
-- 			delete = { text = "_" },
-- 			topdelete = { text = "‾" },
-- 			changedelete = { text = "~" },
-- 			untracked = { text = "┆" },
-- 		},
-- 		signs_staged_enable = true,
-- 		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
-- 		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
-- 		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
-- 		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
-- 		watch_gitdir = {
-- 			follow_files = true,
-- 		},
-- 		auto_attach = true,
-- 		attach_to_untracked = false,
-- 		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
-- 		current_line_blame_opts = {
-- 			virt_text = true,
-- 			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
-- 			delay = 1000,
-- 			ignore_whitespace = false,
-- 			virt_text_priority = 100,
-- 			use_focus = true,
-- 		},
-- 		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
-- 		sign_priority = 6,
-- 		update_debounce = 100,
-- 		status_formatter = nil, -- Use default
-- 		max_file_length = 40000, -- Disable if file is longer than this (in lines)
-- 		preview_config = {
-- 			-- Options passed to nvim_open_win
-- 			border = "single",
-- 			style = "minimal",
-- 			relative = "cursor",
-- 			row = 0,
-- 			col = 1,
-- 		},
-- 	},
-- }

return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	keys = {
		{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Gitsigns preview hunk" },
	},
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signcolumn = true,
		numhl = false,
		linehl = false,
		word_diff = false,
		watch_gitdir = {
			follow_files = true,
		},
		auto_attach = true,
		attach_to_untracked = false,
		current_line_blame = false,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 1000,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true,
		},
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
		sign_priority = 6,
		update_debounce = 100,
		max_file_length = 40000,
		preview_config = {
			border = "single",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
	},
}

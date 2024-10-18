-- return {
-- 	{
-- 		-- pull in this module which will be set up and configured inside the nvim-treesitter module
-- 		"nvim-treesitter/nvim-treesitter-textobjects",
-- 	},
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		build = ":TSUpdate",
-- 		config = function()
-- 			require('nvim-treesitter.configs').setup {
-- 				ensure_installed = { "c", "lua", "python", "vim", "vimdoc", "query", "rust", "latex", "go", "dart", "dockerfile" },
-- 				auto_install = true,
-- 				highlight = {
-- 					enable = true,
-- 				},
-- 				incremental_selection = {
-- 					enable = true,
-- 					-- I would use keys but it does not work for this
-- 					keymaps = {
-- 						init_selection = "<leader>s",
-- 						node_incremental = "<TAB>",
-- 						node_decremental = "<S-TAB>",
-- 						scope_incremental = "grc",
-- 					},
-- 				},
-- 				-- part of nvim-treesitter-textobjects
-- 				textobjects = {
-- 					select = {
-- 						enable = true,
--
-- 						-- automatically jump forward to textobj
-- 						lookahead = true,
--
-- 						keymaps = {
-- 							["af"] = "@function.outer",
-- 							["if"] = "@function.inner",
-- 							["ac"] = "@class.outer",
-- 							["ic"] = "@class.inner",
-- 							["as"] = "@scope",
-- 						},
--
-- 						selection_modes = {
-- 							["@parameter.outer"] = "v",
-- 							["@function.outer"] = "v",
-- 							["@class.outer"] = "<c-v>",
-- 						},
-- 					},
-- 				},
-- 			}
-- 		end,
-- 	},
-- }

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		opts = {
			ensure_installed = { "c", "lua", "python", "vim", "vimdoc", "query", "rust", "latex", "go", "dart", "dockerfile" },
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>s",
					node_incremental = "<TAB>",
					node_decremental = "<S-TAB>",
					scope_incremental = "grc",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["as"] = "@scope",
					},
					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "v",
						["@class.outer"] = "<c-v>",
					},
				},
			},
		},
		config = function(_, opts)
			require('nvim-treesitter.configs').setup(opts)
		end,
	},
}

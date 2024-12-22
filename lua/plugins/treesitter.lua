return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		opts = {
			ensure_installed = {
				"c",
				"lua",
				"python",
				"vim",
				"vimdoc",
				"query",
				"rust",
				"latex",
				"go",
				"dart",
				"dockerfile",
				"latex"
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
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
						-- Outer Parameter
						["ap"] = { query = "@parameter.outer", desc = "Select outer parameter" },

						-- Inner Parameter
						["ip"] = { query = "@parameter.inner", desc = "Select inner parameter" },

						-- Outer Loop
						["al"] = { query = "@loop.outer", desc = "Select outer loop" },

						-- Inner Loop
						["il"] = { query = "@loop.inner", desc = "Select inner loop" },

						-- Outer Conditional
						["ai"] = { query = "@conditional.outer", desc = "Select outer conditional" },

						-- Inner Conditional
						["ii"] = { query = "@conditional.inner", desc = "Select inner conditional" },

						-- Outer Comment, Inner not supported
						["at"] = { query = "@comment.outer", desc = "Select outer comment" },

						-- Outer Function definition
						["ad"] = { query = "@function.outer", desc = "Select outer function definition" },

						-- Inner Function definition
						["id"] = { query = "@function.inner", desc = "Select inner function" },

						-- Outer Function call
						["af"] = { query = "@call.outer", desc = "Select outer function call" },

						-- Inner Function call
						["if"] = { query = "@call.inner", desc = "Select inner function call" },

						-- Outer Class
						["ac"] = { query = "@class.outer", desc = "Select outer class" },

						-- Inner Class
						["ic"] = { query = "@class.inner", desc = "Select inner class" },

						-- Right Assignment
						["aa"] = { query = "@assignment.rhs", desc = "Select right side of assignment" },

						-- Left Assignment
						["ia"] = { query = "@assignment.lhs", desc = "Select left side of assignment" },

						-- Outer Assignment
						["aA"] = { query = "@assignment.outer", desc = "Select outer assignment" },

						-- Inner Assignment
						["iA"] = { query = "@assignment.inner", desc = "Select inner assignment" },
					},
				},
				move = {
					enable = true,
					set_jumps = true,

					-- Jump to the next object start
					goto_next_start = {
						-- Next Function definition start
						["öd"] = { query = "@function.outer", desc = "Next function start" },

						-- Next Function call start
						["öf"] = { query = "@call.outer", desc = "Next function call start" },

						-- Next Class start
						["öc"] = { query = "@class.outer", desc = "Next class start" },

						-- Next Loop start
						["öl"] = { query = "@loop.outer", desc = "Next loop start" },

						-- Next Conditional start
						["öi"] = { query = "@conditional.outer", desc = "Next conditional" },

						-- Next parameter start
						["öp"] = { query = "@parameter.inner", desc = "Next parameter" },

						-- Next Comment start
						["öt"] = { query = "@comment.outer", desc = "Next comment outer" },
					},

					-- Jump to the next object end
					goto_next_end = {
						-- Next Function definition end
						["öD"] = { query = "@function.outer", desc = "Next function end" },

						-- Next Function call end
						["öF"] = { query = "@call.outer", desc = "Next function call end" },

						-- Next Class end
						["öC"] = { query = "@class.outer", desc = "Next class end" },

						-- Next Loop end
						["öL"] = { query = "@loop.outer", desc = "Next loop end" },

						-- Next Conditional end
						["öI"] = { query = "@conditional.inner", desc = "Next conditional end" },

						-- Next Comment end
						["öT"] = { query = "@comment.outer", desc = "Next comment end" },
					},

					-- Jump to the previous object start
					goto_previous_start = {
						-- Previous Function definition start
						["äd"] = { query = "@function.outer", desc = "Previous function start" },

						-- Previous Function call start
						["äf"] = { query = "@call.outer", desc = "Previous function call start" },

						-- Previous Class start
						["äc"] = { query = "@class.outer", desc = "Previous class start" },

						-- Previous Loop start
						["äl"] = { query = "@loop.outer", desc = "Previous loop start" },

						-- Previous Comment start
						["ät"] = { query = "@comment.outer", desc = "Previous comment outer" },

						-- Previous Conditional start
						["äi"] = { query = "@conditional.outer", desc = "Go to previous conditional" },

						-- Previous parameter
						["äp"] = { query = "@parameter.inner", desc = "Previous parameter" },
					},

					-- Jump to the previous object end
					goto_previous_end = {
						-- Previous Function call end
						["äD"] = { query = "@function.outer", desc = "Previous function end" },

						-- Previous Function call end
						["äF"] = { query = "@call.outer", desc = "Previous function call end" },

						-- Previous Class end
						["äC"] = { query = "@class.outer", desc = "Previous class end" },

						-- Previous Loop end
						["äL"] = { query = "@loop.outer", desc = "Previous loop end" },

						-- Previous conditional end
						["äI"] = { query = "@conditional.inner", desc = "Previous conditional end" },

						-- Previous Comment end
						["äT"] = { query = "@comment.outer", desc = "Previous comment end" },
					},
				},
			},
		},
		config = function(_, opts)
			require('nvim-treesitter.configs').setup(opts)
			vim.keymap.set('n', '<leader>s',
				'<cmd>lua require"nvim-treesitter.incremental_selection".init_selection()<CR>',
				{ desc = "Initialize selection" })
			vim.keymap.set('n', '<TAB>', '<cmd>lua require"nvim-treesitter.incremental_selection".node_incremental()<CR>',
				{ desc = "Increment selection" })
			vim.keymap.set('n', '<S-TAB>',
				'<cmd>lua require"nvim-treesitter.incremental_selection".node_decremental()<CR>',
				{ desc = "Decrement selection" })
			vim.keymap.set('n', 'grc', '<cmd>lua require"nvim-treesitter.incremental_selection".scope_incremental()<CR>',
				{ desc = "Increment scope selection" })
		end,
	},
}

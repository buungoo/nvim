function myfunc()
	for i = 1, 10, 1 do
		print(i)
	end

	if something > 10 then
		print(something)
	end
end

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
						["aa"] = { query = "@parameter.outer", desc = "Select outer parameter" },
						["ia"] = { query = "@parameter.inner", desc = "Select inner parameter" },
						["al"] = { query = "@loop.outer", desc = "Select outer loop" },
						["il"] = { query = "@loop.inner", desc = "Select inner loop" },
						["ai"] = { query = "@conditional.outer", desc = "Select outer conditional" },
						["ii"] = { query = "@conditional.inner", desc = "Select inner conditional" },
						["at"] = { query = "@comment.outer", desc = "Select outer comment" },
						["it"] = { query = "@comment.inner", desc = "Select inner comment" },
						["ad"] = { query = "@function.outer", desc = "Select outer function" },
						["id"] = { query = "@function.inner", desc = "Select inner function" },
						["af"] = { query = "@call.outer", desc = "Select outer call" },
						["if"] = { query = "@call.inner", desc = "Select outer call" },
						["ac"] = { query = "@class.outer", desc = "Select outer class" },
						["ic"] = { query = "@class.inner", desc = "Select inner class" },
					},
				},
				move = {
					enable = true,
					set_jumps = true,

					-- Jump to the next object start
					goto_next_start = {
						["öd"] = { query = "@function.outer", desc = "Next function start" },
						["öf"] = { query = "@call.outer", desc = "Next function call start" },
						["öc"] = { query = "@class.outer", desc = "Next class start" },
						["öl"] = { query = "@loop.outer", desc = "Next loop start" },
						["öa"] = { query = "@parameter.inner", desc = "Next parameter" },
						["öt"] = { query = "@comment.outer", desc = "Next comment outer" },
						["öi"] = { query = "@conditional.inner", desc = "Next conditional" },
					},

					-- Jump to the next object end
					goto_next_end = {
						["öD"] = { query = "@function.outer", desc = "Next function end" },
						["öF"] = { query = "@call.outer", desc = "Next function call end" },
						["öC"] = { query = "@class.outer", desc = "Next class end" },
						["öL"] = { query = "@loop.outer", desc = "Next loop end" },
						["öT"] = { query = "@comment.outer", desc = "Next comment end" },
					},

					-- Jump to the previous object start
					goto_previous_start = {
						["äd"] = { query = "@function.outer", desc = "Previous function start" },
						["äf"] = { query = "@call.outer", desc = "Previous function call start" },
						["äc"] = { query = "@class.outer", desc = "Previous class start" },
						["äl"] = { query = "@loop.outer", desc = "Previous loop start" },
						["äa"] = { query = "@parameter.inner", desc = "Previous parameter" },
						["ät"] = { query = "@comment.outer", desc = "Previous comment outer" },
						["äi"] = { query = "@conditional.inner", desc = "Go to previous conditional" },
					},

					-- Jump to the previous object end
					goto_previous_end = {
						["äD"] = { query = "@function.outer", desc = "Previous function end" },
						["äF"] = { query = "@call.outer", desc = "Previous function call end" },
						["äC"] = { query = "@class.outer", desc = "Previous class end" },
						["äL"] = { query = "@loop.outer", desc = "Previous loop end" },
						["äT"] = { query = "@comment.outer", desc = "Previous comment end" },
					},
				},
			},
		},
		config = function(_, opts)
			require('nvim-treesitter.configs').setup(opts)
		end,
	},
}

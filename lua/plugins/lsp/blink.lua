return {
	"saghen/blink.cmp",
	enabled = true,
	version = "*",
	opts = {
		keymap = {
			preset = "enter",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<C-c>"] = { "cancel", "fallback" },
			-- ["<Tab>"] = { "snippet_forward", "fallback" },
		},

		appearance = {
			-- Using this broke the ghost text and it will be removed later anyway
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
		},

		completion = {
			list = {
				-- Do not auto-select in command mode
				selection = function(ctx)
					return ctx.mode == "cmdline" and "auto_insert" or "preselect"
				end,
			},

			-- The preview text of how it will look if the suggestion is accepted
			ghost_text = {
				enabled = true,
			},

			menu = {
				-- Remove the highlighting later to see if it has been improved
				winhighlight = "FloatBorder:BlinkCmpSignatureHelpBorder",
				scrollbar = false,
				border = "rounded",
				auto_show = true,
				draw = {
					treesitter = { "lsp" },
				},
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 50,
				window = {
					-- Remove the highlighting later to see if it has been improved
					winhighlight = "FloatBorder:BlinkCmpSignatureHelpBorder",
					border = "rounded",
				},
				-- Enable if cpu usage is high
				-- treesitter_highlighting = false,
			},
		},

		-- Asks for the argument inputs after a completion
		signature = {
			enabled = true,
			window = {
				-- Remove the highlighting later to see if it has been improved
				winhighlight = "FloatBorder:BlinkCmpSignatureHelpBorder",
				border = "rounded",
			},
		},

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
	},
}

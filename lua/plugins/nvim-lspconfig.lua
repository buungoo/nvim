return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Get snippet capabilities from nvim
		servers = {
			clangd = {},
			rust_analyzer = {},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			},
			texlab = {},
			-- dcmls = {}, -- Paid lsp :/
			gopls = {},
			docker_compose_language_service = {},
			dockerls = {},
			pyright = {},
			dartls = {
				-- on_attach = on_attach,
				settings = {
					dart = {
						analysisExcludedFolders = {
							vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
							vim.fn.expand("$HOME/.pub-cache"),
							vim.fn.expand("$HOME/tools/flutter"),
						},
					},
				},
			},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		local on_attach = function(client, bufnr)
			-- Key mappings for LSP features
			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end
			-- local opts = { noremap = true, silent = true }

			buf_set_keymap(
				"n",
				"<leader>ld",
				"<cmd>Telescope lsp_definitions<CR>",
				{ desc = "Go to definition" }
			)

			buf_set_keymap(
				"n",
				"<leader>lr",
				"<cmd>Telescope lsp_references<CR>",
				{ desc = "List references" }
			)

			buf_set_keymap(
				"n",
				"K",
				"<cmd>lua vim.lsp.buf.hover()<CR>",
				{ desc = "Show hover documentation" }
			)

			buf_set_keymap(
				"n",
				"<leader>li",
				"<cmd>Telescope lsp_implementations<CR>",
				{ desc = "Go to implementation" }
			)

			buf_set_keymap(
				"n",
				"<leader>lt",
				"<cmd>Telescope lsp_type_definitions<cr>",
				{ desc = "Go to type definition" }
			)

			-- Uncomment if needed:
			--
			-- buf_set_keymap(
			-- 	"n",
			-- 	"<C-k>",
			-- 	"<cmd>lua vim.lsp.buf.signature_help()<CR>",
			-- 	{ desc = "Show signature help" }
			-- )
			--
			-- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', { desc = "Add workspace folder" })
			--
			-- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', { desc = "Remove workspace folder" })
			--
			-- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { desc = "List workspace folders" })

			buf_set_keymap(
				"n",
				"<leader>lr",
				"<cmd>lua vim.lsp.buf.rename()<CR>",
				{ desc = "LSP Smart rename" }
			)

			buf_set_keymap(
				"n",
				"<leader>lc",
				"<cmd>lua vim.lsp.buf.code_action()<CR>",
				{ desc = "Code actions" }
			)

			-- Uncomment if needed:
			-- buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', { desc = "Format document" })

			buf_set_keymap(
				"n",
				"<leader>lH",
				"<cmd>lua vim.diagnostic.goto_prev()<CR>",
				{ desc = "Go to previous diagnostic" }
			)

			buf_set_keymap(
				"n",
				"<leader>lh",
				"<cmd>lua vim.diagnostic.goto_next()<CR>",
				{ desc = "Go to next diagnostic" }
			)
		end

		-- Loop through the servers and set up each one
		for server, config in pairs(opts.servers) do
			-- Merge the `on_attach` function and capabilities into the server config
			lspconfig[server].setup(
				vim.tbl_extend("force", config, { capabilities = opts.capabilities, on_attach = on_attach })
			)
		end
	end,
}

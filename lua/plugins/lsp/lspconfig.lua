return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		servers = {
			clangd = {
				-- server_capabilites = {
				-- 	documentFormattingProvider = false,
				-- 	documentRangeFormattingProvider = false,
				-- },
				-- cmd = {
				-- 	"clangd",
				-- 	"--compile-commands-dir=.", -- Ensures it looks for compile_commands.json in the project root
				-- 	"--background-index",
				-- 	"--log=error", -- Reduce noise in case of warnings or logs
				-- },
			},
			rust_analyzer = {
				cmd = {
					"rustup",
					"run",
					"stable",
					"rust-analyzer",
				},
				hints = { enable = true },
			},
			lua_ls = {},
			texlab = {},
			gopls = {},
			docker_compose_language_service = {},
			dockerls = {},
			pyright = {},
			rnix = {},
			dartls = {
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
			ts_ls = {},
		},
	},
	keys = {
		{
			"<leader>th",
			function()
				local is_enabled = vim.lsp.inlay_hint.is_enabled()
				vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = bufnr })
			end,
			desc = "Toggle Inlay Hints",
		},
		{
			"<leader>lr",
			function()
				vim.lsp.buf.rename()
			end,
			desc = "LSP Smart rename",
		},
		{
			"<leader>ls",
			function()
				vim.lsp.buf.code_action()
			end,
			desc = "Apply LSP Fix (Clangd Quick Fix)",
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")

		local on_attach = function(client, bufnr)
			-- Check if inlay hints are supported and enable them
			if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable and client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			end

			if client.name == "clangd" then
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end
		end

		-- Loop through the servers and set up each one
		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			config.on_attach = on_attach
			lspconfig[server].setup(config)
		end
	end,
}

-- local on_attach = function(client, bufnr)
-- 	-- Enable inlay hints using `vim.lsp.inlay_hint.enable`
-- 	if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable and client.server_capabilities.inlayHintProvider then
-- 		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
-- 	end
--
-- 	-- Key mappings for LSP features
-- 	local function buf_set_keymap(...)
-- 		vim.api.nvim_buf_set_keymap(bufnr, ...)
-- 	end
--
-- 	buf_set_keymap("n", "<leader>ls", "<cmd>lua toggle_inlay_hints()<CR>", { desc = "Toggle Inlay Hints" })
-- 	buf_set_keymap("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", { desc = "Go to definition" })
-- 	buf_set_keymap("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", { desc = "List references" })
-- 	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show hover documentation" })
-- 	buf_set_keymap(
-- 		"n",
-- 		"<leader>li",
-- 		"<cmd>Telescope lsp_implementations<CR>",
-- 		{ desc = "Go to implementation" }
-- 	)
-- 	buf_set_keymap(
-- 		"n",
-- 		"<leader>lt",
-- 		"<cmd>Telescope lsp_type_definitions<cr>",
-- 		{ desc = "Go to type definition" }
-- 	)
-- 	buf_set_keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP Smart rename" })
-- 	buf_set_keymap("n", "<leader>lc", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions" })
-- 	buf_set_keymap(
-- 		"n",
-- 		"<leader>lH",
-- 		"<cmd>lua vim.diagnostic.goto_prev()<CR>",
-- 		{ desc = "Go to previous diagnostic" }
-- 	)
-- 	buf_set_keymap(
-- 		"n",
-- 		"<leader>lh",
-- 		"<cmd>lua vim.diagnostic.goto_next()<CR>",
-- 		{ desc = "Go to next diagnostic" }
-- 	)
-- 	-- Uncomment if needed:
-- 	--
-- 	-- buf_set_keymap(
-- 	-- 	"n",
-- 	-- 	"<C-k>",
-- 	-- 	"<cmd>lua vim.lsp.buf.signature_help()<CR>",
-- 	-- 	{ desc = "Show signature help" }
-- 	-- )
-- 	--
-- 	-- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', { desc = "Add workspace folder" })
-- 	--
-- 	-- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', { desc = "Remove workspace folder" })
-- 	--
-- 	-- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { desc = "List workspace folders" })
-- end
-- 	end,
-- }

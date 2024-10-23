return {
	"neovim/nvim-lspconfig",
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
					},
				},
			},
			texlab = {},
			-- dcmls = {},
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

		-- Loop through the servers and announce that
		for server, config in pairs(opts.servers) do
			-- Announce that we have snippet capabilities to the lsp's
			lspconfig[server].setup(vim.tbl_extend("force", config, { capabilities = opts.capabilities }))
		end

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		-- local on_attach = function(client, bufnr)
		-- 	-- Helper function to set key mappings for the current buffer
		-- 	local function buf_set_keymap(mode, lhs, rhs, opts)
		-- 		vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or { noremap = true, silent = true })
		-- 	end
		--
		-- 	-- Common key mappings
		-- 	local opts = { noremap = true, silent = true }
		--
		-- 	-- LSP-specific keybindings
		-- 	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		-- 	-- buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		-- 	-- buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		-- 	-- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		-- 	-- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		-- 	-- buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		-- 	-- buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
		-- 	-- buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
		-- end
	end,
}

-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
-- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Old setup
-- return 	{
-- 	"neovim/nvim-lspconfig",
-- 	opts = {
-- 	}
-- 	config = function()
-- 		local lspconfig = require("lspconfig")
--
-- 		-- provide snippets from the lsp
-- 		local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- 		lspconfig.clangd.setup({
-- 			capabilities = capabilities
-- 		})
-- 		lspconfig.rust_analyzer.setup({
-- 			capabilities = capabilities
-- 		})
-- 		lspconfig.lua_ls.setup({
-- 			capabilities = capabilities
-- 		})
-- 		lspconfig.texlab.setup({
-- 			capabilities = capabilities
-- 		})
-- 		lspconfig.dcmls.setup({
-- 			capabilities = capabilities
-- 		})
-- 		lspconfig.golangci_lint_ls.setup({
-- 			capabilities = capabilities
-- 		})
-- 		lspconfig.docker_compose_language_service.setup({
-- 			capabilities = capabilities
-- 		})
-- 		lspconfig.docker_ls.setup({
-- 			capabilities = capabilities
-- 		})
--
-- 		-- lspconfig.digestif.setup({
-- 			-- })
--
-- 		end
-- 	}

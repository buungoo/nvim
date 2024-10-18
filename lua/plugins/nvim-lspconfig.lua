return {
	"neovim/nvim-lspconfig",
	opts = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Get snippet capabilities from nvim
		servers = {
			clangd = {},
			rust_analyzer = {},
			lua_ls = {},
			texlab = {},
			dcmls = {},
			golangci_lint_ls = {},
			docker_compose_language_service = {},
			dockerls = {},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")

		-- Loop through the servers and announce that 
		for server, config in pairs(opts.servers) do
			-- Announce that we have snippet capabilities to the lsp's
			lspconfig[server].setup(vim.tbl_extend("force", config, { capabilities = opts.capabilities }))
		end
	end
}

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

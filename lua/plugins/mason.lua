return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jay-babu/mason-null-ls.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_null_ls = require("mason-null-ls")

		mason.setup({
			ui = {
				icons = {
					package_installed = "📦", -- Box for installed packages
					package_pending = "⏳", -- Hourglass for packages pending installation
					package_uninstalled = "❌", -- Cross mark for uninstalled packages
					package_error = "⚠️", -- Warning icon for installation errors
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"rust_analyzer",
				"lua_ls",
				"pyright",
				"clangd",
				"texlab",
				"gopls",
				"typescript-language-server",
			},
			automatic_installation = true,
		})

		mason_null_ls.setup({
			ensure_installed = {
				"black",
				"ruff",
			},
			automatic_installation = true,
		})
	end,
}

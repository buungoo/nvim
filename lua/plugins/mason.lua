return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

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
			},
			automatic_installation = true,
		})
	end,
}

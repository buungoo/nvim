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
					package_installed = "✓", -- Installed icon
					package_pending = "➜", -- Pending installation icon
					package_uninstalled = "✗",
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

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
		local mason_nvim_dap = require("mason-nvim-dap")
		print(mason_nvim_dap)

		mason.setup({
			ui = {
				icons = {
					package_installed = "📦",
					package_pending = "⏳",
					package_uninstalled = "❌",
					package_error = "⚠️",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"clangd",
				"texlab",
				"gopls",
			},
			automatic_installation = true,
		})

		mason_null_ls.setup({
			ensure_installed = {
				-- "black",
				-- "ruff",
			},
			-- automatic_installation = true,
		})

		-- Set up mason-nvim-dap to ensure codelldb is available for nvim-dap
		-- mason_nvim_dap.setup({
		-- 	ensure_installed = { "codelldb" }, -- Add codelldb for debugging support
		-- 	automatic_installation = true,
		-- })
	end,
}

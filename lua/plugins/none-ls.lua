-- return {
-- 	"nvimtools/none-ls.nvim",
-- 	keys = {
-- 		{
-- 			"<leader>lf",
-- 			vim.lsp.buf.format,
-- 			desc = "format file",
-- 		},
-- 	},
-- 	config = function()
-- 		local null_ls = require("null-ls")
-- 		null_ls.setup({
-- 			sources = {
-- 				null_ls.builtins.formatting.stylua,
-- 			},
-- 		})
-- 	end,
-- }

return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = function()
		local none_ls = require("null-ls") -- Require none-ls here
		return {
			sources = {
				none_ls.builtins.formatting.stylua,
				none_ls.builtins.formatting.black,
				none_ls.builtins.diagnostics.ruff,
			},
		}
	end,
	keys = {
		{
			"<leader>lf",
			function()
				vim.lsp.buf.format({ async = true })
			end,
			desc = "format file",
		},
	},
}

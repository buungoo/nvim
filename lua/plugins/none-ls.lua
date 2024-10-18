return {
	"nvimtools/none-ls.nvim",
	keys = {
		{
			"<leader>ff",
			vim.lsp.buf.format,
			desc = "format file",
		},
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
			},
		})
	end,
}

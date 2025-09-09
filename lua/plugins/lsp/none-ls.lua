return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = function()
		local none_ls = require("null-ls")
		return {
			sources = {
				none_ls.builtins.formatting.stylua, -- Lua formatter
				none_ls.builtins.formatting.clang_format.with({
					filetypes = { "c", "c++" },
					extra_args = { "-style={IndentWidth: 3}" },
				}),
				-- none_ls.builtins.formatting.latexindent,
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

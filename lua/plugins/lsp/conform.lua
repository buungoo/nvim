-- Alternative to null-ls
return {
	"stevearc/conform.nvim",
	enabled = false,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff", "black" },
		},
	},
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format()
			end,
			desc = "format file",
		},
	},
}

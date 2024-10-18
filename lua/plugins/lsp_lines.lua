--TODO: Toggling using <leader>l doesn't enable only_current_line
-- return {
-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
-- 	config = function()
-- 		require("lsp_lines").setup()
-- 		vim.diagnostic.config({
-- 			virtual_text = false,
-- 			virtual_lines = { only_current_line = true },
-- 		})
-- 		vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
-- 	end,
-- }
return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	enabled = false,
	event = { "LspAttach", "DiagnosticChanged" },
	opts = {
		virtual_text = false,
		virtual_lines = { only_current_line = true },
	},
	keys = {
		{
			"<leader>l",
			function ()
				-- vim.diagnostic.config(opts)
				require("lsp_lines").toggle()
			end,
			desc = "Toggle lsp_lines"
		}
	},
	config = function(_, opts)
		vim.diagnostic.config(opts)
	-- 	require("lsp_lines").setup()
	-- 	vim.diagnostic.config(opts)
	-- 	vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
	end,
}

return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	enabled = false,
	config = function()
		require("lsp_lines").setup()

		local function toggle_lsp_lines()
			local config = vim.diagnostic.config()
			if config.virtual_lines then
				-- Disable lsp_lines and enable virtual_text
				vim.diagnostic.config({
					-- virtual_text = true,
					virtual_lines = false,
					virtual_text = false,
				})
			else
				-- Enable lsp_lines with only_current_line and disable virtual_text
				vim.diagnostic.config({
					virtual_text = false,
					underline = true,
					update_in_insert = true,
					virtual_lines = { only_current_line = true },
				})
			end
		end

		-- Set initial diagnostic config
		vim.diagnostic.config({
			virtual_text = false,
			virtual_lines = { only_current_line = false },
		})

		-- Set keymap to toggle lsp_lines
		vim.keymap.set("", "<Leader>l", toggle_lsp_lines, { desc = "Toggle lsp_lines" })
	end,
}

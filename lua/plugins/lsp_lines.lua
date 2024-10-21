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

-- return {
-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
-- 	enabled = false,
-- 	event = { "LspAttach", "DiagnosticChanged" },
-- 	opts = {
-- 		virtual_text = false,
-- 		virtual_lines = { only_current_line = true },
-- 	},
-- 	keys = {
-- 		{
-- 			"<leader>l",
-- 			function ()
-- 				-- vim.diagnostic.config(opts)
-- 				require("lsp_lines").toggle()
-- 			end,
-- 			desc = "Toggle lsp_lines"
-- 		}
-- 	},
-- 	config = function(_, opts)
-- 		vim.diagnostic.config(opts)
-- 	-- 	require("lsp_lines").setup()
-- 	-- 	vim.diagnostic.config(opts)
-- 	-- 	vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
-- 	end,
-- }

-- return {
-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
-- 	config = function()
-- 		require("lsp_lines").setup()
--
-- 		local function toggle_lsp_lines()
-- 			local config = vim.diagnostic.config()
-- 			if config.virtual_lines then
-- 				-- Disable lsp_lines and enable virtual_text
-- 				vim.diagnostic.config({
-- 					-- virtual_text = true,
-- 					virtual_lines = false,
-- 				})
-- 			else
-- 				-- Enable lsp_lines with only_current_line and disable virtual_text
-- 				vim.diagnostic.config({
-- 					virtual_text = false,
-- 					virtual_lines = { only_current_line = true },
-- 				})
-- 			end
-- 		end
--
-- 		-- Set initial diagnostic config
-- 		vim.diagnostic.config({
-- 			virtual_text = false,
-- 			virtual_lines = { only_current_line = true },
-- 		})
--
-- 		-- Set keymap to toggle lsp_lines
-- 		vim.keymap.set("", "<Leader>l", toggle_lsp_lines, { desc = "Toggle lsp_lines" })
-- 	end,
-- }

return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	enabled = true,
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
			virtual_lines = { only_current_line = true },
		})

		-- Set keymap to toggle lsp_lines
		vim.keymap.set("", "<Leader>l", toggle_lsp_lines, { desc = "Toggle lsp_lines" })
	end,
}


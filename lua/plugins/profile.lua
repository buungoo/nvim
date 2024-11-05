-- return {
-- 	"Kurama622/profile.nvim",
-- 	enabled = true,
-- 	dependencies = { "3rd/image.nvim" },
-- 	config = function()
-- 		require("profile").setup({
-- 			-- avatar_path = "<your avatar path>", -- default: profile.nvim/resources/profile.png
-- 		})
-- 		vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>Profile<cr>", { silent = true })
-- 	end,
-- }

return {
	"Kurama622/profile.nvim",
	enabled = false,
	dependencies = {
		"3rd/image.nvim",
	},
	config = function()
		require("profile").setup({
			-- avatar_path = "<your avatar path>", -- default: profile.nvim/resources/profile.png
		})
		vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>Profile<cr>", { silent = true })
	end,
}

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

-- its very cool but im remvoing if the snacks covers this
-- return {
-- 	"Kurama622/profile.nvim",
-- 	enabled = false,
-- 	dependencies = {
-- 		"3rd/image.nvim",
-- 	},
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
	dependencies = { "3rd/image.nvim" },
	cmd = { "Profile" },
	config = function()
		local comp = require("profile.components")
		require("profile").setup {
			user = "TwIStOy", -- User for profile
			git_contributions = {
				start_week = 1,
				end_week = 53,
				empty_char = " ",
				full_char = { "", "󰧞", "", "", "" },
				fake_contributions = nil, -- No fake contributions
			},
			hide = {
				statusline = true,
				tabline = true,
			},
			disable_move = true, -- Disable movement
			format = function()
				-- Removed avatar rendering line
				-- comp:avatar()  -- No avatar to render

				comp:separator_render()

				-- Render git contributions
				comp:git_contributions_render("ProfileGreen")
			end,
		}
	end,
}

return {
	"shellRaining/hlchunk.nvim",
	event = { "UIEnter" },
	enabled = true,
	config = function()
		local kanagawa_colors = require('kanagawa.colors').setup({ theme = 'wave' })
		if not kanagawa_colors then return end

		require("hlchunk").setup({
			chunk = {
				enable = true,
				use_treesitter = true,
				chars = {
					right_arrow = "─",
				},
				delay = 0,
				duration = 100,
				style = {
					kanagawa_colors.palette.roninYellow,  -- Primary chunk color
					kanagawa_colors.palette.autumnRed,    -- Error-containing chunks
				},
			},
			indent = {
				enable = true,
				chars = {
					"│",
				},
				style = {
					kanagawa_colors.palette.sumiInk5,  -- Subtle indent guide color
				},
			},
		})
	end
}

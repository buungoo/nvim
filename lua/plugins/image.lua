return {
	"3rd/image.nvim",
	enabled = false,
	-- build = false,
	opts = {},
	config = function()
		require("image").setup() -- Ensure image.nvim is set up first
	end,
}

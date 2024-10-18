return {
	-- lazy automatically defaults to github, thus only the repo specifier is needed
	"rebelot/kanagawa.nvim",
	config = function()
		-- only if the plugin is installed will this code run
		vim.cmd.colorscheme("kanagawa-wave")
	end,
}

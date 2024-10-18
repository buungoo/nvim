-- return {
--     'nvim-lualine/lualine.nvim',
--     dependencies = { 'nvim-tree/nvim-web-devicons' },
-- 	opts = {}
-- }
return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			theme = 'auto',                                    -- you can specify your current theme
			section_separators = { '', '' },                   -- Remove separators for a cleaner look
			component_separators = { '|', '|' },               -- You can use more subtle separators
			disabled_filetypes = { "NvimTree", "toggleterm" }, -- Disable in certain file types
			globalstatus = true,                               -- Use global status line (for better visibility)
		},
		sections = {
			lualine_a = { 'mode' },         -- Display current mode
			lualine_b = { 'branch', 'diff' }, -- Show branch and diff info
			lualine_c = {
				{
					'filename',
					path = 1,                                   -- 1: Relative path
					shorting_target = 40                        -- Shorten to 40 characters if necessary
				},
				'diagnostics',                                  -- Show diagnostics
			},
			lualine_x = { 'encoding', 'fileformat', 'filetype' }, -- Encoding, format, and type
			lualine_y = { 'location' },                         -- Current line and column
			lualine_z = { 'progress' },                         -- Show progress percentage
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { 'filename' },
			lualine_x = { 'location' },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = { 'fugitive' }, -- Optional: Add Git support with fugitive
	}
}

return {
    'sethen/line-number-change-mode.nvim',
	enabled = false,
    config = function()
        -- Load the Kanagawa palette
        local kanagawa_colors = require('kanagawa.colors').setup({ theme = 'wave' })

        if not kanagawa_colors then
            return
        end

        require("line-number-change-mode").setup({
            mode = {
                i = {
                    bg = kanagawa_colors.palette.springGreen,  -- Insert mode
                    fg = kanagawa_colors.palette.sumiInk0,    -- Background
                    bold = true,
                },
                n = {
                    bg = kanagawa_colors.palette.waveBlue2,   -- Normal mode
                    -- fg = kanagawa_colors.palette.sumiInk0,    -- Background
                    -- bold = true,
                },
                R = {
                    bg = kanagawa_colors.palette.autumnRed,   -- Replace mode
                    fg = kanagawa_colors.palette.sumiInk0,    -- Background
                    bold = true,
                },
                v = {
                    bg = kanagawa_colors.palette.dragonPink,  -- Visual mode
                    fg = kanagawa_colors.palette.sumiInk0,    -- Background
                    bold = true,
                },
                V = {
                    bg = kanagawa_colors.palette.dragonPink,  -- Visual-line mode
                    fg = kanagawa_colors.palette.sumiInk0,    -- Background
                    bold = true,
                },
            }
        })
    end
}

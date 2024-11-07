-- return {
-- 	"mfussenegger/nvim-dap",
-- 	recommended = true,
-- 	desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
--
-- 	dependencies = {
-- 		"rcarriga/nvim-dap-ui",
-- 		-- virtual text for the debugger
-- 		{
-- 			"theHamsta/nvim-dap-virtual-text",
-- 			opts = {},
-- 		},
-- 	},
--
-- 	-- stylua: ignore
-- 	keys = {
-- 		{ "<leader>d",  "",                                                                                   desc = "+debug",                 mode = { "n", "v" } },
-- 		{ "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
-- 		{ "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
-- 		{ "<leader>dc", function() require("dap").continue() end,                                             desc = "Continue" },
-- 		{ "<leader>da", function() require("dap").continue({ before = get_args }) end,                        desc = "Run with Args" },
-- 		{ "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
-- 		{ "<leader>dg", function() require("dap").goto_() end,                                                desc = "Go to Line (No Execute)" },
-- 		{ "<leader>di", function() require("dap").step_into() end,                                            desc = "Step Into" },
-- 		{ "<leader>dj", function() require("dap").down() end,                                                 desc = "Down" },
-- 		{ "<leader>dk", function() require("dap").up() end,                                                   desc = "Up" },
-- 		{ "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run Last" },
-- 		{ "<leader>do", function() require("dap").step_out() end,                                             desc = "Step Out" },
-- 		{ "<leader>dO", function() require("dap").step_over() end,                                            desc = "Step Over" },
-- 		{ "<leader>dp", function() require("dap").pause() end,                                                desc = "Pause" },
-- 		{ "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
-- 		{ "<leader>ds", function() require("dap").session() end,                                              desc = "Session" },
-- 		{ "<leader>dt", function() require("dap").terminate() end,                                            desc = "Terminate" },
-- 		{ "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },
-- 	},
--
-- 	config = function()
-- 	end,
-- }

return {
	"mfussenegger/nvim-dap",
<<<<<<< HEAD
	enabled = false,
=======
	recommended = true,
	desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

>>>>>>> 6ef78b4 (laptop save)
	dependencies = {
		-- virtual text for the debugger
		-- "theHamsta/nvim-dap-virtual-text",
		-- opts = {},
		"rcarriga/nvim-dap-ui",
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {
				enabled = true,          -- Enable virtual text by default
				highlight_changed_variables = true, -- Highlight variables that changed since last step
				highlight_new_as_changed = true, -- Highlight all new variables as changed
				show_stop_reason = true, -- Show the reason why the debugger has stopped
				commented = true,        -- Prefix virtual text with comment symbols
				only_first_definition = false, -- Show virtual text on all definitions, not just the first
				all_references = true,   -- Show virtual text at all reference locations
			},
		},
		"jay-babu/mason-nvim-dap.nvim" -- add mason-nvim-dap as a dependency
	},

	keys = {
		-- (your existing keybindings here)
		-- Keymap to toggle a breakpoint at the current line
		--
		{
			"<leader>bb",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint"
		},
	},

	config = function()
		local dap = require("dap")
		require("mason-nvim-dap").setup({
			ensure_installed = { "codelldb" }, -- Ensure that codelldb is installed
			automatic_installation = true, -- Automatically install missing debuggers
		})

		-- Configure dap to use codelldb for debugging
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = "codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}

		-- You can duplicate the `cpp` configuration for C or Rust if needed
		-- dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp
	end,
}

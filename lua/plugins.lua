-- sets up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- find lazy i.e. stdpath("data")/lazy/lazy.nvim/lua/lazy
require("lazy").setup({
	-- tell lazy which plugins to install
	{
		-- lazy automatically defaults to github, thus only the repo specifier is needed
		"rebelot/kanagawa.nvim",
		config = function()
			-- only if the plugin is installed will this code run
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
	{
		-- pull in this module which will be set up and configured inside the nvim-treesitter module
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = { "c", "lua", "python", "vim", "vimdoc", "query", "rust", "latex", "go", "dart", "dockerfile" },
				auto_install = true,
				highlight = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					-- I would use keys but it does not work for this
					keymaps = {
						init_selection = "<leader>s",
						node_incremental = "<TAB>",
						node_decremental = "<S-TAB>",
						scope_incremental = "grc",
					},
				},
				-- part of nvim-treesitter-textobjects
				textobjects = {
					select = {
						enable = true,

						-- automatically jump forward to textobj
						lookahead = true,

						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["as"] = "@scope",
						},

						selection_modes = {
							["@parameter.outer"] = "v",
							["@function.outer"] = "v",
							["@class.outer"] = "<c-v>",
						},
					},
				},
			}
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- provide snippets from the lsp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.clangd.setup({
				capabilities = capabilities
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities
			})
			lspconfig.texlab.setup({
				capabilities = capabilities
			})
			lspconfig.dcmls.setup({
				capabilities = capabilities
			})
			lspconfig.golangci_lint_ls.setup({
				capabilities = capabilities
			})
			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities
			})
			lspconfig.docker_ls.setup({
				capabilities = capabilities
			})

			-- lspconfig.digestif.setup({
			-- })

		end
	},
	{
		-- Re-enable this is in the options.lua file if this plugin is removed
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
			vim.diagnostic.config({
				virtual_text = false,
				virtual_lines = { only_current_line = true },
			})
			vim.keymap.set(
			"",
			"<Leader>l",
			require("lsp_lines").toggle,
			{ desc = "Toggle lsp_lines" }
			)
			-- keys = {
			-- 	"<leader>l",
			-- 	require("lsp_lines").toggle,
			-- 	desc = "Toggle lsp_lines"
			-- },
		end,
	},
	{
		"yorickpeterse/nvim-window",
		keys = {
			{
				"<leader>w",
				"<cmd>lua require('nvim-window').pick()<cr>",
				desc = "nvim-window: jump to window"
			},
		},
		-- config = true,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	},
	{
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		keys = {
			{ "<leader>n", ":Neotree toggle right<CR>", desc = "Toggle Neotree"}
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
				}),
			})
		end,
	},
	{
		"lervag/vimtex",
		lazy = false,     -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
			vim.g.maplocalleader = ","
		end
	},
})

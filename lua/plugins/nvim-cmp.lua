-- return {
-- 	"hrsh7th/nvim-cmp",
-- 	event = "InsertEnter",
-- 	dependencies = {
-- 		"hrsh7th/cmp-buffer",
-- 		"hrsh7th/cmp-path",
-- 		"hrsh7th/cmp-nvim-lua",
-- 		"hrsh7th/cmp-nvim-lsp",
-- 	},
-- 	config = function()
-- 		local cmp = require("cmp")
-- 		cmp.setup({
-- 			snippet = {
-- 				expand = function(args)
-- 					vim.snippet.expand(args.body)
-- 				end,
-- 			},
-- 			window = {
-- 				completion = cmp.config.window.bordered(),
-- 				documentation = cmp.config.window.bordered(),
-- 			},
-- 			mapping = cmp.mapping.preset.insert({
-- 				['<C-b>'] = cmp.mapping.scroll_docs(-4),
-- 				['<C-f>'] = cmp.mapping.scroll_docs(4),
-- 				['<C-Space>'] = cmp.mapping.complete(),
-- 				['<C-e>'] = cmp.mapping.abort(),
-- 				['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
-- 			}),
-- 			sources = cmp.config.sources({
-- 				{ name = "nvim_lsp" },
-- 				{ name = "buffer" },
-- 			}),
-- 		})
-- 	end,
-- }
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		-- "L3MON4D3/LuaSnip"
	},
	config = function()
		local cmp = require("cmp")
		-- local luasnip = require("luasnip")
		-- require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect"
			},
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
					-- luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				['<C-b>'] = cmp.mapping.scroll_docs(-4),	-- Not working in 10.2
				['<C-f>'] = cmp.mapping.scroll_docs(4),		-- Not working in 10.2
				['<C-Space>'] = cmp.mapping.complete(),
				-- ['<ESC>'] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		cmp.abort()
				-- 	else
				-- 		fallback() -- The fallback function sends the original key (TAB).
				-- 	end
				-- end, { 'i', 's' }),
				['<c-c>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.abort()
					else
						fallback() -- The fallback function sends the original key (TAB).
					end
				end, { 'i', 's' }),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				['<TAB>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback() -- The fallback function sends the original key (TAB).
					end
				end, { 'i', 's' }), -- 'i' for insert mode, 's' for select mode.
				['<S-TAB>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback() -- The fallback function sends the original key (S-TAB).
					end
				end, { 'i', 's' }),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				-- { name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}

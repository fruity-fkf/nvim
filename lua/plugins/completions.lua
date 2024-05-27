return {
	{
		"L3MON4D3/LuaSnip",
		lazy = false,
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	{ "chrisgrieser/cmp-nerdfont", lazy = false },

	{
		"hrsh7th/cmp-emoji",
		lazy = false,
	},

	{

		"hrsh7th/cmp-nvim-lsp",
		lazy = false,
		config = true,
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		dependencies = { "hrsh7th/cmp-path", "mtoohey31/cmp-fish" },
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				window = {
					documentation = cmp.config.window.bordered(),
					completion = cmp.config.window.bordered(),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" },

					{ name = "obsidian.nvim" },
					{ name = "fish" },
					{ name = "emoji" },
					{ name = "nerdfont" },
				}),
			})
		end,
	},

	{
		"garymjr/nvim-snippets",
		opts = {
			friendly_snippets = true,
			global_snippets = { "all", "global" },
		},
		dependencies = { "rafamadriz/friendly-snippets" },
	},

	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {
			mappings = {
				["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\`].", register = { cr = false } },
			},
		},
		keys = {
			{
				"<leader>up",
				function()
					vim.g.minipairs_disable = not vim.g.minipairs_disable
					if vim.g.minipairs_disable then
						LazyVim.warn("Disabled auto pairs", { title = "Option" })
					else
						LazyVim.info("Enabled auto pairs", { title = "Option" })
					end
				end,
				desc = "Toggle Auto Pairs",
			},
		},
	},
}

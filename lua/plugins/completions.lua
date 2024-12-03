-- configure autocomplete
return {
	"hrsh7th/nvim-cmp",

	lazy = true,
	-- This one is more slow but "better"
	-- event = { "InsertEnter", "CmdlineEnter" },
	event = { "InsertEnter" },
	dependencies = {
		-- autocomplete plugins
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"saadparwaiz1/cmp_luasnip",
		"chrisgrieser/cmp-nerdfont",
		"hrsh7th/cmp-emoji",
		"mtoohey31/cmp-fish",

		-- "hrsh7th/cmp-nvim-lsp-signature-help",
		-- "hrsh7th/cmp-calc",

		-- vscode like icons to autocomplete list
		"onsails/lspkind.nvim",
		-- snippet plugin
		"L3MON4D3/LuaSnip",

		{
			"garymjr/nvim-snippets",

			lazy = true,
			opts = {
				friendly_snippets = true,
			},
			dependencies = { "rafamadriz/friendly-snippets" },
		},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		require("luasnip/loaders/from_vscode").lazy_load()
		local lspkind = require("lspkind")

		cmp.setup({
			auto_brackets = {}, -- configure any filetype to auto add brackets
			performance = {
				debounce = 0, -- default is 60ms
				throttle = 0, -- default is 30ms
			},
			completion = {
				keyword_length = 1,
				completeopt = "menu,menuone,noselect",
			},
			formatting = {
				expandable_indicator = true,
				fields = {
					"abbr",
					"kind",
					"menu",
				},
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 65,
					-- ellipsis_char = "...",
					show_labelDetails = false,
					before = function(entry, item)
						item.menu = ""
						return item
					end,
				}),
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
				-- WARNING: working state

				-- WARNING: THIS IS WORKING DO NOT TOUCH THIS MF

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				-- ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				-- ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<Esc>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
			},
			-- `/` cmdline setup.
			cmp.setup.cmdline({ "/", "?" }, {
				completion = { completeopt = "menu,menuone,noselect" },
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			}),
			-- `:` cmdline setup.
			cmp.setup.cmdline(":", {
				completion = { completeopt = "menu,menuone,noselect" },
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources(
					{ { name = "path" } },
					{ { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }
				),
			}),
			-- sources for autocompletion
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
				{ name = "supermaven" },
				{ name = "fish" },
				{ name = "emoji" },
				{ name = "nerdfont" },

				-- { name = "nvim_lsp_signature_help" },
				-- { name = "calc" }, --for maths calculations
			},
		})
	end,
}

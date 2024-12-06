return {

	{
		"williamboman/mason.nvim",

		-- lazy = true,
		config = function()
			require("mason").setup()
		end,
	},
	{

		"williamboman/mason-lspconfig.nvim",

		-- lazy = true,
		config = function()
			require("mason-lspconfig").setup({})
		end,
	},

	{

		"neovim/nvim-lspconfig",

		-- lazy = true,
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.pyright.setup({})

			lspconfig.clangd.setup({})

			lspconfig.lua_ls.setup({})

			require("lspconfig").markdown_oxide.setup({})
			require("lspconfig").marksman.setup({})
		end,
	},
}

return {
	{ "RRethy/base16-nvim" },
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},

	{ "sainnhe/edge" },
	{ "navarasu/onedark.nvim" },
	{ "shaunsingh/nord.nvim" },
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},

	{
		"rebelot/kanagawa.nvim",
	},

	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_background = "hard"
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},

		config = function()
			require("gruvbox").setup({
				contrast = "hard",
				transparent_mode = false,
			})
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		opts = {
			transparent_background = true,
		},
	},
	{
		"LunarVim/Colorschemes",
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function() end,
	},

	{
		"andrew-george/telescope-themes",
		config = function()
			require("telescope").load_extension("themes")
		end,
	},
}

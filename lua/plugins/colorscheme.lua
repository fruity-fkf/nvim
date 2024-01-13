return {
	{
		"rebelot/kanagawa.nvim",
	},

	{
		"sainnhe/gruvbox-material",

		config = function()
			gruvbox_material_background = "soft"
		end,
	},

	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = function() end },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
}

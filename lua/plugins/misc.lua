return {

	-- Lua
	{ "andweeb/presence.nvim" },

	{ "nvzone/timerly", lazy = true, dependencies = {
		"nvzone/volt",
	} },
	{
		"folke/zen-mode.nvim",

		lazy = true,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{ "nvchad/volt", lazy = true },
	{
		"nvchad/minty",

		lazy = true,
		cmd = { "Shades", "Huefy" },
	},

	{
		"norcalli/nvim-colorizer.lua",
		lazy = true,
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	{ "akinsho/toggleterm.nvim", version = "*", opts = {} },
	-- {
	-- 	"wfxr/minimap.vim",
	-- 	build = "cargo install --locked code-minimap",
	-- 	cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
	-- 	config = function()
	-- 		vim.cmd("let g:minimap_width = 10")
	-- 		vim.cmd("let g:minimap_auto_start = 1")
	-- 		vim.cmd("let g:minimap_auto_start_win_enter = 1")
	-- 	end,
	-- },

	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	{
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("spectre").setup()
		end,
	},
}

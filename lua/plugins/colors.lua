return {
	--
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
	},
	-- -- { "RRethy/base16-nvim" },
	-- {
	--   "scottmckendry/cyberdream.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   opts = {
	--     transparent = true,
	--     styles = {
	--       sidebars = "transparent",
	--       floats = "transparent",
	--     },
	--   },
	-- },
	--
	-- { "sainnhe/edge" },
	-- { "navarasu/onedark.nvim" },
	-- { "shaunsingh/nord.nvim" },
	-- {
	--   "rose-pine/neovim",
	--   name = "rose-pine",
	-- },
	--
	-- {
	--   "rebelot/kanagawa.nvim",
	--   lazy = true,
	-- },
	--
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

	-- {
	--   "ellisonleao/gruvbox.nvim",
	--   priority = 1000,
	--   opts = {
	--     transparent = true,
	--     styles = {
	--       sidebars = "transparent",
	--       floats = "transparent",
	--     },
	--   },
	--
	--   config = function()
	--     require("gruvbox").setup({
	--       contrast = "hard",
	--       transparent_mode = false,
	--     })
	--   end,
	-- },
	-- {
	--   "catppuccin/nvim",
	--   name = "catppuccin",
	--   priority = 1000,
	--   config = function()
	--     require("catppuccin").setup({
	--       flavour = "auto", -- latte, frappe, macchiato, mocha
	--       background = {    -- :h background
	--         light = "latte",
	--         dark = "mocha",
	--       },
	--       transparent_background = true, -- disables setting the background color.
	--       show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
	--       term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
	--       dim_inactive = {
	--         enabled = false,             -- dims the background color of inactive window
	--         shade = "dark",
	--         percentage = 0.15,           -- percentage of the shade to apply to the inactive window
	--       },
	--       no_italic = false,             -- Force no italic
	--       no_bold = false,               -- Force no bold
	--       no_underline = false,          -- Force no underline
	--       styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
	--         comments = { "italic" },     -- Change the style of comments
	--         conditionals = { "italic" },
	--         loops = {},
	--         functions = {},
	--         keywords = {},
	--         strings = {},
	--         variables = {},
	--         numbers = {},
	--         booleans = {},
	--         properties = {},
	--         types = {},
	--         operators = {},
	--         -- miscs = {}, -- Uncomment to turn off hard-coded styles
	--       },
	--       color_overrides = {},
	--       custom_highlights = {},
	--       default_integrations = true,
	--       integrations = {
	--         cmp = true,
	--         gitsigns = true,
	--         nvimtree = true,
	--         treesitter = true,
	--         notify = true,
	--         mini = {
	--           enabled = true,
	--           indentscope_color = "",
	--         },
	--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	--       },
	--     })
	--   end,
	-- },
	--
	-- {
	--   "folke/tokyonight.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   opts = {},
	--   config = function() end,
	-- },
	--
	--
	--NOTE This installs  a bunch of shit... use at discresion
	-- {
	-- 	"linrongbin16/colorbox.nvim",
	--
	-- 	-- don't lazy load
	-- 	lazy = false,
	-- 	-- load with highest priority
	-- 	priority = 1000,
	--
	-- 	build = function()
	-- 		require("colorbox").update()
	-- 	end,
	-- 	config = function()
	-- 		require("colorbox").setup()
	-- 	end,
	-- },
}

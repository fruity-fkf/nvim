return {

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
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("spectre").setup()
		end,
	},

	{
		"kevinhwang91/rnvimr",
	},
}

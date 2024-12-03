return {
	"nvim-neo-tree/neo-tree.nvim",

	lazy = true,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({

			source_selector = {
				winbar = true,
				statusline = true,
			},

			window = {
				mappings = {
					["p"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
				},
			},
		})
	end,
}

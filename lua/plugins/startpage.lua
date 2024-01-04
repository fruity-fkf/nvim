return {
	"startup-nvim/startup.nvim",
	requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		require("startup").setup({ theme = "dashboard" }) -- theme name here from https://github.com/startup-nvim/startup.nvim
	end,
}

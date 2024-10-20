return {
	"akinsho/bufferline.nvim",
	dependencies = "kyazdani42/nvim-web-devicons",
	--[[ tag = "v3.*", ]]
	config = function()
		local status_ok, bufferline = pcall(require, "bufferline")
		if not status_ok then
			return
		end
		vim.opt.termguicolors = true
		bufferline.setup({})
	end,
}

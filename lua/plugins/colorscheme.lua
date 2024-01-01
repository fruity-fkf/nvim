return{{ "ellisonleao/gruvbox.nvim",
priority = 1000 ,
config = function()
end
},

  {
  "LunarVim/Colorschemes"},

  {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
    config = function ()
      vim.cmd.colorscheme "tokyonight"

    end
},



}

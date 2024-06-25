return {
  { "LunarVim/Colorschemes" },
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
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_background = "hard"
    end
  },




  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        transparent_mode = false,
      })
      vim.cmd.colorscheme('gruvbox')
    end
  },
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

  {
    "andrew-george/telescope-themes",
    config = function()
      require("telescope").load_extension("themes")
    end,
  },
}

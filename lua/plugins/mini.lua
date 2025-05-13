return {
  {
    "echasnovski/mini.nvim",
    enabled = true,
    config = function()
      require("mini.statusline").setup()
      require("mini.tabline").setup()
      require("mini.pairs").setup()
      require("mini.hipatterns").setup()
      require("mini.colors").setup()
      require("mini.git").setup()
      require("mini.surround").setup()
      require("mini.ai").setup()
      require("mini.comment").setup()
      require("mini.basics").setup()
      require("mini.icons").setup()
      require("mini.files").setup()
    end,
  },
}

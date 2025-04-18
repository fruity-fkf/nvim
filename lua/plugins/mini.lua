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
      local gen_loader = require("mini.snippets").gen_loader

      require("mini.snippets").setup({
        snippets = {
          gen_loader.from_lang(),
          c = require("snippets.c"),
          cpp = require("snippets.c"),
          asm = require("snippets.asm"),
          python = require("snippets.python"),
        },
      })
    end,
  },
}

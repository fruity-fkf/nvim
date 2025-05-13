return {



  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "javascriptreact", "typescriptreact" },
    init = function()
      vim.g.user_emmet_leader_key = '<leader>E' -- Change this if you want
    end,
  },

  {
    "fruity-fkf/assembly-cheatsheet.vim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      vim.api.nvim_create_user_command("AssemblyCheatsheet", function()
        require("assembly_cheatsheet").cheatsheet()
      end, {})
    end
  },


  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false,   -- This plugin is already lazy
  },
}

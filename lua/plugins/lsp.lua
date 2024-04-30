return {

  {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup()
    end,
  },
  {

    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd" },
      })
    end,
  },

  {

    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({})

      lspconfig.clangd.setup({})

      lspconfig.lua_ls.setup({})
    end,
  },
}

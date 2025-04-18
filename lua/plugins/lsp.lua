return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      --
      --        SET UP LSPS HERE
      --
      require("lspconfig").lua_ls.setup({ capabilites = capabilities })
      require("lspconfig").clangd.setup({ capabilites = capabilities })
      require("lspconfig").pyright.setup({ capabilites = capabilities })
      require("lspconfig").gopls.setup({ capabilites = capabilities })
      require("lspconfig").solargraph.setup({ capabilites = capabilities })
      -- Running rust lspconfig through rustaceanvim
      -- require("lspconfig").rust_analyzer.setup({ capabilites = capabilities })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then
            return
          end
        end,
      })
    end,
  },
}

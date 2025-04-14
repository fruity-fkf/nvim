return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "black" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          json = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          sh = { "shfmt" },
          go = { "goimports" },
          c = { "clang_format" },
          cpp = { "clang_format" },
          java = { "clang_format" },
          rust = { "rustfmt" },
          php = { "php-cs-fixer" },
          ruby = { "rubocop" },
          swift = { "swiftformat" },
          kotlin = { "ktlint" },
          dart = { "dart_format" },
          zig = { "zigfmt" },
          markdown = { "prettier" },
        },

        formatters = {
          stylua = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
          },
          clang_format = {
            prepend_args = { "--style=Google" },
          },
          black = {
            prepend_args = { "--line-length", "88" },
          },
          goimports = {
            prepend_args = { "-local", "your_module_path" },
          },
          shfmt = {
            prepend_args = { "-i", "2", "-ci" },
          },
          ["php-cs-fixer"] = {
            command = "php-cs-fixer",
            args = { "fix", "--quiet", "--using-cache=no", "$FILENAME" },
            stdin = false,
          },
          rubocop = {
            args = { "--auto-correct", "--stdin", "$FILENAME" },
            stdin = true,
          },
          swiftformat = {
            args = { "$FILENAME" },
            stdin = false,
          },
          ktlint = {
            args = { "--format", "$FILENAME" },
            stdin = false,
          },
          dart_format = {
            command = "dart",
            args = { "format", "--output=show", "--line-length", "80", "$FILENAME" },
            stdin = false,
          },
        },
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
      })
    end,
  },
}

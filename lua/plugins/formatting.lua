return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
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
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    })
  end,
}

return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
      go = { "golangcilint" },
      c = { "clangtidy" },
      cpp = { "clangtidy" },
      zig = { "zigfmt" }, -- pseudo-linter using format check
      rust = { "clippy" }, -- pseudo-linter using format check
    }

    require("lint").linters.clippy = {
      cmd = "cargo",
      stdin = false,
      args = { "clippy", "--message-format=json", "--quiet" },
      ignore_exitcode = true,
      parser = require("lint.parser").from_errorformat("%f:%l:%c: %t%n %m", {
        source = "clippy",
        severity = {
          E = vim.diagnostic.severity.ERROR,
          W = vim.diagnostic.severity.WARN,
          I = vim.diagnostic.severity.INFO,
          H = vim.diagnostic.severity.HINT,
        },
      }),
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}

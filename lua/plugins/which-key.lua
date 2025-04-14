return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      defaults = {},
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>t", group = "tabs" },
          { "<leader>c", group = "code" },
          -- { "<leader>d", group = "debug" },
          -- { "<leader>dp", group = "profiler" },
          { "<leader>f", group = "file/find" },
          { "<leader>g", group = "git" },
          -- { "<leader>gh", group = "hunks" },
          { "<leader>q", group = "quit/session" },
          { "<leader>s", group = "misc" },
          { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
          { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
          { "[", group = "prev" },
          { "]", group = "next" },
          { "g", group = "goto" },
          { "gs", group = "surround" },
          { "z", group = "fold" },
          { "<leader>b", group = "buffer" },
          { "<leader>w", group = "windows" },
          { "gx", desc = "Open with system app" },
        },
      },
    },
    keys = {
      {
        "<leader>wc",
        function()
          require("which-key").show("")
        end,
        desc = "Toggle Which-Key",
      },
    },
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
  },
}

-- return {
--   "folke/which-key.nvim",
--   event = "VeryLazy",
--   opts = {
--     preset = "helix",
--   },
--   config = function()
--     local wk = require("which-key")
--     wk.add({
--
--       { "<leader>c", group = "󰅩 [c]ode" },
--
--       { "<leader>t", group = "󰓩 [t]abs" },
--
--       { "<leader>T", group = " [T]erminal" },
--
--       { "<leader>g", group = " [g]it" },
--       { "<leader>b", group = "󰈔 [b]uffer" },
--       { "<leader>f", group = " [f]iles" },
--
--       { "<leader>u", group = " [u]niversal" },
--
--       { "<leader>w", group = "󰖲 [w]incmd/window navigation" },
--     })
--   end,
--   keys = {
--     {
--       "<leader>?",
--       function()
--         require("which-key").show({ global = false })
--       end,
--       desc = "Buffer Local Keymaps (which-key)",
--     },
--   },
-- }

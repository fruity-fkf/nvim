return {
  {
    "saghen/blink.compat",
    opts = {},
  },

  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "echasnovski/mini.snippets",
      "hrsh7th/cmp-emoji",
      "chrisgrieser/cmp-nerdfont",
      "mtoohey31/cmp-fish",
    },

    version = "*",
    opts = {
      keymap = {

        --  ________________________________________
        -- / ctrl j and k to scroll options. ctrl . \
        -- \ (dot) to accept :3 and ctrl h to hide  /
        --  ----------------------------------------
        --         \   ^__^
        --          \  (oo)\_______
        --             (__)\       )\/\
        --                 ||----w |
        --                 ||     ||
        -- And use Tab and shift tab for snippet field movement

        preset = "none",
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-h>"] = { "hide" },
        ["<C-.>"] = { "select_and_accept" },
        ["<C-p>"] = { "scroll_documentation_up", "fallback" },
        ["<C-m>"] = { "scroll_documentation_down", "fallback" },
        ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer", "emoji", "nerdfont", "fish" },
        providers = {
          emoji = {
            name = "emoji",
            module = "blink.compat.source",
            score_offset = -3,
            opts = {},
          },
          nerdfont = {
            name = "nerdfont",
            module = "blink.compat.source",
            score_offset = -3,
            opts = {},
          },
          fish = {
            name = "fish",
            module = "blink.compat.source",
            score_offset = -3,
            opts = {},
          },
        },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
      },
      signature = { enabled = true },
      -- Moved completion inside opts
      completion = {
        ghost_text = {
          enabled = true,
        },
        documentation = {
          auto_show_delay_ms = 0,
          auto_show = true,
          window = {
            border = "",
          },
        },
      },
    },
  },
}

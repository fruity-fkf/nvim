return {
	{
		"echasnovski/mini.nvim",
		version = false,

		config = function()
			require("mini.comment").setup()
			require("mini.basics").setup()
			require("mini.files").setup()
			require("mini.git").setup()
			require("mini.extra").setup()
			require("mini.pairs").setup()
			require("mini.surround").setup()
			-- require("mini.indentscope").setup()

			local miniclue = require("mini.clue")
			miniclue.setup({
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },

					-- Built-in completion
					{ mode = "i", keys = "<C-x>" },

					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					-- Registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },

					-- Window commands
					{ mode = "n", keys = "<C-w>" },

					-- `z` key
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),

					{ mode = "n", keys = "<Leader>b", desc = " Buffer" },
					{ mode = "n", keys = "<Leader>f", desc = " Find" },
					{ mode = "n", keys = "<Leader>g", desc = "󰊢 Git" },
					{ mode = "n", keys = "<Leader>i", desc = "󰏪 Insert" },
					{ mode = "n", keys = "<Leader>l", desc = "󰘦 LSP" },
					{ mode = "n", keys = "<Leader>q", desc = " NVim" },
					{ mode = "n", keys = "<Leader>s", desc = "󰆓 Session" },
					{ mode = "n", keys = "<Leader>u", desc = "󰔃 UI" },
					{ mode = "n", keys = "<Leader>w", desc = " Window" },

					{ mode = "n", keys = "<Leader>T", desc = " Terminal" },
					{ mode = "n", keys = "<Leader>t", desc = "󰝜 Tabs" },
				},
			})
		end,
	},
}

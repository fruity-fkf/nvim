return {
	"echasnovski/mini.starter",
	version = false, -- wait till new 0.7.0 release to put it back on semver
	event = "VimEnter",
	opts = function()
		local logo = table.concat({

			--     --   "                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}, "\n")
		local pad = string.rep(" ", 22)
		local new_section = function(name, action, section)
			return { name = name, action = action, section = pad .. section }
		end

		local starter = require("mini.starter")
    --stylua: ignore
    local config = {
      evaluate_single = true,
      header = logo,
      items = {
        new_section("Find file",       "Telescope find_files",                                   "Telescope"),
        new_section("Recent files",    "Telescope oldfiles",                                     "Telescope"),
        new_section("Grep text",       "Telescope live_grep",                                    "Telescope"),
        new_section("colorscheme",          "Telescope themes", "Telescope"),
        new_section("Lazy",            "Lazy",                                                   "Config"),
        new_section("New file",        "ene | startinsert",                                      "Built-in"),
        new_section("Quit",            "qa",                                                     "Built-in"),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "░ ", false),
        starter.gen_hook.aligning("center", "center"),
      },
    }
		return config
	end,
	config = function(_, config)
		-- close Lazy and re-open when starter is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniStarterOpened",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		local starter = require("mini.starter")
		starter.setup(config)

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function(ev)
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				local pad_footer = string.rep(" ", 8)
				starter.config.footer = pad_footer
					.. "⚡ Neovim loaded "
					.. stats.count
					.. " plugins in "
					.. ms
					.. "ms"
				-- INFO: based on @echasnovski's recommendation (thanks a lot!!!)
				if vim.bo[ev.buf].filetype == "starter" then
					pcall(starter.refresh)
				end
			end,
		})
	end,
}
--  return {
--   "goolord/alpha-nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   config = function()
--     local alpha = require("alpha")
--     local dashboard = require("alpha.themes.dashboard")
--
--     -- -- Set header
--     -- dashboard.section.header.val = {
--     --   "                                                     ",
--     --   "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
--     --   "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
--     --   "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
--     --   "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
--     --   "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
--     --   "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
--     --   "                                                     ",
--     -- }
--     --
--     -- -- Set menu
--     dashboard.section.buttons.val = {
--       dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
--       dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
--       dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
--       dashboard.button("s", "  > Settings", ":e ~/.config/nvim/<CR>"),
--       dashboard.button("q", "󰈆  > Quit NVIM", ":qa<CR>"),
--     }
--
--     local logo = {
--       [[ ███       ███ ]],
--       [[████      ████]],
--       [[██████     █████]],
--       [[███████    █████]],
--       [[████████   █████]],
--       [[█████████  █████]],
--       [[█████ ████ █████]],Colorscheme
--       [[█████  █████████]],
--       [[█████   ████████]],
--       [[█████    ███████]],
--       [[█████     ██████]],
--       [[████      ████]],
--       [[ ███       ███ ]],
--       [[                  ]],
--       [[ N  E  O  V  I  M ]],
--     }
--     dashboard.section.header.val = logo
--     -- no Idea how it works exaclty, try n error with distinguishable colors lol
--     dashboard.section.header.opts.hl = {
--       {
--         { "AlphaNeovimLogoBlue",  0,  0 },
--         { "AlphaNeovimLogoGreen", 1,  14 },
--         { "AlphaNeovimLogoBlue",  23, 34 },
--       },
--       {
--         { "AlphaNeovimLogoBlue",        0,  2 },
--         { "AlphaNeovimLogoGreenFBlueB", 2,  4 },
--         { "AlphaNeovimLogoGreen",       4,  19 },
--         { "AlphaNeovimLogoBlue",        27, 40 },
--       },
--       {
--         { "AlphaNeovimLogoBlue",        0,  4 },
--         { "AlphaNeovimLogoGreenFBlueB", 4,  7 },
--         { "AlphaNeovimLogoGreen",       7,  22 },
--         { "AlphaNeovimLogoBlue",        29, 42 },
--       },
--       {
--         { "AlphaNeovimLogoBlue",        0,  8 },
--         { "AlphaNeovimLogoGreenFBlueB", 8,  10 },
--         { "AlphaNeovimLogoGreen",       10, 25 },
--         { "AlphaNeovimLogoBlue",        31, 44 },
--       },
--       {
--         { "AlphaNeovimLogoBlue",        0,  10 },
--         { "AlphaNeovimLogoGreenFBlueB", 10, 13 },
--         { "AlphaNeovimLogoGreen",       13, 28 },
--         { "AlphaNeovimLogoBlue",        33, 46 },
--       },
--       {
--         { "AlphaNeovimLogoBlue",  0,  13 },
--         { "AlphaNeovimLogoGreen", 14, 31 },
--         { "AlphaNeovimLogoBlue",  35, 49 },
--       },
--       {
--         { "AlphaNeovimLogoBlue",  0,  13 },
--         { "AlphaNeovimLogoGreen", 16, 32 },
--         { "AlphaNeovimLogoBlue",  35, 49 },
--       },
--       {
--         { "AlphaNeovimLogoBlue",  0,  13 },
--         { "AlphaNeovimLogoGreen", 17, 33 },
--         { "AlphaNeovimLogoBlue",  35, 49 },
--       },
--       {
--         { "AlphaNeovimLogoBlue",        0,  13 },
--         { "AlphaNeovimLogoGreen",       18, 34 },
--         { "AlphaNeovimLogoGreenFBlueB", 33, 35 },
--         { "AlphaNeovimLogoBlue",        35, 49 },
--       },
--       {
--         { "AlphaNeovimLogoBlue",        0,  13 },
--         { "AlphaNeovimLogoGreen",       19, 35 },
--         { "AlphaNeovimLogoGreenFBlueB", 34, 35 },
--         { "AlphaNeovimLogoBlue",        35, 49 },
--       },
--       {
--         { "AlphaNeovimLogoBlue",        0,  13 },
--         { "AlphaNeovimLogoGreen",       20, 36 },
--         { "AlphaNeovimLogoGreenFBlueB", 35, 37 },
--         { "AlphaNeovimLogoBlue",        37, 49 },
--       },
--       {
--         { "AlphaNeovimLogoBlue",        0,  13 },
--         { "AlphaNeovimLogoGreen",       21, 37 },
--         { "AlphaNeovimLogoGreenFBlueB", 36, 37 },
--         { "AlphaNeovimLogoBlue",        37, 49 },
--       },
--       {
--         { "AlphaNeovimLogoBlue",  1,  13 },
--         { "AlphaNeovimLogoGreen", 20, 35 },
--         { "AlphaNeovimLogoBlue",  37, 48 },
--       },
--       {},
--       { { "AlphaNeovimLogoGreen", 0, 9 }, { "AlphaNeovimLogoBlue", 9, 18 } },
--     }
--
--     -- -- Set footer
--     --   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--     --   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--     --   ```init.lua
--     --   return require('packer').startup(function()
--     --       use 'wbthomason/packer.nvim'
--     --       use {
--     --           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--     --           requires = {'BlakeJC94/alpha-nvim-fortune'},
--     --           config = function() require("config.alpha") end
--     --       }
--     --   end)
--     --   ```
--     -- local fortune = require("alpha.fortune")
--     -- dashboard.section.footer.val = fortune()
--
--     -- Send config to alpha
--     alpha.setup(dashboard.opts)
--
--     -- Disable folding on alpha buffer
--     vim.cmd([[
--     autocmd FileType alpha setlocal nofoldenable
-- ]])
--   end,
-- }

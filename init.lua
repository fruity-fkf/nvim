require("config.lazy")
require("config.opts")
require("config.keys")

--COLORSCHEME

vim.cmd("colorscheme catppuccin")
vim.diagnostic.config({ virtual_text = true })

return { 
    "nvim-treesitter/nvim-treesitter", build = "TSUpdate" ,
    config = function()

        local config = require("nvim-treesitter.configs")
        config.setup({

        ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html" },
        highlight = { enable = true },
        indent = { enable = true },
    
                    })

end





}
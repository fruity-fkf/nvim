vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ft", ":Neotree toggle<CR>", {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>ff", ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>fg", ":Telescope find_files<CR>", {})

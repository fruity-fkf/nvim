vim.g.mapleader = " "
--vim.api.nvim_set_keymap("n", "<leader>", "", {})
vim.api.nvim_set_keymap("n", "<leader>rn", ":RnvimrToggle<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>mm", ":MinimapToggle<CR>", {})

vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})

vim.api.nvim_set_keymap("n", "<leader>Tf", ":ToggleTerm direction =float<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>Tv", ":ToggleTerm direction =vertical<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>Th", ":ToggleTerm direction =horizontal<CR>", {})

vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ft", ":Neotree toggle<CR>", {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>ff", ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>fg", ":Telescope find_files<CR>", {})

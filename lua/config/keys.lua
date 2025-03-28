--  ____________________________________
-- / Warning! a lot of the keybinds are \
-- \ defined in the snacks.lua file     /
--  ------------------------------------
--         \   ^__^
--          \  (oo)\_______
--             (__)\       )\/\
--                 ||----w |
--                 ||     ||
--

-- ╔══════════════════════════════╗
-- ║    main initialization       ║
-- ╚══════════════════════════════╝
local keymap = vim.keymap.set
vim.g.mapleader = " "


local split_sensibly = function()
  if vim.api.nvim_win_get_width(0) > math.floor(vim.api.nvim_win_get_height(0) * 2.3) then
    vim.cmd("vs")
  else
    vim.cmd("split")
  end
end

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("i", "jj", "<Esc>", { noremap = false })


-- ╔══════════════════════════════╗
-- ║    Buffer and Tab Keymaps    ║
-- ╚══════════════════════════════╝
keymap("n", "<leader>bd", "<cmd>bd<cr>", { noremap = true, silent = true, desc = "Close Buffer" })
keymap("n", "<leader>bq", "<cmd>%bd|e#<cr>", { noremap = true, silent = true, desc = "Close other Buffers" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { silent = true, desc = "Next Buffer" })
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { silent = true, desc = "Previous Buffer" })
keymap("n", "<TAB>", "<C-^>", { noremap = true, silent = true, desc = "Alternate buffers" })

vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New Tab" })           -- Open new tab
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close Tab" })       -- Close current tab
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close Other Tabs" }) -- Close all other tabs
vim.keymap.set("n", "<leader>tl", ":tabnext<CR>", { desc = "Next Tab" })         -- Go to next tab
vim.keymap.set("n", "<leader>th", ":tabprevious<CR>", { desc = "Previous Tab" }) -- Go to previous tab

-- ╔══════════════════╗
-- ║    UI Keymaps    ║
-- ╚══════════════════╝
-- Window Navigation

keymap("n", "<leader>wl", "<cmd>wincmd l<cr>", { noremap = true, silent = true, desc = "Focus Left" })
keymap("n", "<leader>wk", "<cmd>wincmd k<cr>", { noremap = true, silent = true, desc = "Focus Up" })
keymap("n", "<leader>wj", "<cmd>wincmd j<cr>", { noremap = true, silent = true, desc = "Focus Down" })
keymap("n", "<leader>wh", "<cmd>wincmd h<cr>", { noremap = true, silent = true, desc = "Focus Right" })
-- Alternate Window Navigation
-- keymap('n', '<S-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- keymap('n', '<S-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- keymap('n', '<S-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- keymap('n', '<S-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

keymap("n", "<leader>wq", "<cmd>wincmd q<cr>", { noremap = true, silent = true, desc = "Close Window" })

-- ╔═══════════════════╗
-- ║    LSP Keymaps    ║
-- ╚═══════════════════╝

keymap("n", "<leader>cd", function()
  vim.lsp.buf.definition()
end, { noremap = true, silent = true, desc = "Go To Definition" })
keymap(
  "n",
  "<leader>cs",
  "<cmd>Pick lsp scope='document_symbol'<cr>",
  { noremap = true, silent = true, desc = "Show all Symbols" }
)
keymap("n", "<leader>cr", function()
  vim.lsp.buf.rename()
end, { noremap = true, silent = true, desc = "Rename This" })
keymap("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { noremap = true, silent = true, desc = "Code Actions" })

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- keymap("n", "<leader>la", function() vim.lsp.buf.code_action() end,{ noremap = true, silent = true, desc = '' })

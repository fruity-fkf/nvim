vim.g.mapleader = " "
local split_sensibly = function()
	if vim.api.nvim_win_get_width(0) > math.floor(vim.api.nvim_win_get_height(0) * 2.3) then
		vim.cmd("vs")
	else
		vim.cmd("split")
	end
end

-- terminal

vim.keymap.set("n", "<leader>Tf", ":ToggleTerm direction =float<CR>", { desc = "Terminal(Float)" })
vim.keymap.set("n", "<leader>Tv", ":ToggleTerm direction =vertical<CR>", { desc = "Terminal(Vertical)" })
vim.keymap.set("n", "<leader>Th", ":ToggleTerm direction =horizontal<CR>", { desc = "Terminal(Horizontal)" })

-- move current tab to previous position
vim.keymap.set("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.keymap.set("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

vim.keymap.set("n", "<leader>ft", ":Neotree toggle<CR>", { desc = "File Tree" })

vim.keymap.set("n", "<leader>fm", ":lua MiniFiles.open()<CR>", { desc = "Mini.nvim file manager" })

local keymap = vim.keymap.set

-- ╔══════════════════════════════╗
-- ║    Buffer and Tab Keymaps    ║
-- ╚══════════════════════════════╝
keymap("n", "<leader>bd", "<cmd>bd<cr>", { noremap = true, silent = true, desc = "Close Buffer" })
keymap("n", "<leader>bq", "<cmd>%bd|e#<cr>", { noremap = true, silent = true, desc = "Close other Buffers" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { silent = true, desc = "Next Buffer" })
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { silent = true, desc = "Previous Buffer" })
keymap("n", "<TAB>", "<C-^>", { noremap = true, silent = true, desc = "Alternate buffers" })


keymap("n", "<leader>tn", function()
	vim.lsp.buf.code_action()
end, { noremap = true, silent = true, desc = "New Tab" })

keymap("n", "<leader>tc", function()
	vim.lsp.buf.code_action()
end, { noremap = true, silent = true, desc = "Close Tab" })

-- ╔═══════════════════╗
-- ║    LSP Keymaps    ║
-- ╚═══════════════════╝

keymap("n", "<leader>ld", function()
	vim.lsp.buf.definition()
end, { noremap = true, silent = true, desc = "Go To Definition" })
keymap(
	"n",
	"<leader>ls",
	"<cmd>Pick lsp scope='document_symbol'<cr>",
	{ noremap = true, silent = true, desc = "Show all Symbols" }
)
keymap("n", "<leader>lr", function()
	vim.lsp.buf.rename()
end, { noremap = true, silent = true, desc = "Rename This" })
keymap("n", "<leader>la", function()
	vim.lsp.buf.code_action()
end, { noremap = true, silent = true, desc = "Code Actions" })

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- keymap("n", "<leader>la", function() vim.lsp.buf.code_action() end,{ noremap = true, silent = true, desc = '' })

-- TABS

vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { noremap = true, desc = "Tab Close" })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { noremap = true, desc = "Tab Only" })
vim.keymap.set("n", "<leader>tN", ":tabnew<CR>", { noremap = true, desc = "Tab New" })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { noremap = true, desc = "Tab Previous" })

vim.keymap.set("n", "<leader>tn", ":tabNext<CR>", { noremap = true, desc = "Tab Next" })

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
keymap("n", "<leader>n", "<cmd>noh<cr>", { noremap = true, silent = true, desc = "Clear Search Highlight" })

-- Split "Sensibly"
-- Should automatically split or vsplit based on Ratios
keymap("n", "<leader>bs", split_sensibly, { noremap = true, silent = true, desc = "Alternate buffers" })

keymap("n", "<leader>wq", "<cmd>wincmd q<cr>", { noremap = true, silent = true, desc = "Close Window" })
keymap("n", "<leader>n", "<cmd>noh<cr>", { noremap = true, silent = true, desc = "Clear Search Highlight" })

-- Split "Sensibly"
-- Should automatically split or vsplit based on Ratios
keymap("n", "<leader>bs", split_sensibly, { noremap = true, silent = true, desc = "Alternate buffers" })

-- Change Colorscheme
keymap("n", "<leader>ud", "<cmd>set background=dark<cr>", { noremap = true, silent = true, desc = "Dark Background" })
keymap("n", "<leader>ub", "<cmd>set background=light<cr>", { noremap = true, silent = true, desc = "Light Background" })
vim.keymap.set("n", "<leader>wth", ":Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

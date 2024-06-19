vim.g.mapleader = " "
local split_sensibly = function()
  if vim.api.nvim_win_get_width(0) > math.floor(vim.api.nvim_win_get_height(0) * 2.3) then
    vim.cmd("vs")
  else
    vim.cmd("split")
  end
end

-- require('mini.pick') Colorscheme Picker
local set_colorscheme = function(name) pcall(vim.cmd, 'colorscheme ' .. name) end
local pick_colorscheme = function()
  local init_scheme = vim.g.colors_name
  local new_scheme = require('mini.pick').start({
    source = {
      items = vim.fn.getcompletion("", "color"),
      preview = function(_, item)
        set_colorscheme(item)
      end,
      choose = set_colorscheme
    },
    mappings = {
      preview = {
        char = '<C-p>',
        func = function()
          local item = require('mini.pick').get_picker_matches()
          pcall(vim.cmd, 'colorscheme ' .. item.current)
        end
      }
    }
  })
  if new_scheme == nil then set_colorscheme(init_scheme) end
end








--vim.keymap.set("n", "<leader>", "", {})
vim.keymap.set("n", "<leader>rn", ":RnvimrToggle<CR>", {})
vim.keymap.set("n", "<leader>mm", ":MinimapToggle<CR>", {})
vim.keymap.set("n", "<leader>th", ":Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })

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

-- terminal

vim.keymap.set("n", "<leader>Tf", ":ToggleTerm direction =float<CR>", {})
vim.keymap.set("n", "<leader>Tv", ":ToggleTerm direction =vertical<CR>", {})
vim.keymap.set("n", "<leader>Th", ":ToggleTerm direction =horizontal<CR>", {})

vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.keymap.set("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.keymap.set("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

vim.keymap.set("n", "<leader>fo", ":lua MiniFiles.open()<CR>", {})

vim.keymap.set("n", "<leader>fc", ":lua MiniFiles.close()<CR>", {})


local keymap = vim.keymap.set



-- ╔══════════════════════╗
-- ║    Buffer and Tab Keymaps    ║
-- ╚══════════════════════╝
keymap("n", "<leader>bd", "<cmd>bd<cr>", { noremap = true, silent = true, desc = 'Close Buffer' })
keymap("n", "<leader>bq", "<cmd>%bd|e#<cr>", { noremap = true, silent = true, desc = 'Close other Buffers' })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { silent = true, desc = 'Next Buffer' })
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { silent = true, desc = 'Previous Buffer' })
keymap("n", "<TAB>", "<C-^>", { noremap = true, silent = true, desc = "Alternate buffers" })
-- Format Buffer
-- With and without LSP
if vim.tbl_isempty(vim.lsp.buf_get_clients()) then
  keymap("n", "<leader>bf", function() vim.lsp.buf.format() end,
    { noremap = true, silent = true, desc = 'Format Buffer' })
else
  keymap("n", "<leader>bf", "gg=G<C-o>", { noremap = true, silent = true, desc = 'Format Buffer' })
end

keymap("n", "<leader>tn", function() vim.lsp.buf.code_action() end, { noremap = true, silent = true, desc = 'New Tab' })





-- ╔═══════════════════╗
-- ║    LSP Keymaps    ║
-- ╚═══════════════════╝

keymap("n", "<leader>ld", function() vim.lsp.buf.definition() end,
  { noremap = true, silent = true, desc = 'Go To Definition' })
keymap("n", "<leader>ls", "<cmd>Pick lsp scope='document_symbol'<cr>",
  { noremap = true, silent = true, desc = 'Show all Symbols' })
keymap("n", "<leader>lr", function() vim.lsp.buf.rename() end, { noremap = true, silent = true, desc = 'Rename This' })
keymap("n", "<leader>la", function() vim.lsp.buf.code_action() end,
  { noremap = true, silent = true, desc = 'Code Actions' })

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- keymap("n", "<leader>la", function() vim.lsp.buf.code_action() end,{ noremap = true, silent = true, desc = '' })





-- ╔══════════════════╗
-- ║    UI Keymaps    ║
-- ╚══════════════════╝
-- Window Navigation
keymap("n", "<leader>wl", "<cmd>wincmd l<cr>", { noremap = true, silent = true, desc = 'Focus Left' })
keymap("n", "<leader>wk", "<cmd>wincmd k<cr>", { noremap = true, silent = true, desc = 'Focus Up' })
keymap("n", "<leader>wj", "<cmd>wincmd j<cr>", { noremap = true, silent = true, desc = 'Focus Down' })
keymap("n", "<leader>wh", "<cmd>wincmd h<cr>", { noremap = true, silent = true, desc = 'Focus Right' })
-- Alternate Window Navigation
-- keymap('n', '<S-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- keymap('n', '<S-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- keymap('n', '<S-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- keymap('n', '<S-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

keymap("n", "<leader>wq", "<cmd>wincmd q<cr>", { noremap = true, silent = true, desc = 'Close Window' })
keymap("n", "<leader>n", "<cmd>noh<cr>", { noremap = true, silent = true, desc = 'Clear Search Highlight' })

-- Split "Sensibly"
-- Should automatically split or vsplit based on Ratios
keymap("n", "<leader>bs", split_sensibly, { noremap = true, silent = true, desc = "Alternate buffers" })









keymap("n", "<leader>wq", "<cmd>wincmd q<cr>", { noremap = true, silent = true, desc = 'Close Window' })
keymap("n", "<leader>n", "<cmd>noh<cr>", { noremap = true, silent = true, desc = 'Clear Search Highlight' })

-- Split "Sensibly"
-- Should automatically split or vsplit based on Ratios
keymap("n", "<leader>bs", split_sensibly, { noremap = true, silent = true, desc = "Alternate buffers" })

-- Change Colorscheme
keymap("n", "<leader>ud", "<cmd>set background=dark<cr>", { noremap = true, silent = true, desc = 'Dark Background' })
keymap("n", "<leader>ub", "<cmd>set background=light<cr>", { noremap = true, silent = true, desc = 'Light Background' })
keymap("n", "<leader>um", "<cmd>lua MiniMap.open()<cr>", { noremap = true, silent = true, desc = 'Mini Map' })













vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

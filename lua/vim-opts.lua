vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
vim.opt.conceallevel = 1
vim.opt.termguicolors = true
vim.cmd("set mouse=a")
vim.cmd("set undodir=~/.local/tmp")
vim.cmd("set undofile")
vim.cmd("set guifont=JetBrainsMono_Nerd_Font_Mono:h9")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.fillchars = { eob = " " }

vim.opt.clipboard = "unnamedplus"
vim.wo.relativenumber = true
vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.wo.number = true

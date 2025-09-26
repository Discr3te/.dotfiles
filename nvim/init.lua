-- keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>e", "<Cmd>Oil<CR>")
vim.keymap.set("n", "<leader>w", "<Cmd>write<CR>")
vim.keymap.set("n", "<leader>q", ":bdelete<CR>")
vim.keymap.set("n", "<leader>qq", "<Cmd>:wqa<CR>")
vim.keymap.set("n", "<leader>m", "<Cmd>Mason<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.updatetime = 50
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.termguicolors = true

require("config.lazy")

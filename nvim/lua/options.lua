-- Visuals
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Behavior settings
vim.opt.errorbells = false
vim.opt.clipboard:append("unnamedplus")

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Search settings
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- File handling
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 250
vim.opt.autoread = true

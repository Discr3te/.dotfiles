-- =============================================================================
-- TITLE : NeoVim keymaps
-- ABOUT : sets keymaps
-- =============================================================================

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- QoL keymaps
vim.keymap.set("n", "<leader>e", "<Cmd>Oil<CR>")
vim.keymap.set("n", "<leader>w", "<Cmd>write<CR>")
vim.keymap.set("n", "<leader>x", ":close<CR>")
vim.keymap.set("n", "<leader>q", "<Cmd>:wqa<CR>")

-- Move lines up / down
vim.keymap.set("n", "J", ":m .+1<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "K", ":m .-2<CR>==", { desc = "Move line down" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Center screen when jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split widnow vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Drecrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better window naigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better Yank behavior
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Better J behavior
vim.keymap.set("n", "M", "mzJ`z", { desc = "Join lines and keep cursor position" })

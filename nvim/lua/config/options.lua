-- =============================================================================
-- TITLE : NeoVim options
-- ABOUT : basic settings native to neovim
-- =============================================================================

-- Basic settings
vim.opt.number = true -- line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true -- Highlight currentl line
vim.opt.wrap = false -- Don't wrap lines
vim.opt.scrolloff = 10 -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep lines 8 columns left/right of cursor
vim.opt.cmdheight = 1 -- Command line height

-- Tabbing / Indentation
vim.opt.tabstop = 2 -- Tab width
vim.opt.softtabstop = 2 -- Soft tab stop
vim.opt.shiftwidth = 2 -- Indent width
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true -- Copy indent from current line

-- Search settings
vim.opt.incsearch = true -- Show matches as you type
vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.ignorecase = true -- Case-insensitive search
vim.opt.smartcase = true -- Case-sensitive if uppercase in search

-- Visuals
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.colorcolumn = "80" -- Show column at 80 characters
vim.opt.showmatch = true -- Highlight matching brakets
vim.opt.matchtime = 3 -- Show matching brackets duration
vim.opt.showmode = true -- Show mode in cmd line
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.opt.pumheight = 10 -- Popup menu height
vim.opt.pumblend = 10 -- Popup menu transparency
vim.opt.winblend = 0 -- Floating window transparency
vim.opt.conceallevel = 0 -- Don't hide markup
vim.opt.concealcursor = "" -- Show markup even on cursor line
vim.opt.lazyredraw = false -- Redraw while executing macros
vim.opt.redrawtime = 10000 -- Timeout for syntax highlighting redraw
vim.opt.maxmempattern = 200000 -- Max memory for pattern matching
vim.opt.synmaxcol = 3000 -- Syntax highlighting column limit

-- File handling
vim.opt.backup = false -- Don't create backup files
vim.opt.swapfile = false -- Don't create swap files
vim.opt.writebackup = false -- Don't backup before overwriting
vim.opt.timeout = true
vim.opt.timeoutlen = 200 -- Time in ms to wait for mapped sequence
vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 200 -- Time in ms to trigeger CursorHold
vim.opt.autoread = true -- Auto-reload file if changed outside

-- Undo direcotry
vim.opt.undofile = true -- Persistent undo
local undodir = "~/.local/share/nvim/undodir"
vim.opt.undodir = vim.fn.expand(undodir)

-- Behavior settings
vim.opt.errorbells = false -- Disable error sounds
vim.opt.backspace = "indent,eol,start" -- Make backspace behave naturally
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.opt.iskeyword:append("-") -- Treat dashas part of a word
vim.opt.modifiable = true -- Allow editing buffers
vim.opt.encoding = "UTF-8" -- Use UTF-8 encoding

-- Split behavior
vim.opt.splitbelow = true -- Horizontal splits open below
vim.opt.splitright = true -- Vertical splits open to the right

-- Diagnostic
vim.diagnostic.config({
	underline = true,
	virtual_text = {
		spacing = 4,
		prefix = "●",
	},
	update_in_insert = false,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})

-- Disable Persistent Comments after line insertion
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

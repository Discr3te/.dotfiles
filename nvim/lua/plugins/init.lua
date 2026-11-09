-- Rebuild treesitter parsers whenever nvim-treesitter updates
-- (vim.pack has no `build` field; it uses PackChanged events instead)
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

-- Every plugin in ONE vim.pack.add call: missing plugins are cloned in
-- parallel behind a single install prompt, instead of one by one.
local gh = function(repo)
	return "https://github.com/" .. repo
end
vim.pack.add({
	{ src = gh("folke/tokyonight.nvim"), version = "main", name = "tokyo-night" },
	{ src = gh("nvim-tree/nvim-web-devicons"), version = "master", name = "web-devicons" },
	{ src = gh("stevearc/conform.nvim"), version = "master", name = "conform" },
	{ src = gh("neovim/nvim-lspconfig"), version = vim.version.range("2.*"), name = "lspconfig" },
	{ src = gh("mason-org/mason.nvim"), version = vim.version.range("2.*"), name = "mason" },
	{ src = gh("mfussenegger/nvim-lint"), version = "master", name = "nvim-lint" },
	{ src = gh("nvim-treesitter/nvim-treesitter"), version = "main", name = "nvim-treesitter" },
	{ src = gh("nvim-treesitter/nvim-treesitter-context"), version = "master", name = "treesitter-context" },
	{ src = gh("windwp/nvim-ts-autotag"), version = "main", name = "ts-autotag" },
	{ src = gh("lewis6991/gitsigns.nvim"), version = vim.version.range("2.*"), name = "gitsigns" },
	{ src = gh("saghen/blink.cmp"), version = vim.version.range("1.*"), name = "blink" },
	{ src = gh("stevearc/oil.nvim"), version = "master", name = "oil" },
	{ src = gh("j-hui/fidget.nvim"), version = "main", name = "fidget" },
	{ src = gh("MeanderingProgrammer/render-markdown.nvim"), version = "main", name = "render-markdown" },
})

-- Colorscheme
require("plugins.tokyonight")
-- Dependencies
require("plugins.web-devicons") -- Dependency for: render-markdown, oil
-- Tools
require("plugins.tools.conform")
require("plugins.tools.lsp")
require("plugins.tools.mason")
require("plugins.tools.nvim-lint")
-- Treesitter
require("plugins.treesitter.treesitter")
require("plugins.treesitter.treesitter-context")
require("plugins.treesitter.ts-autotag")
-- Native Neovim Plugins
require("plugins.native.undotree")
-- Misc.
require("plugins.gitsigns")
require("plugins.blink")
require("plugins.oil")
require("plugins.fidget")
require("plugins.statusline")
require("plugins.render-markdown")

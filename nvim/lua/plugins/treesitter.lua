return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	branch = "master",
	build = ":TSUpdate",
	config = function()
		require("nvim-ts-autotag").setup()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua" },
			auto_install = true,
		})
	end,
}

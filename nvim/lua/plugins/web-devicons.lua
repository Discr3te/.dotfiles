vim.pack.add({
	{
		src = "https://github.com/nvim-tree/nvim-web-devicons",
		version = "master",
		name = "web-devicons",
	},
})

local web_devicons = require("nvim-web-devicons")
web_devicons.setup({})

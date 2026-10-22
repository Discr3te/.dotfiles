vim.pack.add({
	{
		src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
		version = "main",
		name = "render-markdown",
	},
})

local render_markdown = require("render-markdown")
render_markdown.setup({})

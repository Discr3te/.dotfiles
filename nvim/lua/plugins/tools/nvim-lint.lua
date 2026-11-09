local lint = require("lint")
lint.linters_by_ft = {
	lua = { "luacheck" },
	python = { "ruff" },
	json = { "jsonlint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})

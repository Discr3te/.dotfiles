local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		zsh = { "shfmt" },
		sh = { "shfmt" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		go = { "gofmt" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		json = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },
		python = { "ruff" },
		sql = { "sql_formatter" },
	},

	format_on_save = {
		lsp_format = "never",
		timeout_ms = 500,
	},

	notify_on_error = true,
	notify_no_formatters = true,
})

vim.api.nvim_create_user_command("AE", function()
	vim.api.nvim_open_term(0, {})
end, { desc = "Load ANSI colors" })

vim.api.nvim_create_user_command("CIA", function()
	vim.cmd("ConformInfo")

	-- Small delay so the buffer is ready
	vim.defer_fn(function()
		local buf = vim.api.nvim_get_current_buf()
		vim.bo[buf].modifiable = true
		vim.api.nvim_open_term(buf, {})
	end, 5)
end, { desc = "ConformInfo with ANSI colors" })

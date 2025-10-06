return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			json = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			markdown = { "prettierd" },
			yaml = { "prettierd" },
			sql = { "sql_formatter" },
		},

		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 250,
		},

		notify_on_error = true,
		notify_no_formatters = true,
	},
}

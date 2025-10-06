return {
	"neovim/nvim-lspconfig",
	vim.lsp.enable({
		"lua_ls",
		"ts_ls",
		"html",
		"cssls",
		"tailwindcss",
		"jsonls",
		"postgres_lsp",
		"marksman",
		"docker_language_server",
	}),

	-- configs
	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	}),
}

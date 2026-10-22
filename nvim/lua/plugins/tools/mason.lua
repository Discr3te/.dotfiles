vim.pack.add({
	{
		src = "https://github.com/mason-org/mason.nvim",
		version = vim.version.range("2.*"),
		name = "mason",
	},
})

local mason = require("mason")
mason.setup({
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
})

local merge_tables = function(...)
	local merged, seen = {}, {}
	for _, tbl in ipairs({ ... }) do
		for _, value in ipairs(tbl) do
			if not seen[value] then
				seen[value] = true
				table.insert(merged, value)
			end
		end
	end
	return merged
end

local mason_ensure_installed = function()
	local registry = require("mason-registry")
	local lsp = {
		"lua-language-server", -- lua
		"marksman", -- Markdown
		"bash-language-server", -- bash
		"clangd", -- c
		"pyright", -- python
		"typescript-language-server", -- JS/TS
		"html-lsp", -- html
		"css-lsp", -- css
		"json-lsp", -- json
		"sqlls", -- sql
	}
	local dap = {}
	local linters = {
		"luacheck", -- lua
		"shellcheck", -- bash
		"stylelint", -- css
		"jsonlint", -- json
		"sqlfluff", -- sql
		"ruff", -- python
	}
	local formatters = {
		"stylua", -- lua
		"shfmt", -- bash
		"clang-format", -- c
		"prettierd", -- html, css, JS/TS, json
		"sql-formatter", -- sql
		"ruff", -- python
	}

	local ensure_installed = merge_tables(lsp, dap, linters, formatters)

	registry.refresh(function()
		for _, tool in ipairs(ensure_installed) do
			local ok, pkg = pcall(registry.get_package, tool)
			if ok and not pkg:is_installed() and not pkg:is_installing() then
				pkg:install()
			end
		end
	end)
end

mason_ensure_installed()

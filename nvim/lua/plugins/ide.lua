return {
    -- LSP
    {
        "neovim/nvim-lspconfig",
        --vim.diagnostic.config({ virtual_lines = true }),
        --enable
        vim.lsp.enable({
            "lua_ls",
            -- "bashls",
        }),
        vim.lsp.enable("bashls"),

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
    },

    -- Formatter
    {
        "stevearc/conform.nvim",
        enabled = true,
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                sh = { "shfmt" },
            },

            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 250,
            },

            notify_on_error = true,
            notify_no_formatters = true,
        },
    },

    -- Linter
    {
        'mfussenegger/nvim-lint',

        config = function()
            require('lint').linters_by_ft = {
                sh = { 'shellcheck' },
            }

            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    }
}

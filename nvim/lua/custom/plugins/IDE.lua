return {
    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            'j-hui/fidget.nvim',
        },

        config = function()
            require('fidget').setup({})
            vim.notify = require('fidget').notify

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "bashls",
                    "clangd",
                },
                automatic_installation = true,
            })

            require("mason-lspconfig").setup_handlers({
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                            },
                        },
                    })
                end,

                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            })
        end
    },

    -- Formatter
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    bash = { "shfmt" },
                    cpp = { "clang-format" }
                },
                format_on_save = {
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500
                }
            })

            vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
                conform.format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                })
            end, { desc = "Format file or range (in visual mode)" })
        end,
    },

    -- Linters
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("lint").linters_by_ft = {
                bash = { "shellcheck" },
            }
        end
    },

    -- DAP
    {
        "mfussenegger/nvim-dap",
        event = { "BufReadPre", "BufNewFile" },
        enabled = false,
        config = function()
            require("dap").setup({})
        end
    },
}

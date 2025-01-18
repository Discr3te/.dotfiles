return {
    -- Mason
    {
        'williamboman/mason.nvim',

        config = function()
            require('mason').setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })

            vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>")
        end

    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies ={
            'j-hui/fidget.nvim'
        },

        config = function()
            require('fidget').setup({})
            vim.notify = require('fidget').notify

            local lspconfig = require('lspconfig')

            -- C/C++
            lspconfig.clangd.setup({})

            -- Bash
            lspconfig.bashls.setup({})

            -- Lua
            lspconfig.lua_ls.setup({
                settings = {
                    Lua =  {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })
        end
    },

    -- Formatter
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile"},
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

            vim.keymap.set({'n', 'v'}, '<leader>mp', function()
                conform.format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                })
            end, { desc = "Format file or range (in visual mode)"})
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
        enabled = false,
        config = function()
            require("dap").setup({})
        end
    },
}
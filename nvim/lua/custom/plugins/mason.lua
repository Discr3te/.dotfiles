return{
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

        -- Add the package installation check and install logic here
        local registry = require "mason-registry"

        local packages = {
            "lua-language-server",
            "stylua",
            "bash-language-server",
            "shfmt",
            "shellcheck",
            "clangd",
            "clang-format"
        }

        registry.refresh(function ()
            for _, pkg_name in ipairs(packages) do
                local pkg = registry.get_package(pkg_name)
                if not pkg:is_installed() then
                    pkg:install()
                end
            end
        end)

        vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>")
    end
}
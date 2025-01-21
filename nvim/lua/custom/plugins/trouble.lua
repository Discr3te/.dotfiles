return {
    "folke/trouble.nvim",
    enabled = false,
    config = function()
        require("trouble").setup({})

        vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<CR>")
    end
}
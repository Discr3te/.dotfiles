return {
	"stevearc/oil.nvim",

	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			cleanup_delay_ms = 5000,
			watch_for_changes = true,
			use_default_keymaps = false,

			keymaps = {
				["?"] = { "actions.show_help", mode = "n" },
				["<CR>"] = "actions.select",
				["p"] = "actions.preview",
				["q"] = { "actions.close", mode = "n" },
				["r"] = "actions.refresh",
				["b"] = { "actions.parent", mode = "n" },
				["."] = { "actions.toggle_hidden", mode = "n" },
			},

			view_options = {
				show_hidden = true,
			},
		})
	end,
}

return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true,
		skip_confirm_for_simple_edits = true,
		promp_save_on_select_new_entry = true,
		watch_for_changes = true,
		keymaps = {
			["?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
			["<C-p>"] = "actions.preview",
			["q"] = { "actions.close", mode = "n" },
			["b"] = { "actions.parent", mode = "n" },
			["."] = { "actions.toggle_hidden", mode = "n" },
		},
		use_default_keymaps = false,
	},
}

local fidget = require("fidget")
fidget.setup({
	notification = {
		view = {
			stack_upwards = false,
		},

		window = {
			align = "bottom",
		},
	},
})
vim.notify = fidget.notify

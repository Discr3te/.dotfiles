-- Git branch function
local function git_branch()
	local status_dict = vim.b.gitsigns_status_dict
	local branch = vim.b.gitsigns_head or (status_dict and status_dict.head)
	if not branch then
		-- Fallback runs a shell, so do it once per buffer, not on every redraw
		if vim.b.statusline_git_branch == nil then
			vim.b.statusline_git_branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
		end
		branch = vim.b.statusline_git_branch
	end

	if branch and branch ~= "" then
		return " " .. branch
	end
	return ""
end

-- File type with icon
local function file_type()
	local ft = vim.bo.filetype
	local icons = {
		lua = "\u{e620} LUA",
		python = "\u{ec39} PYTHON",
		javascript = "\u{f2ef} JAVASCRIPT",
		html = "\u{e736} HTML",
		css = "\u{f19f} CSS",
		json = "\u{e60b} JSON",
		markdown = "\u{f48a} MARKDOWN",
		sh = "\u{ebca} SH",
		c = "\u{e61e} C",
		cpp = "\u{e61d} CPP",
		r = "\u{e68b} RUST",
		java = "\u{edaf} JAVA",
		ts = "\u{e69d} TYPESCRIPT",
		php = "\u{e608} PHP",
		ruby = "\u{e605} RUBY",
		oil = "\u{f0645} OIL",
		text = "\u{f15c} TEXT",
	}

	if ft == "" then
		return " FILETYPE"
	end

	return (icons[ft] or ft)
end

-- LSP status
local function lsp_status()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients > 0 then
		return clients[1].name
	end
	return " LSP"
end

-- File size
local function file_size()
	local size = vim.fn.getfsize(vim.fn.expand("%"))
	if size < 0 then
		return ""
	end
	if size < 1024 then
		return size .. "B "
	elseif size < 1024 * 1024 then
		return string.format("%.1fKB", size / 1024)
	elseif size < 1024 * 1024 * 1024 then
		return string.format("%.1fMB", size / 1024 / 1024)
	else
		return string.format("%.1fGB", size / 1024 / 1024 / 1024)
	end
end

-- Mode indicators with icons
local function mode_icon()
	local mode = vim.fn.mode()
	local modes = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		V = "V-LINE",
		["\19"] = "S-BLOCK",
		R = "REPLACE",
		r = "REPLACE",
		["!"] = "SHELL",
		t = "TERMINAL",
	}
	return modes[mode] or mode:upper()
end

_G.mode_icon = mode_icon
_G.git_branch = git_branch
_G.file_type = file_type
_G.file_size = file_size
_G.lsp_status = lsp_status

vim.cmd([[
highlight StatusLineBold gui=bold cterm=bold
]])

-- Funciton to change statusline based on window focus
local function setup_dynamic_statusline()
	vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
		callback = function()
			vim.opt_local.statusline = table.concat({
				"%#StatusLineBold#",
				" %{v:lua.mode_icon()}",
				"%#StatusLine#",
				"  ",
				"%{v:lua.git_branch()}",
				"  %f %h%m%r",
				"%=",
				"%{v:lua.file_size()}",
				"  ",
				"%{v:lua.file_type()}",
				"  ",
				"%{v:lua.lsp_status()}",
				"  ",
				"%l:%c  %P ",
			})
		end,
	})
	vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })

	vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
		callback = function()
			vim.opt_local.statusline = table.concat({
				"  %f %h%m%r",
				"%=",
				"%{v:lua.file_size()}",
				"  ",
				"%{v:lua.file_type()}",
				"  ",
				"%l:%c  %P ",
			})
		end,
	})
end

setup_dynamic_statusline()

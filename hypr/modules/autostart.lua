-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	if HOSTNAME == DESKTOP then
		hl.exec_cmd("waybar -c ~/.config/waybar/desktop.jsonc")
	elseif HOSTNAME == LAPTOP then
		hl.exec_cmd("waybar -c ~/.config/waybar/laptop.jsonc")
	end
	hl.exec_cmd("mako")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("alacritty --title btop -e btop")
	hl.exec_cmd("discord")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)

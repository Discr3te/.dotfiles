---------------------
---- KEYBINDINGS ----
---------------------

local terminal = "alacritty"
local fileManager = "nautilus --new-window"
local menu = "pkill fuzzel || fuzzel"
local browser = "firefox"
local exit_hyprland = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(exit_hyprland))

-- Move window to masters
hl.bind(mainMod .. " + M", hl.dsp.layout("swapwithmaster"))

-- Fake Fullscreen
hl.bind(
	mainMod .. " + F",
	hl.dsp.window.fullscreen_state({
		internal = 0,
		client = 2,
		action = "toggle",
		layout_aware = true,
		window = "activewindow",
	})
)

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- Resize windows
hl.bind(mainMod .. " + SHIFT + R", function()
	hl.dispatch(hl.dsp.submap("resize"))
	WindowResizeActiveNotification = hl.notification.create({
		text = " WINDOW RESIZE ACTIVE\n" .. " Precise Resizeing(1px): hjkl\n" .. " Rough Resizeing(5px): SHIFT + hjkl",
		timeout = 9999999999999999999,
		icon = "info",
	})
end)

hl.define_submap("resize", function()
	-- precise resizeing(1px)
	hl.bind("H", hl.dsp.window.resize({ x = -1, y = 0, relative = true }), { repeating = true })
	hl.bind("L", hl.dsp.window.resize({ x = 1, y = 0, relative = true }), { repeating = true })
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = 1, relative = true }), { repeating = true })
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = -1, relative = true }), { repeating = true })

	-- rough resizeing(5px)
	hl.bind("SHIFT + H", hl.dsp.window.resize({ x = -5, y = 0, relative = true }), { repeating = true })
	hl.bind("SHIFT + L", hl.dsp.window.resize({ x = 5, y = 0, relative = true }), { repeating = true })
	hl.bind("SHIFT + K", hl.dsp.window.resize({ x = 0, y = 5, relative = true }), { repeating = true })
	hl.bind("SHIFT + J", hl.dsp.window.resize({ x = 0, y = -5, relative = true }), { repeating = true })

	hl.bind("escape", function()
		hl.dispatch(hl.dsp.submap("reset"))
		WindowResizeActiveNotification:set_timeout(1)
		hl.notification.create({
			text = " Window Resize Inactive",
			timeout = 2000,
			icon = "info",
		})
	end)
end)

-- Workspace
hl.bind(mainMod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + " .. 1, hl.dsp.window.move({ workspace = 1 }))

hl.bind(mainMod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + " .. 2, hl.dsp.window.move({ workspace = 2 }))

hl.bind(mainMod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + " .. 3, hl.dsp.window.move({ workspace = 3 }))

hl.bind(mainMod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + " .. 4, hl.dsp.window.move({ workspace = 4 }))

hl.bind(mainMod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + " .. 5, hl.dsp.window.move({ workspace = 5 }))

-- Move focus to window with MainMod + arrow keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("spotify"))
hl.bind(mainMod .. " + R", hl.dsp.workspace.toggle_special("btop"))
hl.bind(mainMod .. " + C", hl.dsp.workspace.toggle_special("chat"))

-- Move/resize windows with MainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
if HOSTNAME == LAPTOP then
	hl.bind(
		"XF86AudioRaiseVolume",
		hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioLowerVolume",
		hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioMute",
		hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioMicMute",
		hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86MonBrightnessUp",
		hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86MonBrightnessDown",
		hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
		{ locked = true, repeating = true }
	)

	-- Requires playerctl
	hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
	hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
	hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
	hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
end

if HOSTNAME == LAPTOP then
	hl.config({
		input = {
			kb_options = "caps:swapescape",
		},
	})
end

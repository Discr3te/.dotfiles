-----------------------
---- WINDOWS RULES ----
-----------------------

hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule

-- hl.window_rule({
-- 	name = "move-hyprland-run",
-- 	match = { class = "hyprland-run" },
-- 	move = "20 monitor_h-120",
-- 	float = true,
-- })

-- hl.window_rule({
-- 	name = "browser",
-- 	match = {
-- 		class = "firefox",
-- 	},
-- 	workspace = 1,
-- })
--
-- hl.window_rule({
-- 	name = "terminal",
-- 	match = {
-- 		initial_class = "Alacritty",
-- 		initial_title = "Alacritty",
-- 	},
-- 	workspace = 2,
-- })
--
-- hl.window_rule({
-- 	name = "pavucontrol",
-- 	match = {
-- 		class = "org.pulseaudio.pavucontrol",
-- 	},
-- 	workspace = 3,
-- })
--
-- hl.window_rule({
-- 	name = "nmtui",
-- 	match = {
-- 		class = "Alacritty",
-- 		title = "nmtui",
-- 	},
-- 	workspace = 3,
-- })

hl.window_rule({
	name = "satty (screenshot)",
	match = {
		class = "com.gabm.satty",
		title = "satty",
	},
	float = true,
	center = true,
	size = { "(monitor_w*0.80)", "(monitor_h*0.80)" },
})

hl.window_rule({
	name = "spotify",
	match = {
		initial_class = "spotify_player",
	},
	workspace = "special:spotify silent",
})

hl.window_rule({
	name = "discord",
	match = {
		class = "discord",
	},
	workspace = "special:chat silent",
})

hl.window_rule({
	name = "btop",
	match = {
		title = "btop",
	},
	workspace = "special:btop silent",
})

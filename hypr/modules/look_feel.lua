-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 6,

		col = {
			active_border = "rgba(33ccffee)",
			inactive_border = "rgba(595959aa)",
		},

		-- resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true,

		layout = "master",
	},

	master = {
		mfact = 0.50,
	},

	decoration = {
		rounding = 5,
		rounding_power = 5,

		shadow = {
			enabled = false,
		},

		blur = {
			enabled = false,
		},
	},

	animations = {
		enabled = false,
	},

	misc = {
		font_family = "JetBrainsMono Nerd Font",
		disable_splash_rendering = true,
		force_default_wallpaper = 1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background.
		background_color = "0xff000000", -- black background color
	},
})

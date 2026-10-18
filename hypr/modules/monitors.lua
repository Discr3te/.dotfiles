-----------------
---- MONITORS ----
------------------

if HOSTNAME == DESKTOP then
	hl.monitor({
		output = "desc:BNQ BenQ RD280U 65S0044501Q",
		mode = "3840x2560@59.98",
		position = "auto",
		scale = 1.67,
	})
elseif HOSTNAME == LAPTOP then
	hl.monitor({
		output = "desc:Lenovo Group Limited 0x403D",
		mode = "1920x1200@60",
		position = "auto",
		scale = 1.33,
		cm = "edid",
	})
end

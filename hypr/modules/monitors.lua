-----------------
---- MONITORS ----
------------------

if HOSTNAME == DESKTOP then
	hl.monitor({
		output = "",
		mode = "preferred",
		position = "auto",
		scale = 1.67,
	})
elseif HOSTNAME == LAPTOP then
	hl.monitor({
		output = "",
		mode = "preferred",
		position = "auto",
		scale = 1.20,
	})
end

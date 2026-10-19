function get_hostname()
	local f = io.open("/etc/hostname", "r")
	if not f then
		hl.notification.create({
			text = [[hypr/modules/utils.lua: get_hostname
      failed to read hostname.]],
			timeout = 10000,
			icon = "warning",
		})
		return ""
	end
	local name = f:read("*l") or ""
	f:close()
	return name
end

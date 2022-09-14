;Autoclicker
toggle = 0
#MaxThreadsPerHotkey 3
;CTRL + ALT + S
^!s::
	Toggle := !Toggle
	While Toggle {
		click
		sleep 50
	}
return

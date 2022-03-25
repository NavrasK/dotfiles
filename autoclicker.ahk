toggle = 0
#MaxThreadsPerHotkey 3
^!s::
	Toggle := !Toggle
	While Toggle {
		click
		sleep 50
	}
return


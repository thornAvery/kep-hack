CelesteHillOutside_Object:
	db $3 ; border block

	def_warp_events
	warp_event 20, 39, CELESTE_HILL_GATE, 1
	warp_event 21, 39, CELESTE_HILL_GATE, 2
	warp_event 16, 27, CELESTE_HILL_CAVE, 1
	warp_event 36, 15, CELESTE_HILL_CAVE, 5
	warp_event  2, 13, CELESTE_HILL_CAVE, 6
	warp_event 22,  7, CELESTE_HILL_CAVE, 7
	warp_event 18,  4, CELESTE_HILL, 1
	warp_event 19,  4, CELESTE_HILL, 2

	def_bg_events

	def_object_events

	def_warps_to CELESTE_HILL_OUTSIDE

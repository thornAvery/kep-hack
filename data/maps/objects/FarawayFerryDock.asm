FarawayFerryDock_Object:
	db $15 ; border block

	def_warp_events
	warp_event 14,  0, FARAWAY_ISLAND_OUTSIDE, 1
	warp_event 14,  5, SEAGALLOP_FERRY, 1

	def_bg_events

	def_object_events

	def_warps_to FARAWAY_FERRY_DOCK

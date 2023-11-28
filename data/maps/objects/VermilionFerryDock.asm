VermilionFerryDock_Object:
	db $15 ; border block

	def_warp_events
	warp_event 14,  0, LAST_MAP, 9
	warp_event 14,  5, SEAGALLOP_FERRY, 1

	def_bg_events

	def_object_events

	def_warps_to VERMILION_FERRY_DOCK

Route10Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  5,  0, ROUTE_10, 7
	warp_event  4,  7, ROUTE_10, 6
	warp_event  5,  7, ROUTE_10, 6

	def_bg_events

	def_object_events
	object_event  3,  4, SPRITE_GRAMPS, STAY, LEFT, 1 ; person

	def_warps_to ROUTE_10_GATE

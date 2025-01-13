SafariZoneCenterRestHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_CENTER, 9
	warp_event  3,  7, SAFARI_ZONE_CENTER, 9

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_GIRL, STAY, LEFT, 1 ; person
	object_event  5,  6, SPRITE_SCIENTIST, WALK, UP_DOWN, 2 ; person

	def_warps_to SAFARI_ZONE_CENTER_REST_HOUSE

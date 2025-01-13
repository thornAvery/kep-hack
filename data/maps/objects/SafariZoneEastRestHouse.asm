SafariZoneEastRestHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_EAST, 5
	warp_event  3,  7, SAFARI_ZONE_EAST, 5

	def_bg_events

	def_object_events
	object_event  5,  5, SPRITE_SCIENTIST, WALK, UP_DOWN, 1 ; person
	object_event  0,  4, SPRITE_ROCKER, STAY, RIGHT, 2 ; person
	object_event  3,  3, SPRITE_SILPH_WORKER, STAY, LEFT, 3 ; person
	object_event  3,  4, SPRITE_SILPH_WORKER, STAY, LEFT, 4 ; person

	def_warps_to SAFARI_ZONE_EAST_REST_HOUSE

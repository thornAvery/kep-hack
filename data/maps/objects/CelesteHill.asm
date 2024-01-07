CelesteHill_Object:
	db $2 ; border block

	def_warp_events
	warp_event 10, 21, CELESTE_HILL_OUTSIDE, 7
	warp_event 11, 21, CELESTE_HILL_OUTSIDE, 8

	def_bg_events
	bg_event 10, 12, 2

	def_object_events
	object_event 11,  6, SPRITE_BIRD, STAY, DOWN, 1, MOLTRES_G, 65 | OW_POKEMON ; person

	def_warps_to CELESTE_HILL
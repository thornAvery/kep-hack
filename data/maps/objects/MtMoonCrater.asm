MtMoonCrater_Object:
	db $41 ; border block

	def_warp_events
	warp_event 46, 46, MT_MOON_B1F, 14

	def_bg_events

	def_object_events
	object_event 33, 17, SPRITE_FOSSIL, STAY, NONE, 1, DOME_FOSSIL
	object_event 32, 32, SPRITE_FOSSIL, STAY, NONE, 2, WING_FOSSIL
	object_event 33, 16, SPRITE_FOSSIL, STAY, NONE, 3, HELIX_FOSSIL
	object_event 45, 24, SPRITE_POKE_BALL, STAY, NONE, 4, MAX_ETHER

	def_warps_to MT_MOON_CRATER
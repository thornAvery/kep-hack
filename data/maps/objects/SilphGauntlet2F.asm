SilphGauntlet2F_Object:
	db $3 ; border block

	def_warp_events
	warp_event  7,  5, SILPH_GAUNTLET_1F, 2
	warp_event  3, 13, SILPH_GAUNTLET_3F, 1

	def_bg_events

	def_object_events
	object_event 13,  5, SPRITE_COOLTRAINER_F, STAY, DOWN, 1, OPP_LASS, 19
	object_event 21,  9, SPRITE_HIKER, STAY, UP, 2, OPP_HIKER, 15
	object_event 24, 13, SPRITE_SUPER_NERD, STAY, RIGHT, 3, OPP_SUPER_NERD, 8
	object_event 23, 19, SPRITE_SUPER_NERD, STAY, UP, 4, OPP_POKEMANIAC, 8
	object_event 11, 16, SPRITE_BEAUTY, STAY, DOWN, 5, OPP_BEAUTY, 11
	object_event  2, 16, SPRITE_HIKER, STAY, RIGHT, 6, OPP_BLACKBELT, 9

	def_warps_to SILPH_GAUNTLET_2F

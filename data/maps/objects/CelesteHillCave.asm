CelesteHillCave_Object:
	db $03 ; border block

	def_warp_events
	warp_event 18, 35, CELESTE_HILL_OUTSIDE, 3
	warp_event 19, 35, CELESTE_HILL_OUTSIDE, 3
	warp_event 19, 23, CELESTE_HILL_CAVE, 4
	warp_event 2, 16, CELESTE_HILL_CAVE, 3
	warp_event 37, 13, CELESTE_HILL_OUTSIDE, 4
	warp_event  5,  3, CELESTE_HILL_OUTSIDE, 5
	warp_event 37,  2, CELESTE_HILL_OUTSIDE, 6

	def_bg_events

	def_object_events
	object_event 22, 15, SPRITE_BEAUTY, STAY, DOWN, 1, OPP_BEAUTY, 17 ; Mina reference Trainer
	object_event 23,  4, SPRITE_COOLTRAINER_M, STAY, UP, 2, OPP_COOLTRAINER_M, 12 ; Primo reference Trainer

	def_warps_to CELESTE_HILL_CAVE

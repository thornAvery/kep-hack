BrunswickTrail_Object:
	db $43 ; border block

	def_warp_events
	warp_event 12,  9, GARNET_CAVERN_1F, 1
	warp_event 40,  5, BRUNSWICK_GLADE, 1

	def_bg_events
	bg_event 55,  8, 10 ; sign

	def_object_events
	object_event 23, 11, SPRITE_FAKE_TREE, STAY, NONE, 1, CACTORMUS, 50 | OW_POKEMON ; person
	object_event 45, 19, SPRITE_COOLTRAINER_M, STAY, UP, 2, OPP_BIRD_KEEPER, 12 ; person
	object_event 19, 14, SPRITE_BEAUTY, STAY, DOWN, 3, OPP_BEAUTY, 16 ; person
	object_event 25, 21, SPRITE_FISHER, STAY, DOWN, 4, OPP_FISHER, 13 ; person
	object_event 10, 10, SPRITE_HIKER, STAY, RIGHT, 5 ; person, Cave guy
	object_event 54,  9, SPRITE_BIRD, STAY, UP, 6 ; person, GZap
	object_event  6, 16, SPRITE_COOLTRAINER_F, STAY, LEFT, 7 ; person, Lover1
	object_event  6, 15, SPRITE_BRUNETTE_GIRL, STAY, LEFT, 8 ; person, Lover2
	object_event 20, 21, SPRITE_POKE_BALL, STAY, NONE, 9, ULTRA_BALL ; itemball1


	def_warps_to BRUNSWICK_TRAIL

BrunswickGlade_Object:
	db $2 ; border block

	def_warp_events
	warp_event 18, 39, BRUNSWICK_TRAIL, 2
	warp_event 19, 39, BRUNSWICK_TRAIL, 2
	warp_event  8,  0, BRUNSWICK_GROTTO, 1
	warp_event  9,  0, BRUNSWICK_GROTTO, 2

	def_bg_events
	bg_event 14, 24, 12 ; Sign

	def_object_events
	object_event 16,  8, SPRITE_COOLTRAINER_F, STAY, DOWN, 1, OPP_COOLTRAINER_F, 6 ; Leaf reference Trainer
	object_event  7, 30, SPRITE_GENTLEMAN, STAY, UP, 2, OPP_GENTLEMAN, 6 ; Fuji reference Trainer
	object_event 15, 31, SPRITE_BEAUTY, STAY, RIGHT, 3, OPP_BEAUTY, 19 ; Ariana reference Trainer
	object_event 31,  4, SPRITE_COOLTRAINER_M, STAY, DOWN, 4, OPP_COOLTRAINER_M, 13 ; Trace reference Trainer
	object_event 32, 28, SPRITE_BIRD, STAY, DOWN, 5
	object_event 32, 14, SPRITE_BIRD, STAY, RIGHT, 6
	object_event  9,  2, SPRITE_BIRD, STAY, UP, 7
	object_event 33, 11, SPRITE_POKE_BALL, STAY, NONE, 8, TM_THUNDER ; itemball1
	object_event  5, 21, SPRITE_POKE_BALL, STAY, NONE, 9, LEAF_STONE ; itemball2
	object_event 22, 15, SPRITE_POKE_BALL, STAY, NONE, 10, REVIVE ; itemball3
	object_event  9, 33, SPRITE_POKE_BALL, STAY, NONE, 11, HYPER_POTION ; itemball4

	def_warps_to BRUNSWICK_GLADE
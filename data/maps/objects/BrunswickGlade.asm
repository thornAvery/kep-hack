BrunswickGlade_Object:
	db $2 ; border block

	def_warp_events
	warp_event 18, 39, BRUNSWICK_TRAIL, 2
	warp_event 19, 39, BRUNSWICK_TRAIL, 2
	warp_event  8,  0, BRUNSWICK_GROTTO, 1
	warp_event  9,  0, BRUNSWICK_GROTTO, 2

	def_bg_events
	bg_event 14, 24, 8 ; Sign

	def_object_events
	object_event 32, 25, SPRITE_BIRD, STAY, DOWN, 1
	object_event 20, 18, SPRITE_BIRD, STAY, RIGHT, 2
	object_event  9,  3, SPRITE_BIRD, STAY, UP, 3
	object_event  6, 15, SPRITE_POKE_BALL, STAY, NONE, 4, TM_THUNDER ; itemball1
	object_event  6, 15, SPRITE_POKE_BALL, STAY, NONE, 5, LEAF_STONE ; itemball2
	object_event  6, 15, SPRITE_POKE_BALL, STAY, NONE, 6, REVIVE ; itemball3
	object_event  6, 15, SPRITE_POKE_BALL, STAY, NONE, 7, HYPER_POTION ; itemball4

	def_warps_to BRUNSWICK_GLADE
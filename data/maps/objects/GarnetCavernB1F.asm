GarnetCavernB1F_Object:
	db $7d ; border block

	def_warp_events
	warp_event  3,  6, GARNET_CAVERN_1F, 9
	
	def_bg_events

	def_object_events
	object_event  5, 11, SPRITE_BIRD, STAY, RIGHT, 1, ARTICUNO_G, 65 | OW_POKEMON ; person
	object_event 24,  1, SPRITE_POKE_BALL, STAY, DOWN, 2, MAX_REVIVE
	object_event 19,  2, SPRITE_POKE_BALL, STAY, DOWN, 3, ESCAPE_ROPE
	object_event  9,  1, SPRITE_BIRD, STAY, DOWN, 4 ; cuno copy 1
	object_event 19,  7, SPRITE_BIRD, STAY, LEFT, 5 ; cuno copy 2
	
	def_warps_to GARNET_CAVERN_B1F

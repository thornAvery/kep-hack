PokemonMansionB2F_Object:
	db $0D ; border block

	def_warp_events
	warp_event 26, 22, CINNABAR_ISLAND, 1 ; this should not be accessible, only something the player arrives at.
	warp_event 27,  2, CINNABAR_ISLAND, 1

	def_bg_events
	bg_event 23,  0, 5 ; photo
	bg_event 18,  2, 6 ; starter pod
	bg_event 14,  2, 7 ; starter pod
	bg_event 10,  2, 8 ; starter pod
	bg_event  6,  2, 9 ; amber's pod
	bg_event  1,  2, 10 ; mewtwo's pod
	bg_event 12,  6, 11 ; computer 1
	bg_event 14,  6, 12 ; computer 2
	bg_event 16,  6, 13 ; computer 3

	def_object_events
	object_event  7,  8, SPRITE_POKEDEX, STAY, NONE, 1 ; Book 1
	object_event 26,  6, SPRITE_POKEDEX, STAY, NONE, 2 ; Book 2
	object_event  8,  8, SPRITE_POKE_BALL, STAY, NONE, 3, TM_PSYCHIC_M
	object_event 25,  6, SPRITE_POKE_BALL, STAY, NONE, 4, RARE_CANDY

	def_warps_to POKEMON_MANSION_B2F
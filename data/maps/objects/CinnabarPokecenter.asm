CinnabarPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 4
	warp_event  4,  7, LAST_MAP, 4

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, 1 ; person
	object_event  9,  4, SPRITE_COOLTRAINER_F, WALK, ANY_DIR, 2 ; person
	object_event  2,  6, SPRITE_GENTLEMAN, STAY, NONE, 3 ; person
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, 4 ; person
	object_event  9,  6, SPRITE_MIDDLE_AGED_MAN, WALK, LEFT_RIGHT, 5 ; spamton
	object_event  8,  3, SPRITE_GAMEBOY_KID, STAY, DOWN, 6 ; Muk Trader
	object_event  4,  1, SPRITE_CHANSEY, STAY, DOWN, 7 ; Chansey

	def_warps_to CINNABAR_POKECENTER

FuchsiaCity_Object:
	db $f ; border block

	def_warp_events
	warp_event 15, 19, FUCHSIA_MART, 1
	warp_event 11, 27, FUCHSIA_BILLS_GRANDPAS_HOUSE, 1
	warp_event 19, 27, FUCHSIA_POKECENTER, 1
	warp_event 28, 27, WARDENS_HOUSE, 1
	warp_event 18,  3, SAFARI_ZONE_GATE, 1
	warp_event  5, 27, FUCHSIA_GYM, 1
	warp_event 22, 13, FUCHSIA_MEETING_ROOM, 1

	def_bg_events
	bg_event 25, 17, 13 ; FuchsiaCityText12
	bg_event 17,  5, 14 ; FuchsiaCityText13
	bg_event 16, 19, 15 ; MartSignText
	bg_event 20, 27, 16 ; PokeCenterSignText
	bg_event 27, 29, 17 ; FuchsiaCityText16
	bg_event 21, 17, 18 ; FuchsiaCityText17
	bg_event  3, 29, 19 ; FuchsiaCityText18
	bg_event 33,  7, 20 ; FuchsiaCityText19
	bg_event 27,  7, 21 ; FuchsiaCityText20
	bg_event 13,  7, 22 ; FuchsiaCityText21
	bg_event 31, 13, 23 ; FuchsiaCityText22
	bg_event 13, 15, 24 ; FuchsiaCityText23
	bg_event  7,  7, 25 ; FuchsiaCityText24

	def_object_events
	object_event 10, 12, SPRITE_YOUNGSTER, WALK, LEFT_RIGHT, 1 ; person
	object_event 28, 16, SPRITE_GAMBLER, WALK, LEFT_RIGHT, 2 ; person
	object_event 30, 14, SPRITE_FISHER, STAY, DOWN, 3 ; person
	object_event 24,  8, SPRITE_YOUNGSTER, STAY, UP, 4 ; person
	object_event 31,  5, SPRITE_CHANSEY, STAY, ANY_DIR, 5 ; person
	object_event 25,  6, SPRITE_VOLTORB, STAY, NONE, 6 ; person
	object_event 12,  6, SPRITE_MONSTER, WALK, LEFT_RIGHT, 7 ; person
	object_event 30, 12, SPRITE_MONSTER, WALK, LEFT_RIGHT, 8 ; person
	object_event  8, 17, SPRITE_SEEL, WALK, ANY_DIR, 9 ; person
	object_event  6,  5, SPRITE_FOSSIL, STAY, NONE, 10 ; person
	object_event 11,  8, SPRITE_GAMBLER, STAY, UP, 11 ; person
	object_event 15,  2, SPRITE_MIDDLE_AGED_MAN, STAY, DOWN, 12 ; spamton

	def_warps_to FUCHSIA_CITY

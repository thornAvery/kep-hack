CitrineCity_Object:
	db $43 ; border block

	def_warp_events
	warp_event  9, 25, CITRINE_ROCKET_HOUSE, 1
	warp_event  9, 17, CITRINE_TRADEBACK_HOUSE, 1
	warp_event 15, 17, CITRINE_POKECENTER, 1
	warp_event 15, 25, CITRINE_MART, 1
	warp_event 23,  5, CELESTE_HILL_GATE, 4
	warp_event 11,  7, BATTLE_TENT, 1
	warp_event 26, 31, CITRINE_FERRY_DOCK, 1
	warp_event 27, 31, CITRINE_FERRY_DOCK, 1

	def_bg_events
	bg_event 16, 25,  5 ; Citrine Shop
	bg_event 16, 17,  6 ; Pokecenter
	bg_event 20, 22,  7 ; Billboard 1
	bg_event  5, 18,  8 ; Billboard 2
	bg_event  9,  7,  9 ; Battle Tower
	bg_event 33, 23, 10 ; City Sign
	bg_event 25, 22, 11 ; Directions
	bg_event 25,  7, 12 ; Celeste Hill Sign

	def_object_events
	object_event 12, 19, SPRITE_BEAUTY, WALK, LEFT_RIGHT, 1 ; person
	object_event  6,  9, SPRITE_HIKER,  WALK, LEFT_RIGHT, 2 ; person
	object_event 19, 15, SPRITE_GENTLEMAN, STAY, UP, 3 ; person
	object_event 29, 23, SPRITE_ROCKER, WALK, ANY_DIR, 4 ; person

	def_warps_to CITRINE_CITY

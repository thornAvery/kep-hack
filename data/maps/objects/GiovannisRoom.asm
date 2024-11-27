GiovannisRoom_Object:
	db $2e ; border block

	def_warp_events
	warp_event  5,  4, VIRIDIAN_GYM, 3
	warp_event 17,  4, VIRIDIAN_CITY, 6

	def_bg_events

	def_object_events
	object_event  4, 22, SPRITE_PAPER, STAY, DOWN, 1
	object_event 17,  8, SPRITE_PAPER, STAY, RIGHT, 2
	object_event 17, 15, SPRITE_PAPER, STAY, DOWN, 3
	object_event 14, 24, SPRITE_PAPER, STAY, RIGHT, 4
	object_event 18,  4, SPRITE_POKE_BALL, STAY, NONE, 5, TM_EARTHQUAKE
	object_event  5, 22, SPRITE_POKE_BALL, STAY, NONE, 6, PROTECTOR

	def_warps_to GIOVANNIS_ROOM

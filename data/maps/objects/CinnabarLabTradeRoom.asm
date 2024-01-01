CinnabarLabTradeRoom_Object:
	db $17 ; border block

	def_warp_events
	warp_event  2,  7, CINNABAR_LAB, 3
	warp_event  3,  7, CINNABAR_LAB, 3

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_SUPER_NERD, STAY, DOWN, 1 ; person
	object_event  3,  5, SPRITE_GAMEBOY_KID, STAY, DOWN, 2 ; Trader

	def_warps_to CINNABAR_LAB_TRADE_ROOM

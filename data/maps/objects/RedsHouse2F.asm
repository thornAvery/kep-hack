RedsHouse2F_Object:
	db $a ; border block

	def_warp_events
	warp_event  7,  1, REDS_HOUSE_1F, 3
	;warp_event  5,  1, SILPH_GAUNTLET_7F, 1 ; - Test Chief 
	;warp_event  5,  1, SILPH_CO_1F, 1 ; - Go through Gauntlet
	;warp_event  5,  1, MT_MOON_SQUARE, 1 ; - Test Shop, NPCs, and Crater
	warp_event	 5,  1, HALL_OF_FAME, 1 ; Test post-game setup
	;warp_event	 5,  1, CERULEAN_CAVE_B1F, 1 ; Test Mewtwo theme
	
	def_bg_events

	def_object_events

	def_warps_to REDS_HOUSE_2F

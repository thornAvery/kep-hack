RedsHouse2F_Object:
	db $a ; border block

	def_warp_events
	warp_event  7,  1, REDS_HOUSE_1F, 3
	;warp_event  5,  1, SILPH_GAUNTLET_7F, 1 ; - Test Chief 
	;warp_event  5,  1, SILPH_CO_11F, 2 ; - Test J&J, Omega, & Giovanni. To test the Omega refight, change to SHOW in hide/show data, and set warp ID to 1.
	;warp_event  5,  1, ROCKET_HIDEOUT_B4F, 2 ; - Test Giovanni 1
	;warp_event  5,  1, MT_MOON_SQUARE, 1 ; - Test Shop, NPCs, and Crater
	;warp_event  5,  1, CELESTE_HILL, 1 ; - Test GMolt
	;warp_event	 5,  1, HALL_OF_FAME, 1 ; Test post-game setup
	;warp_event	 5,  1, GARNET_CAVERN_B1F, 1 ; Test GCuno
	;warp_event	 5,  1, FARAWAY_ISLAND_INSIDE, 1 ; Test Mew
	warp_event	 5,  1, GIOVANNIS_ROOM, 1 ; Test spinner tiles

	def_bg_events

	def_object_events

	def_warps_to REDS_HOUSE_2F

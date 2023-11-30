CinnabarVolcanoFloors_Object:
	db $03 ; border block

	def_warp_events
	warp_event 25, 39, LAST_MAP, 6
	warp_event 24, 39, LAST_MAP, 6
	warp_event 24, 24, CINNABAR_VOLCANO_FLOORS, 4
	warp_event 25,  3, CINNABAR_VOLCANO_FLOORS, 3
	warp_event 27, 12, CINNABAR_VOLCANO_FLOORS, 6
	warp_event  5, 13, CINNABAR_VOLCANO_FLOORS, 5
	warp_event  5,  3, CINNABAR_VOLCANO_FLOORS, 8
	warp_event  5, 25, CINNABAR_VOLCANO_FLOORS, 7
	warp_event 12, 24, CINNABAR_VOLCANO, 1

	def_bg_events

	def_object_events
	object_event  9, 10, SPRITE_COOLTRAINER_M, STAY, RIGHT, 1, OPP_FIREFIGHTER, 3
	object_event 37,  4, SPRITE_COOLTRAINER_M, STAY, LEFT, 2, OPP_FIREFIGHTER, 4
	object_event 13,  8, SPRITE_COOLTRAINER_M, STAY, LEFT, 3, OPP_FIREFIGHTER, 5
	object_event 5,  32, SPRITE_SCIENTIST, STAY, RIGHT, 4, OPP_SCIENTIST, 9
	object_event 35,  7, SPRITE_POKE_BALL, STAY, DOWN, 5, FULL_RESTORE
	object_event 25, 33, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 6 ; person
	object_event 24, 30, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 7 ; person
	object_event 25, 28, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 8 ; person
	object_event 33,  6, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 9 ; person
	object_event 34, 11, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 10 ; person
	object_event 11, 35, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 11 ; person
	object_event 12, 30, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 12 ; person

	def_warps_to CINNABAR_VOLCANO_FLOORS

CinnabarVolcano_Object:
	db $7d ; border block

	def_warp_events 
	warp_event 15, 21, CINNABAR_VOLCANO_FLOORS, 9

	def_bg_events

	def_object_events
	object_event 15,  5, SPRITE_BIRD, STAY, UP, 1, MOLTRES, 50 | OW_POKEMON
	object_event 13, 14, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 2 ; person
	object_event 14, 13, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 3 ; person
	object_event 14, 12, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 4 ; person
	object_event 15, 12, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 5 ; person
	object_event 14, 10, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 6 ; person
	object_event 15, 10, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 7 ; person

	def_warps_to CINNABAR_VOLCANO

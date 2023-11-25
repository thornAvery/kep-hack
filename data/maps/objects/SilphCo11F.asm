SilphCo11F_Object:
	db $d ; border block

	def_warp_events
	warp_event  9,  0, SILPH_CO_7F, 1
;	warp_event 13,  0, SILPH_CO_ELEVATOR, 1
;	warp_event  2,  2, LAST_MAP, 10
	warp_event  3,  2, SILPH_CO_7F, 3

	def_bg_events
	bg_event 11, 12, 14 ; Porygon PC

	def_object_events
	object_event  7,  5, SPRITE_SILPH_PRESIDENT, STAY, DOWN, 1 ; person
	object_event 10,  5, SPRITE_BEAUTY, STAY, DOWN, 2 ; person
	object_event  6,  9, SPRITE_GIOVANNI, STAY, DOWN, 3, OPP_GIOVANNI, 2
	object_event  2,  8, SPRITE_JAMES, STAY, UP, 4
	object_event  7, 14, SPRITE_ROCKET, STAY, LEFT, 5, OPP_ROCKET, 41
	object_event  3,  8, SPRITE_JESSIE, STAY, UP, 6
	object_event  6, 11, SPRITE_MONSTER, STAY, UP, 11, OMEGADGE, 40 | OW_POKEMON
	object_event 15, 15, SPRITE_MONSTER, STAY, UP, 12, OMEGADGE, 65 | OW_POKEMON

	def_warps_to SILPH_CO_11F

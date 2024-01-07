BrunswickGrotto_Object:
	db $2 ; border block

	def_warp_events
	warp_event 24, 23, BRUNSWICK_GLADE, 3
	warp_event 25, 23, BRUNSWICK_GLADE, 4

	def_bg_events
	bg_event 22, 10, 2 ; signage
	
	def_object_events
	object_event  5,  5, SPRITE_BIRD, STAY, LEFT, 1, ZAPDOS_G, 65 | OW_POKEMON ; person

	def_warps_to BRUNSWICK_GROTTO

ViridianForestWildMons:
	def_grass_wildmons 8 ; encounter rate
IF DEF(_RED)
	db  6, WEEDLE
	db  9, KAKUNA
	db  6, WEEDLE
	db  6, WEEDLE
	db  5, MONJA
	db  9, KAKUNA
	db  9, METAPOD
	db  6, CATERPIE
	db  5, PIKACHU
	db 10, BEEDRILL
ENDC
IF DEF(_BLUE)
	db  6, CATERPIE
	db  9, METAPOD
	db  6, CATERPIE
	db  6, CATERPIE
	db  5, MONJA
	db  9, METAPOD
	db  9, KAKUNA
	db  6, WEEDLE
	db  5, PIKACHU
	db 10, BUTTERFREE
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons

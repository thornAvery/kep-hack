	db DEX_LICKILICKY ; pokedex id

	db 110,  85,  95,  50,  80
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 30 ; catch rate
	db 193 ; base exp

	INCBIN "gfx/pokemon/front/lickilicky.pic", 0, 1 ; sprite dimensions
	dw LickilickyPicFront, LickilickyPicBack

	db WRAP, SUPERSONIC, STOMP, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   SWORDS_DANCE, MEGA_KICK,    TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         THUNDERBOLT,  THUNDER,      EARTHQUAKE,   FISSURE,      \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         SELFDESTRUCT, FIRE_BLAST,   \
	     SKULL_BASH,   REST,         EXPLOSION,    SUBSTITUTE,   CUT,          \
	     SURF,         STRENGTH
	; end

	db BANK(LickilickyPicFront)
	assert BANK(LickilickyPicFront) == BANK(LickilickyPicBack)

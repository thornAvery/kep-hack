	db DEX_ARCANINE_H ; pokedex id

	db  95, 115,  80,  90,  80
	;   hp  atk  def  spd  spc

	db FIRE, ROCK ; type
	db 75 ; catch rate
	db 213 ; base exp

	INCBIN "gfx/pokemon/front/arcanineh.pic", 0, 1 ; sprite dimensions
	dw ArcanineHPicFront, ArcanineHPicBack

	db BITE, ROAR, ROCK_THROW, NO_MOVE ; level 1 learnset, has rock throw for kicks
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         DRAGON_RAGE,  EARTHQUAKE,   FISSURE,      DIG,          \
	     TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         ROCK_SLIDE,   \
	     SUBSTITUTE
	; end

	db BANK(ArcanineHPicFront)
	assert BANK(ArcanineHPicFront) == BANK(ArcanineHPicBack)

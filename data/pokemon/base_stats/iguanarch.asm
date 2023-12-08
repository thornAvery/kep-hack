	db DEX_IGUANARCH ; pokedex id

	db 102,  93,  76, 108, 121
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 9 ; catch rate
	db 210 ; base exp

	INCBIN "gfx/pokemon/front/iguanarch.pic", 0, 1 ; sprite dimensions
	dw IguanarchPicFront, IguanarchPicBack

	db SCRATCH, TAIL_WHIP, LEER, BITE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    HYPER_BEAM,   RAGE,         DRAGON_RAGE,  THUNDERBOLT,  \
	     THUNDER,      DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     SWIFT,        SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   \
	     CUT,          SURF,         STRENGTH
	; end

	db BANK(IguanarchPicFront)
	assert BANK(IguanarchPicFront) == BANK(IguanarchPicBack)

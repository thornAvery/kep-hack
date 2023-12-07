	db DEX_MINISTARE ; pokedex id

	db  72,  53,  46,  98,  81
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 144 ; base exp

	INCBIN "gfx/pokemon/front/ministare.pic", 0, 1 ; sprite dimensions
	dw MinistarePicFront, MinistarePicBack

	db SCRATCH, TAIL_WHIP, LEER, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    RAGE,         DRAGON_RAGE,  THUNDERBOLT,  THUNDER,      \
	     DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         SWIFT,        \
	     SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   CUT,          \
	     SURF,         STRENGTH
	; end

	db BANK(MinistarePicFront)
	assert BANK(MinistarePicFront) == BANK(MinistarePicBack)

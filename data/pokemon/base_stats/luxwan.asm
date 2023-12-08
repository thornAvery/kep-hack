	db DEX_LUXWAN ; pokedex id

	db  72, 105,  75,  70,  63
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 25 ; catch rate
	db 196 ; base exp

	INCBIN "gfx/pokemon/front/luxwan.pic", 0, 1 ; sprite dimensions
	dw LuxwanPicFront, LuxwanPicBack

	db PECK, SAND_ATTACK, LEER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   SWORDS_DANCE, WHIRLWIND,    TOXIC,        HORN_DRILL,   \
	     BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         THUNDERBOLT,  \
	     THUNDER,      MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE,   CUT,          \
	     FLY
	; end

	db BANK(LuxwanPicFront)
	assert BANK(LuxwanPicFront) == BANK(LuxwanPicBack)

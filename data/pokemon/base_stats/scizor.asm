	db DEX_SCIZOR ; pokedex id

	db  70, 130, 100,  65,  55
	;   hp  atk  def  spd  spc

	db BUG, STEEL ; type
	db 45 ; catch rate
	db 204 ; base exp

	INCBIN "gfx/pokemon/front/scizor.pic", 0, 1 ; sprite dimensions
	dw ScizorPicFront, ScizorPicBack

	db QUICK_ATTACK, BULLET_PUNCH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         MIMIC,        DOUBLE_TEAM,  BIDE,         SWIFT,        \
	     SKULL_BASH,   REST,         SUBSTITUTE,   CUT
	; end

	db BANK(ScizorPicFront)
	assert BANK(ScizorPicFront) == BANK(ScizorPicBack)

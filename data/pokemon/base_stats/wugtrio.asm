	db DEX_WUGTRIO ; pokedex id

	db  35,  80,  50, 120,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 50 ; catch rate
	db 153 ; base exp

	INCBIN "gfx/pokemon/front/wugtrio.pic", 0, 1 ; sprite dimensions
	dw WugtrioPicFront, WugtrioPicBack

	db WATER_GUN, SAND_ATTACK, WRAP, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    HYPER_BEAM,   RAGE,	       EARTHQUAKE,   FISSURE,      \
	     DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         REST,         \
	     SUBSTITUTE,   CUT,          SURF
	; end

	db BANK(WugtrioPicFront)
	assert BANK(WugtrioPicFront) == BANK(WugtrioPicBack)

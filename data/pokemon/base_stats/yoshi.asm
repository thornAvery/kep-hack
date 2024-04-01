	db DEX_YOSHI ; pokedex id

	db  91, 134,  95,  80, 100
	;   hp  atk  def  spd  spc

	db DRAGON, NORMAL ; type
	db 9 ; catch rate
	db 218 ; base exp

	INCBIN "gfx/pokemon/front/yoshi.pic", 0, 1 ; sprite dimensions
	dw YoshiPicFront, YoshiPicBack

	db WRAP, LEER, THUNDER_WAVE, AGILITY ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   TOXIC,        HORN_DRILL,   BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   RAGE,         DRAGON_RAGE,  THUNDERBOLT,  THUNDER,      \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         EGG_BOMB,     \
	     FIRE_BLAST,   SWIFT,        SKULL_BASH,   SOFTBOILED,   REST,         \
	     THUNDER_WAVE, SUBSTITUTE,   SURF,         STRENGTH
	; end

	db BANK(YoshiPicFront)
	assert BANK(YoshiPicFront) == BANK(YoshiPicBack)

	db DEX_DISTURBAN ; pokedex id

	db  70, 125, 145,  50,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 60 ; catch rate
	db 203 ; base exp

	INCBIN "gfx/pokemon/front/disturban.pic", 0, 1 ; sprite dimensions
	dw DisturbanPicFront, DisturbanPicBack

	db WITHDRAW, SUPERSONIC, CLAMP, BITE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    \
	     ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         EARTHQUAKE,   \
	     FISSURE,      DIG,          TELEPORT,     MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         SELFDESTRUCT, SWIFT,        REST,         \
	     EXPLOSION,    TRI_ATTACK,   SUBSTITUTE,   SURF, 	     STRENGTH
	; end

	db BANK(DisturbanPicFront)
	assert BANK(DisturbanPicFront) == BANK(DisturbanPicBack)

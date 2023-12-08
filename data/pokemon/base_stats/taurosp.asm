	db DEX_TAUROS_P ; pokedex id

	db  75, 110, 105, 100,  70
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 211 ; base exp

	INCBIN "gfx/pokemon/front/taurospcombat.pic", 0, 1 ; sprite dimensions
	dw TaurosPPicFront, TaurosPPicBack

	db DOUBLE_KICK, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   SUBMISSION,   COUNTER,      \
	     RAGE,         THUNDERBOLT,  THUNDER,      EARTHQUAKE,   FISSURE,      \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         FIRE_BLAST,   SKULL_BASH,   \
	     REST,         SUBSTITUTE,   STRENGTH
	; end

	db BANK(TaurosPPicFront)
	assert BANK(TaurosPPicFront) == BANK(TaurosPPicBack)

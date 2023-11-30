	db DEX_ANNIHILAPE ; pokedex id

	db 110, 115,  80,  90,  50
	;   hp  atk  def  spd  spc

	db FIGHTING, GHOST ; type
	db 45 ; catch rate
	db 210 ; base exp

	INCBIN "gfx/pokemon/front/annihilape.pic", 0, 1 ; sprite dimensions
	dw AnnihilapePicFront, AnnihilapePicBack

	db SCRATCH, LEER, UPPERCUT, KARATE_CHOP ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   PAY_DAY,      SUBMISSION,   COUNTER,      \
	     SEISMIC_TOSS, RAGE,         THUNDERBOLT,  THUNDER,      DIG,          \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         METRONOME,    SWIFT,        \
	     SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	; end

	db BANK(AnnihilapePicFront)
	assert BANK(AnnihilapePicFront) == BANK(AnnihilapePicBack)

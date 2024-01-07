; Song ids are calculated by address to save space.
; SFX_Headers_(1|2|3) indexes (see audio/headers/*.asm)

;MACRO music_const
;	DEF \1 EQUS "((\2 - SFX_Headers_1) / 3)"
;ENDM

	const_def 1

	const MUSIC_PALLET_TOWN
	const MUSIC_POKECENTER
	const MUSIC_GYM
	const MUSIC_CITIES1
	const MUSIC_CITIES2
	const MUSIC_CELADON
	const MUSIC_CINNABAR
	const MUSIC_VERMILION
	const MUSIC_LAVENDER
	const MUSIC_SS_ANNE
	const MUSIC_MEET_PROF_OAK
	const MUSIC_MEET_RIVAL
	const MUSIC_MUSEUM_GUY
	const MUSIC_SAFARI_ZONE
	const MUSIC_PKMN_HEALED
	const MUSIC_ROUTES1
	const MUSIC_ROUTES2
	const MUSIC_ROUTES3
	const MUSIC_ROUTES4
	const MUSIC_INDIGO_PLATEAU
	const MUSIC_AREA_ZERO
	const MUSIC_CITRINE
	
	const MUSIC_GYM_LEADER_BATTLE
	const MUSIC_TRAINER_BATTLE
	const MUSIC_WILD_BATTLE
	const MUSIC_FINAL_BATTLE
	const MUSIC_DEFEATED_TRAINER
	const MUSIC_DEFEATED_WILD_MON
	const MUSIC_DEFEATED_GYM_LEADER
	
	const MUSIC_TITLE_SCREEN
	const MUSIC_CREDITS
	const MUSIC_HALL_OF_FAME
	const MUSIC_OAKS_LAB
	const MUSIC_JIGGLYPUFF_SONG
	const MUSIC_BIKE_RIDING
	const MUSIC_SURFING
	const MUSIC_GAME_CORNER
	const MUSIC_INTRO_BATTLE
	const MUSIC_DUNGEON1
	const MUSIC_DUNGEON2
	const MUSIC_DUNGEON3
	const MUSIC_CINNABAR_MANSION
	const MUSIC_POKEMON_TOWER
	const MUSIC_SILPH_CO
	const MUSIC_MEET_EVIL_TRAINER
	const MUSIC_MEET_FEMALE_TRAINER
	const MUSIC_MEET_MALE_TRAINER
	const MUSIC_DIGDA01
	const MUSIC_FIELD06
	const MUSIC_MEET_JESSIE_JAMES
	const MUSIC_SAKAKI
	const MUSIC_VICTORY4
	const MUSIC_KINCHOU01
	const MUSIC_MEWTWO01
	const MUSIC_LEGENDARYBATTLE
	const MUSIC_GIOVANNIS_ROOM
	const MUSIC_ROCKET_RBY
	const MUSIC_GIOVANNI_BATTLE

	const NUM_SONGS

	const_def

	const SFX_CRY_00
	const SFX_CRY_01
	const SFX_CRY_02
	const SFX_CRY_03
	const SFX_CRY_04
	const SFX_CRY_05
	const SFX_CRY_06
	const SFX_CRY_07
	const SFX_CRY_08
	const SFX_CRY_09
	const SFX_CRY_0A
	const SFX_CRY_0B
	const SFX_CRY_0C
	const SFX_CRY_0D
	const SFX_CRY_0E
	const SFX_CRY_0F
	const SFX_CRY_10
	const SFX_CRY_11
	const SFX_CRY_12
	const SFX_CRY_13
	const SFX_CRY_14
	const SFX_CRY_15
	const SFX_CRY_16
	const SFX_CRY_17
	const SFX_CRY_18
	const SFX_CRY_19
	const SFX_CRY_1A
	const SFX_CRY_1B
	const SFX_CRY_1C
	const SFX_CRY_1D
	const SFX_CRY_1E
	const SFX_CRY_1F
	const SFX_CRY_20
	const SFX_CRY_21
	const SFX_CRY_22
	const SFX_CRY_23
	const SFX_CRY_24
	const SFX_CRY_25

	const_def 1

	; AUDIO_1 AUDIO_3
	const SFX_GET_ITEM_1

	; AUDIO_1 AUDIO_2 AUDIO_3
	const SFX_GET_ITEM_2
	const SFX_TINK
	const SFX_HEAL_HP
	const SFX_HEAL_AILMENT
	const SFX_START_MENU
	const SFX_PRESS_AB

	; AUDIO_1 AUDIO_3
	const SFX_POKEDEX_RATING
	const SFX_GET_KEY_ITEM
	const SFX_POISONED
	const SFX_TRADE_MACHINE
	const SFX_TURN_ON_PC
	const SFX_TURN_OFF_PC
	const SFX_ENTER_PC
	const SFX_SHRINK
	const SFX_SWITCH
	const SFX_HEALING_MACHINE
	const SFX_TELEPORT_EXIT_1
	const SFX_TELEPORT_ENTER_1
	const SFX_TELEPORT_EXIT_2
	const SFX_LEDGE
	const SFX_TELEPORT_ENTER_2
	const SFX_FLY
	const SFX_DENIED
	const SFX_ARROW_TILES
	const SFX_PUSH_BOULDER
	const SFX_SS_ANNE_HORN
	const SFX_WITHDRAW_DEPOSIT
	const SFX_CUT
	const SFX_GO_INSIDE
	const SFX_SWAP
	const SFX_59
	const SFX_PURCHASE
	const SFX_COLLISION
	const SFX_GO_OUTSIDE
	const SFX_SAVE

	; AUDIO_1
	const SFX_POKEFLUTE
	const SFX_SAFARI_ZONE_PA

	; AUDIO_2
	const SFX_LEVEL_UP

	const SFX_BALL_TOSS
	const SFX_BALL_POOF
	const SFX_FAINT_THUD
	const SFX_RUN
	const SFX_DEX_PAGE_ADDED
	const SFX_CAUGHT_MON
	const SFX_PECK
	const SFX_FAINT_FALL
	const SFX_BATTLE_09
	const SFX_POUND
	const SFX_ICE
	const SFX_BATTLE_0B
	const SFX_BATTLE_0C
	const SFX_BATTLE_0D
	const SFX_BATTLE_0E
	const SFX_BATTLE_0F
	const SFX_DAMAGE
	const SFX_NOT_VERY_EFFECTIVE
	const SFX_BATTLE_12
	const SFX_BATTLE_13
	const SFX_BATTLE_14
	const SFX_VINE_WHIP
	const SFX_BATTLE_16
	const SFX_BATTLE_17
	const SFX_BATTLE_18
	const SFX_BATTLE_19
	const SFX_SUPER_EFFECTIVE
	const SFX_BATTLE_1B
	const SFX_BATTLE_1C
	const SFX_DOUBLESLAP
	const SFX_BATTLE_1E
	const SFX_HORN_DRILL
	const SFX_BATTLE_20
	const SFX_BATTLE_21
	const SFX_BATTLE_22
	const SFX_BATTLE_23
	const SFX_BATTLE_24
	const SFX_BATTLE_25
	const SFX_BATTLE_26
	const SFX_BATTLE_27
	const SFX_BATTLE_28
	const SFX_BATTLE_29
	const SFX_BATTLE_2A
	const SFX_BATTLE_2B
	const SFX_BATTLE_2C
	const SFX_PSYBEAM
	const SFX_BATTLE_2E
	const SFX_BATTLE_2F
	const SFX_PSYCHIC_M
	const SFX_BATTLE_31
	const SFX_BATTLE_32
	const SFX_BATTLE_33
	const SFX_BATTLE_34
	const SFX_BATTLE_35
	const SFX_BATTLE_36
	const SFX_BATTLE_37
	const SFX_SILPH_SCOPE

	; AUDIO_3
	const SFX_INTRO_LUNGE
	const SFX_INTRO_HIP
	const SFX_INTRO_HOP
	const SFX_INTRO_RAISE
	const SFX_INTRO_CRASH
	const SFX_INTRO_WHOOSH
	const SFX_SLOTS_STOP_WHEEL
	const SFX_SLOTS_REWARD
	const SFX_SLOTS_NEW_SPIN
	const SFX_SHOOTING_STAR

	const SFX_POKEFLUTE_IN_BATTLE

DEF SFX_STOP_ALL_MUSIC EQU $ff

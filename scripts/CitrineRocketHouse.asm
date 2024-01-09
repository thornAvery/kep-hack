CitrineRocketHouse_Script:
	jp EnableAutoTextBoxDrawing

CitrineRocketHouse_TextPointers:
	dw MartGuy1Text
	dw MartGuy2Text
	dw MartGuy3Text
	dw MartGuy4Text
	dw RocketText1
	dw RocketText2
	dw MeowthText
	dw JamesText
	dw JessieFight

MartGuy1Text:
	script_mart TM_SWORDS_DANCE, TM_WHIRLWIND, TM_TOXIC, TM_BODY_SLAM, TM_DOUBLE_EDGE, TM_BUBBLEBEAM, TM_WATER_GUN, TM_ICE_BEAM, TM_BLIZZARD, TM_HYPER_BEAM, TM_PAY_DAY, TM_COUNTER, TM_SEISMIC_TOSS, TM_RAGE

MartGuy2Text:
	script_mart TM_MEGA_DRAIN, TM_SOLARBEAM, TM_DRAGON_RAGE, TM_THUNDERBOLT, TM_THUNDER, TM_EARTHQUAKE, TM_FISSURE, TM_DIG, TM_PSYCHIC_M, TM_TELEPORT, TM_MIMIC, TM_BIDE, TM_METRONOME, TM_SELFDESTRUCT

MartGuy3Text:
	script_mart TM_FIRE_BLAST, TM_SWIFT, TM_SKULL_BASH, TM_SOFTBOILED, TM_DREAM_EATER, TM_SKY_ATTACK, TM_REST, TM_THUNDER_WAVE, TM_PSYWAVE, TM_EXPLOSION, TM_ROCK_SLIDE, TM_TRI_ATTACK, TM_SUBSTITUTE

MartGuy4Text:
	script_mart PROTECTOR, UP_GRADE, DUBIOUS_DISC, METAL_COAT, BLK_AUGURITE, DOME_FOSSIL, HELIX_FOSSIL, WING_FOSSIL, OLD_AMBER

RocketText1:
	text_far _RocketText1
	text_end

RocketText2:
	text_far _RocketText2
	text_end

MeowthText:
	text_far _MeowthText
	text_asm
	ld a, MEOWTH
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

; James serves as our "Mr. Hyper". In the anime, it's revealed he collects Bottle Caps,
; so I think this is fitting.
JamesText:
	text_asm
	call SaveScreenTilesToBuffer2 ; It really doesn't need to be done this early, it just helps.
	
	ld b, BOTTLE_CAP ; Check bag for Bottle Caps. We only need one for this.
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	jr z, .NoBottleCap ; If zero, James just moans as normal.
	
	ld hl, JamesSeesBottleCap ; Otherwise, he perks up.
	call PrintText
	
	call YesNoChoice ; Yes/No Prompt
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	; Proceed from here as Yes is stated. 
	
	; Here, the party menu pops up and the player picks a Pokemon to juice.
	xor a
	ld [wUpdateSpritesEnabled], a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	pop af
	jr c, .refused
	
	; DV increasing process.
	; Thanks to Vimescarrot for giving me pointers on this!
	ld a, [wWhichPokemon] ; Find the Pokemon's position in party.
	ld hl, wPartyMon1DVs ; Load DVs into hl
	
	ld bc, wPartyMon2 - wPartyMon1 ; This gets to the right slot for DVs
	call AddNTimes ; Gets us there
	; check if already maxed
	ld b, h ; store beginning address
	ld c, l
	ld a, [hli] ; Attack + Defence
	cp a, %11111111
	jr nz, .train ; at least one stat isnt maxed
	ld a, [hl] ; Speed + Special
	cp a, %11111111
	jr z, .alreadyTrained ; all stats were maxed
.train
	ld h, b ; restore address
	ld l, c
	ld a, %11111111 ; Load FFFF FFFF, perfect 15s
	ld [hli], a ; Attack + Defence
	ld [hl], a ; Speed + Special
	; And we're done!
	
	; Currently this doesn't automatically change the stats because it's fucking insane
	ld hl, JamesDone
	call PrintText
	
	; Bottle Cap removal service
	ld hl, BottleCapList
.loop
	ld a, [hli]
	ldh [hItemToRemoveID], a
	and a
	ret z
	push hl
	ld b, a
	call IsItemInBag
	pop hl
	jr z, .loop
	farcall RemoveItemByID
	jr .done
.NoBottleCap
	ld hl, JamesNoCap
	call PrintText
	jr .done
.alreadyTrained
	ld hl, JamesAlreadyTrained
	call PrintText
	jr .done
.refused
	ld hl, JamesNo
	call PrintText
.done
	jp TextScriptEnd

BottleCapList:
	db BOTTLE_CAP
	;db GOLD_BOTTLE_CAP maybe one day
	db 0 ; end

JessieText1:
	text_far _JessieText1
	text_end

JessieFight:
	text_asm
	ld c, 0 ; BANK(Music_MeetJessieJames)
	ld a, MUSIC_MEET_JESSIE_JAMES
	call PlayMusic
	
	ld hl, JessieText1
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused

	ld hl, JessieFightText
	call PrintText
	
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	call Delay3
	ld a, OPP_JESSIE_JAMES
	ld [wCurOpponent], a
	ld a, 5
	ld [wTrainerNo], a
	ld [wIsTrainerBattle], a
	ld a, $5
	ld [wCitrineRocketHouseCurScript], a
	ld hl, JessieLoseText
	ld de, JessieWinText
	call SaveEndBattleTextPointers
	jp TextScriptEnd
	jr .done
 .refused
	 ld hl, JessieText2
	 jr .done
 .done
	ld hl, JessieAfterBattleText
	call PrintText
	ld c, 0 ; BANK(Music_Dungeon2)
	ld a, MUSIC_DUNGEON1
	call PlayMusic
	jp TextScriptEnd

JessieFightText:
	text_far _JessieFightText
	text_end

JessieWinText:
	text_far _JessieWinText
	text_end

JessieLoseText:
	text_far _JessieLoseText
	text_end

JessieText2:
	text_far _JessieText2
	text_end

JessieAfterBattleText:
	text_far _JessieAfterBattleText
	text_end

JamesNoCap:
	text_far _JamesText
	text_end

JamesSeesBottleCap:
	text_far _JamesSeesBottleCap
	text_end

JamesYes:
	text_far _JamesYes
	text_end

JamesNo:
	text_far _JamesNo
	text_end

JamesDone:
	text_far _JamesDone
	text_end

JamesAlreadyTrained:
	text "That #MON is"
	line "strong enough"
	cont "already!"
	done
	text_end

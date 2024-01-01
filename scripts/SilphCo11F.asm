SilphCo11F_Script:
	call SilphCo11Script_62127
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo11TrainerHeaders
	ld de, SilphCo11F_ScriptPointers
	ld a, [wSilphCo11FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo11FCurScript], a
	ret

SilphCo11Script_62127:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo11GateCoords
	call SilphCo11Script_6214f
	call SilphCo11Script_6217b
	CheckEvent EVENT_SILPH_CO_11_UNLOCKED_DOOR
	ret nz
	ld a, $20
	ld [wNewTileBlockID], a
	lb bc, 6, 3
	predef ReplaceTileBlock
	ret

SilphCo11GateCoords:
	dbmapcoord  3,  6
	db -1 ; end

SilphCo11Script_6214f:
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ldh [hUnlockedSilphCoDoors], a
	pop hl
.asm_62143
	ld a, [hli]
	cp $ff
	jr z, .asm_6215f
	push hl
	ld hl, hUnlockedSilphCoDoors
	inc [hl]
	pop hl
	cp b
	jr z, .asm_62154
	inc hl
	jr .asm_62143
.asm_62154
	ld a, [hli]
	cp c
	jr nz, .asm_62143
	ld hl, wCardKeyDoorY
	xor a
	ld [hli], a
	ld [hl], a
	ret
.asm_6215f
	xor a
	ldh [hUnlockedSilphCoDoors], a
	ret

SilphCo11Script_6217b:
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	SetEvent EVENT_SILPH_CO_11_UNLOCKED_DOOR
	ld a, $7
	ldh [hSpriteIndex], a ; TODO: Make Omega look at the player.
	call MoveOmegaSprite
	ld a, OMEGADGE
	ld [wcf91], a
	call PlayCry
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ld c, 0 ; BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	call PlayMusic
	;add code here to make Rocket NPC look at Omega
	ld a, 15
	ld [wSilphCo11FCurScript], a
	ret
	
SilphCo11ScriptOmegaBattle:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld [wJoyIgnore], a
	ld a, 11
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, OMEGADGE
	ld [wCurOpponent], a
	ld a, 40
	ld [wCurEnemyLVL], a
	ld a, 0
	ld [wIsTrainerBattle], a
	ld a, HS_OMEGA
	ld [wMissableObjectIndex], a
	predef HideObject
	call UpdateSprites
	ld a, $2
	ld [wSilphCo11FCurScript], a
	ld [wCurMapScript], a
	ret

OmegaMovementData:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

MoveOmegaSprite:
	ld de, OmegaMovementData
	call MoveSprite
	ld a, SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	jp SetSpriteFacingDirectionAndDelay
	ret

SilphCo11Script_6216d:
	ld hl, MissableObjectIDs_6219b
.asm_62170
	ld a, [hli]
	cp $ff
	jr z, .asm_62181
	push hl
	ld [wMissableObjectIndex], a
	predef HideObject
	pop hl
	jr .asm_62170
.asm_62181
	ld hl, MissableObjectIDs_62194
.asm_62184
	ld a, [hli]
	cp -1
	ret z
	push hl
	ld [wMissableObjectIndex], a
	predef ShowObject
	pop hl
	jr .asm_62184

MissableObjectIDs_62194:
	db HS_SAFFRON_CITY_8
	db HS_SAFFRON_CITY_9
	db HS_SAFFRON_CITY_A
	db HS_SAFFRON_CITY_B
	db HS_SAFFRON_CITY_C
	db HS_SAFFRON_CITY_F
	db -1 ; end

MissableObjectIDs_6219b:
	db HS_SAFFRON_CITY_1
	db HS_SAFFRON_CITY_2
	db HS_SAFFRON_CITY_3
	db HS_SAFFRON_CITY_4
	db HS_SAFFRON_CITY_5
	db HS_SAFFRON_CITY_6
	db HS_SAFFRON_CITY_7
	db HS_SAFFRON_CITY_D
	db HS_SAFFRON_CITY_E
	db HS_SILPH_CO_3F_1
	db HS_SILPH_CO_3F_2
	db HS_SILPH_CO_5F_1
	db HS_SILPH_CO_5F_2
	db HS_SILPH_CO_5F_3
	db HS_SILPH_CO_5F_4
	db HS_SILPH_CO_7F_1
	db HS_SILPH_CO_7F_2
	db HS_SILPH_CO_7F_3
	db HS_SILPH_CO_7F_4
	db -1 ; end

SilphCo11Script_62185:
	xor a
	ld [wJoyIgnore], a
SilphCo11Script_62189:
	ld [wSilphCo11FCurScript], a
	ld [wCurMapScript], a
	ret

SilphCo11F_ScriptPointers:
	dw SilphCo11Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw SilphCo11Script3
	dw SilphCo11Script4
	dw SilphCo11Script5
	dw SilphCo11Script6
	dw SilphCo11Script7
	dw SilphCo11Script8
	dw SilphCo11Script9
	dw SilphCo11Script10
	dw SilphCo11Script11
	dw SilphCo11Script12
	dw SilphCo11Script13
	dw SilphCo11Script14
	dw SilphCo11ScriptOmegaBattle

SilphCo11Script0:
IF DEF(_DEBUG)
	call DebugPressedOrHeldB
	ret nz
ENDC
	CheckEvent EVENT_BEAT_SILPH_CO_11F_TRAINER_0
	call z, SilphCo11Script_6229c
	CheckEvent EVENT_782
	ret nz
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	call z, SilphCo11Script_621c5
	ret

SilphCo11Script_621c5:
	ld hl, CoordsData_62211
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	ld a, [wCoordIndex]
	ld [wcf0d], a
	xor a
	ldh [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld c, 0 ; BANK(Music_Sakaki)
	ld a, MUSIC_SAKAKI
	call PlayMusic
	ld a, $3
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $3
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld de, MovementData_62216
	call MoveSprite
	ld a, $4
	call SilphCo11Script_62189
	ret

CoordsData_62211:
	dbmapcoord  6, 13
	dbmapcoord  7, 12
	db -1 ; end

MovementData_62216:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

SilphCo11Script_621ff:
	ld [wPlayerMovingDirection], a
	ld a, b
	ld [wSprite03StateData1FacingDirection], a
	ld a, $2
	ld [wSprite03StateData1MovementStatus], a
	ret

SilphCo11Script3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, SilphCo11Script_62185
	ld a, [wcf0d]
	cp $1
	jr z, .asm_6223c
	ld a, PLAYER_DIR_LEFT
	ld b, SPRITE_FACING_RIGHT
	jr .asm_62240
.asm_6223c
	ld a, PLAYER_DIR_UP
	ld b, SPRITE_FACING_DOWN
.asm_62240
	call SilphCo11Script_621ff
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, 13
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	call GBFadeOutToBlack
	call SaffronCityHideRocketsShowCitizens
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	SetEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	xor a
	ld [wJoyIgnore], a
	jp SilphCo11Script_62189

SilphCo11Script4:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, $3
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld a, [wcf0d]
	cp $1
	jr z, .asm_62284
	ld a, PLAYER_DIR_LEFT
	ld b, SPRITE_FACING_RIGHT
	jr .asm_62288
.asm_62284
	ld a, PLAYER_DIR_UP
	ld b, SPRITE_FACING_DOWN
.asm_62288
	call SilphCo11Script_621ff
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, SilphCo10Text_62528
	ld de, SilphCo10Text_62528
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $3
	jp SilphCo11Script_62189

SilphCo11Script_6229c:
	ld a, [wYCoord]
	cp $3
	ret nz
	ld a, [wXCoord]
	cp $4
	ret nc
	ResetEvents EVENT_780, EVENT_781
	ld a, [wXCoord]
	cp $3
	jr z, .asm_622c3
	SetEventReuseHL EVENT_780
	ld a, [wXCoord]
	cp $2
	jr z, .asm_622c3
	ResetEventReuseHL EVENT_780
	SetEventReuseHL EVENT_781
.asm_622c3
	call StopMusic
	ld c, 0 ; BANK(Music_MeetJessieJames)
	ld a, MUSIC_MEET_JESSIE_JAMES
	call PlayMusic
	xor a
	ldh [hJoyHeld], a
	ld a, $fc
	ld [wJoyIgnore], a
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, 4
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, $ff
	ld [wJoyIgnore], a
	SetEvent EVENT_782
	ld a, $5
	call SilphCo11Script_62189
	ret

SilphCo11MovementData_622f5:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1

SilphCo11MovementData_622fb:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1

SilphCo11MovementData_62300:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1

SilphCo11MovementData_62305:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1

SilphCo11MovementData_6230b:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1

SilphCo11MovementData_62311:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1

SilphCo11Script5:
	ld de, SilphCo11MovementData_622f5
	CheckEitherEventSet EVENT_780, EVENT_781
	and a
	jr z, .asm_6232d
	ld de, SilphCo11MovementData_62300
	cp $1
	jr z, .asm_6232d
	ld de, SilphCo11MovementData_6230b
.asm_6232d
	ld a, $4
	ldh [hSpriteIndexOrTextID], a
	call MoveSprite
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $6
	call SilphCo11Script_62189
	ret

SilphCo11Script6:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wd730]
	bit 0, a
	ret nz
SilphCo11Script7:
	ld a, $2
	ld [wSprite04StateData1MovementStatus], a
	ld hl, wSprite04StateData1FacingDirection
	ld [hl], SPRITE_FACING_RIGHT
	CheckEitherEventSet EVENT_780, EVENT_781
	and a
	jr z, .asm_6235e
	ld [hl], SPRITE_FACING_UP
.asm_6235e
	call Delay3
	ld a, $fc
	ld [wJoyIgnore], a
SilphCo11Script8:
	ld de, SilphCo11MovementData_622fb
	CheckEitherEventSet EVENT_780, EVENT_781
	and a
	jr z, .asm_6237b
	ld de, SilphCo11MovementData_62305
	cp $1
	jr z, .asm_6237b
	ld de, SilphCo11MovementData_62311
.asm_6237b
	ld a, $6
	ldh [hSpriteIndexOrTextID], a
	call MoveSprite
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $9
	call SilphCo11Script_62189
	ret

SilphCo11Script9:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, $fc
	ld [wJoyIgnore], a
SilphCo11Script10:
	ld a, $2
	ld [wSprite06StateData1MovementStatus], a
	ld hl, wSprite06StateData1FacingDirection
	ld [hl], SPRITE_FACING_UP
	CheckEitherEventSet EVENT_780, EVENT_781
	and a
	jr z, .asm_623b1
	ld [hl], SPRITE_FACING_LEFT
.asm_623b1
	call Delay3
	ld a, $9
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
SilphCo11Script11:
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	call Delay3
	ld hl, SilphCo11Text_624c2
	ld de, SilphCo11Text_624c2
	call SaveEndBattleTextPointers
	ld a, OPP_JESSIE_JAMES
	ld [wCurOpponent], a
	ld a, 4
	ld [wTrainerNo], a
	ld [wIsTrainerBattle], a
	xor a
	ldh [hJoyHeld], a
	ld [wJoyIgnore], a
	ld a, $c
	call SilphCo11Script_62189
	ret

SilphCo11Script12:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wIsInBattle]
	cp $ff
	jp z, SilphCo11Script_62185
	ld a, $2
	ld [wSprite04StateData1MovementStatus], a
	ld [wSprite06StateData1MovementStatus], a
	xor a
	ld [wSprite04StateData1FacingDirection], a
	ld [wSprite06StateData1FacingDirection], a
	ld a, $fc
	ld [wJoyIgnore], a
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, $a
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call StopMusic
	ld c, 0 ; BANK(Music_MeetJessieJames)
	ld a, MUSIC_MEET_JESSIE_JAMES
	call PlayMusic
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $d
	call SilphCo11Script_62189
	ret

SilphCo11Script13:
	ld a, $ff
	ld [wJoyIgnore], a
	call GBFadeOutToBlack
	ld a, HS_SILPH_CO_11F_JAMES
	call SilphCo11Script_6246d
	ld a, HS_SILPH_CO_11F_JESSIE
	call SilphCo11Script_6246d
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	ld a, $e
	call SilphCo11Script_62189
	ret

SilphCo11Script14:
	call PlayDefaultMusic
	xor a
	ldh [hJoyHeld], a
	ld [wJoyIgnore], a
	ResetEvent EVENT_782
	SetEventReuseHL EVENT_BEAT_SILPH_CO_11F_TRAINER_0
	ld a, $0
	call SilphCo11Script_62189
	ret

SilphCo11Script_6245e:
	ld [wMissableObjectIndex], a
	predef ShowObject
	call UpdateSprites
	call Delay3
	ret

SilphCo11Script_6246d:
	ld [wMissableObjectIndex], a
	predef HideObject
	ret

SaffronCityHideRocketsShowCitizens:
	ld hl, SaffronCityRockets
.hideLoop
	ld a, [hli]
	cp $ff ; have we run out of rockets to hide?
	jr z, .showCitizens ; if so, start showing the citizens
	push hl
	ld [wMissableObjectIndex], a
	predef HideObject
	pop hl
	jr .hideLoop

.showCitizens
	ld hl, SaffronCityCitizens
.showLoop
	ld a, [hli]
	cp $ff ; have we run out of citizens to show?
	ret z ; if so, we're done here
	push hl
	ld [wMissableObjectIndex], a
	predef ShowObject
	pop hl
	jr .showLoop

SaffronCityCitizens:
	db HS_SAFFRON_CITY_8
	db HS_SAFFRON_CITY_9
	db HS_SAFFRON_CITY_A
	db HS_SAFFRON_CITY_B
	db HS_SAFFRON_CITY_C
	db HS_SAFFRON_CITY_F
	db HS_SILPH_CO_1F_RECEPTIONIST
	db -1 ; end

SaffronCityRockets:
	db HS_SAFFRON_CITY_1
	db HS_SAFFRON_CITY_2
	db HS_SAFFRON_CITY_3
	db HS_SAFFRON_CITY_4
	db HS_SAFFRON_CITY_5
	db HS_SAFFRON_CITY_6
	db HS_SAFFRON_CITY_7
	db HS_SAFFRON_CITY_D
	db HS_SAFFRON_CITY_E
	db HS_SILPH_CO_3F_1
	db HS_SILPH_CO_3F_2
	db HS_SILPH_CO_5F_1
	db HS_SILPH_CO_5F_2
	db HS_SILPH_CO_5F_3
	db HS_SILPH_CO_5F_4
	db HS_SILPH_CO_7F_1
	db HS_SILPH_CO_7F_2
	db HS_SILPH_CO_7F_3
	db HS_SILPH_CO_7F_4
	db HS_SILPH_CO_11F_1
	db HS_SILPH_CO_11F_3
	db -1 ; end

SilphCo11F_TextPointers:
	dw SilphCo11Text1
	dw SilphCo11Text2
	dw SilphCo11Text3
	dw SilphCo11Text4
	dw SilphCo11Text5
	dw SilphCo11Text6
	dw SilphCo11Text7
	dw SilphCo11Text8
	dw SilphCo11Text9
	dw SilphCo11Text10
	dw OmegaText
	dw Omega2Text
	dw StupidGiovanniFix
	dw SilphCo11FPorygonText

SilphCo11TrainerHeaders:
	def_trainers 5
SilphCo11TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_11F_TRAINER_1, 1, SilphCo11Trainer1BattleText, SilphCo11Trainer1EndBattleText, SilphCo11Trainer1AfterBattleText
Omega2TrainerHeader:
	trainer EVENT_BEAT_OMEGA, 0, Omega2BattleText, Omega2BattleText, Omega2BattleText	
	db -1 ; end

SilphCo11Text4:
SilphCo11Text6:
SilphCo11Text8:
	text_far _SilphCoJessieJamesText1
	text_asm
	ld c, 10
	call DelayFrames
	ld a, $4
	ld [wPlayerMovingDirection], a
	ld a, $0
	ld [wEmotionBubbleSpriteIndex], a
	ld a, EXCLAMATION_BUBBLE
	ld [wWhichEmotionBubble], a
	predef EmotionBubble
	ld c, 20
	call DelayFrames
	jp TextScriptEnd

SilphCo11Text9:
	text_far _SilphCoJessieJamesText2
	text_end

SilphCo11Text_624c2:
	text_far _SilphCoJessieJamesText3
	text_end

SilphCo11Text10:
	text_far _SilphCoJessieJamesText4
	text_asm
	ld c, 64
	call DelayFrames
	jp TextScriptEnd

SilphCo11Text1:
	text_asm
	CheckEvent EVENT_GOT_MASTER_BALL
	jp nz, .got_item
	ld hl, SilphCoPresidentText
	call PrintText
	lb bc, MASTER_BALL, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedSilphCoMasterBallText
	call PrintText
	SetEvent EVENT_GOT_MASTER_BALL
	jr .done
.bag_full
	ld hl, SilphCoMasterBallNoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, SilphCo10Text_6231c
	call PrintText
.done
	jp TextScriptEnd

SilphCoPresidentText:
	text_far _SilphCoPresidentText
	text_end

ReceivedSilphCoMasterBallText:
	text_far _ReceivedSilphCoMasterBallText
	sound_get_key_item
	text_end

SilphCo10Text_6231c:
	text_far _SilphCo10Text_6231c
	text_end

SilphCoMasterBallNoRoomText:
	text_far _SilphCoMasterBallNoRoomText
	text_end

SilphCo11Text2:
	text_far _SilphCo11Text2
	text_end

SilphCo11Text3:
	text_far _SilphCo11Text3
	text_end

SilphCo10Text_62528:
	text_far _SilphCo10Text_62330
	text_end

SilphCo11Text7:
	text_far _SilphCo10Text_62335
	text_end

SilphCo11Text5:
	text_asm
	ld hl, SilphCo11TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo11Trainer1BattleText:
	text_far _SilphCo11BattleText2
	text_end

SilphCo11Trainer1EndBattleText:
	text_far _SilphCo11EndBattleText2
	text_end

SilphCo11Trainer1AfterBattleText:
	text_far _SilphCo11AfterBattleText2
	text_end

; Omega Boss Fight text begins here.
OmegaText:
	text_far _OmegaBattleText
	text_end

OmegaBattleText:
	text_far _OmegaBattleText
	text_asm
	ld a, OMEGADGE
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

Omega2Text:
	text_asm
	ld hl, Omega2TrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

Omega2BattleText:
	text_far _OmegaBattleText
	text_asm
	ld a, OMEGADGE
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

StupidGiovanniFix:
	text_far _SilphCo10Text_62335
	text_end

SilphCo11FPorygonText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, PORYGON
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text_far _SilphCo11FPorygonText
	text_end

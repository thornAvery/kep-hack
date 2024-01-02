Route1_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route1_ScriptPointers
	ld a, [wRoute1CurScript]
	jp CallFunctionInTable

Route1_ScriptPointers:
	dw Route1Script0
	dw OakVibeCheck

Route1Script0:
	ret ; yeah it's just a switch-off. shush.

OakVibeCheck:
;joenote - Notice how there is no check to see if the player actually lost.
;Let's go ahead and add that real quick.
	ld a, [wIsInBattle]	;if wIsInBattle is -1, then the battle was lost
	inc a	;if A holds -1, it will increment to 0 and set the z flag (but not the c flag, dec and inc cannot affect it).
	jr z, .skip	;Kick out if the player lost.

	SetEvent EVENT_BEAT_OAK_ONCE ; This is set every time, but it doesn't matter, it sticks at 1 anyway.
	CheckEvent EVENT_RECEIVED_CITRINE_PASS ; Before we do, has the player got the pass?
	jr nz, .skip ; Yes? Now we go to auto-ret. 
	jr OakFirstWin ; Otherwise, move to the first win script to set that up.
.skip
	ld a, $0
	ld [wRoute1CurScript], a
	ld [wCurMapScript], a	;joenote - also set the value for current map script or you will have a bad time
	ret

OakFirstWin:
	CheckEvent EVENT_RECEIVED_CITRINE_PASS
	jr nz, .skip
	ld a, $3
	ldh [hSpriteIndex], a
	call DisplayTextID
.skip
	ld a, $0
	ld [wRoute1CurScript], a
	ld [wCurMapScript], a	;joenote - also set the value for current map script or you will have a bad time
	ret

Route1_TextPointers:
	dw Route1Text1
	dw Route1Text2
	dw Route1OakText
	dw Route1Text3

Route1Text1:
	text_asm
	CheckAndSetEvent EVENT_GOT_POTION_SAMPLE
	jr nz, .got_item
	ld hl, Route1ViridianMartSampleText
	call PrintText
	lb bc, POTION, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, Route1Text_1cae8
	jr .done
.bag_full
	ld hl, Route1Text_1caf3
	jr .done
.got_item
	ld hl, Route1Text_1caee
.done
	call PrintText
	jp TextScriptEnd

Route1ViridianMartSampleText:
	text_far _Route1ViridianMartSampleText
	text_end

Route1Text_1cae8:
	text_far _Route1Text_1cae8
	sound_get_item_1
	text_end

Route1Text_1caee:
	text_far _Route1Text_1caee
	text_end

Route1Text_1caf3:
	text_far _Route1Text_1caf3
	text_end

Route1Text2:
	text_far _Route1Text2
	text_end

Route1Text3:
	text_far _Route1Text3
	text_end

; oak stuff begins here

; text
Route1OakText:
	text_asm
	CheckEvent EVENT_BEAT_OAK_ONCE ; But if they've not beaten Oak, we need something else.
	jr z, .skip ; So if they have, skip the next command.
	CheckEvent EVENT_RECEIVED_CITRINE_PASS ; This is used for DisplayTextID. Is checked when Oak has been beaten once.
	jp z, OakReceivePass
.skip
	CheckEvent EVENT_BEAT_OAK_ONCE ; I am like, 99.9% sure there's another way to do this.
	ld hl, OakFirstBattleText ; Load this only if the Citrine Pass hasn't been obtained yet.
	jr z, .skip2
	ld hl, OakBeforeBattleText ; If he's been beaten before, load the usual prebattle text
.skip2
	call PrintText

	call YesNoChoice ; Do they want in?
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	
	ld hl, OakYes
	call PrintText
	ld c, BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	call PlayMusic
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	
	call Delay3
	ld a, OPP_PROF_OAK
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wRivalStarter]
	cp STARTER2
	jr nz, .NotSquirtle 
	ld a, $2 ; If Charmander, Venusaur
	jr .battleSetup
.NotSquirtle
	cp STARTER3
	jr nz, .Charmander
	ld a, $3 ; If Bulbasaur, Totartle
	jr .battleSetup
.Charmander
	cp STARTER1
	jr nz, .Pikachu
	ld a, $1 ; If Squirtle, Charizard
	jr .battleSetup
.Pikachu
	cp STARTER4
	jr nz, .Eevee
	ld a, $4 ; If Pikachu, all 3
	jr .battleSetup
.Eevee
	ld a, $5 ; If Eevee, also all 3
	jr .battleSetup
.refused
	ld hl, OakNo
	call PrintText
	jr .done
.battleSetup
	ld [wTrainerNo], a
	ld a, 1
	ld [wIsTrainerBattle], a
	
	ld hl, OakDefeatedText
	ld de, OakWonText
	call SaveEndBattleTextPointers

	ld a, $1
	ld [wRoute1CurScript], a
	ld [wCurMapScript], a	;joenote - also set the value for current map script or you will have a bad time
.done
	jp TextScriptEnd

OakReceivePass:
	CheckEvent EVENT_FUCK ; This is for if the player is stupid
	jp nz, .tryAgain
	ld hl, OakFirstWinText
	call PrintText
	lb bc, CITRINE_PASS, 1
	call GiveItem
	jr nc, .bagFull
	jr .getPass
.tryAgain
	ld hl, OakTryAgain
	call PrintText
	lb bc, CITRINE_PASS, 1
	call GiveItem
	jr nc, .bagStillFull
	jr .getPass
.bagFull
	ld hl, OakBagFull
	call PrintText
	SetEvent EVENT_FUCK
	jr .done
.bagStillFull
	ld hl, OakBagStillFull
	call PrintText
	jr .done
.getPass
	ld hl, ReceivedCitrinePassText
	call PrintText
	ld a, [wSimulatedJoypadStatesEnd] ; ensuring that the text doesn't autoskip.
	and a ; yep, here too.
	call z, WaitForTextScrollButtonPress ; and here.
	call EnableAutoTextBoxDrawing ; and here.
	ld hl, OakCitrineExplain
	call PrintText
	SetEvent EVENT_RECEIVED_CITRINE_PASS
	; fallthrough
.done
	jp TextScriptEnd

OakBeforeBattleText:
	text_far _OakBeforeBattleText
	text_end

OakDefeatedText:
	text_far _OakDefeatedText
	text_end

OakWonText:
	text_far _OakWonText
	text_end

OakYes:
	text_far _OakYes
	text_end

OakNo:
	text_far _OakNo
	text_end

OakFirstBattleText:
	text_far _OakFirstBattleText
	text_end

OakFirstWinText:
	text_far _OakFirstWin
	text_end

ReceivedCitrinePassText:
	text_far _ReceivedCitrinePassText
	sound_get_item_2
	text_end

OakCitrineExplain:
	text_far _OakCitrineExplain
	text_end

OakTryAgain:
	text_far _OakTryAgain
	text_end

OakBagFull:
	text_far _OakBagFull
	text_end

OakBagStillFull:
	text_far _OakBagStillFull
	text_end

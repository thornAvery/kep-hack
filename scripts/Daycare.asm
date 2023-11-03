Daycare_Script:
	jp EnableAutoTextBoxDrawing

Daycare_TextPointers:
	dw DayCareMText1
	dw DaycareMelanie
	dw DaycareBulbasaur
	dw DaycareOddish
	dw DaycareSandshrew
	dw DaycareRibbito
	dw DaycareBook

DayCareMText1:
	text_asm
	call SaveScreenTilesToBuffer2
	ld a, [wDayCareInUse]
	and a
	jp nz, .daycareInUse
	ld hl, DayCareIntroText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, DayCareComeAgainText
	jp nz, .done
	ld a, [wPartyCount]
	dec a
	ld hl, DayCareOnlyHaveOneMonText
	jp z, .done
	ld hl, DayCareWhichMonText
	call PrintText
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
	ld hl, DayCareAllRightThenText
	jp c, .done
	callfar KnowsHMMove
	ld hl, DayCareCantAcceptMonWithHMText
	jp c, .done
	xor a
	ld [wPartyAndBillsPCSavedMenuItem], a
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, DayCareWillLookAfterMonText
	call PrintText
	ld a, 1
	ld [wDayCareInUse], a
	ld a, PARTY_TO_DAYCARE
	ld [wMoveMonType], a
	call MoveMon
	xor a
	ld [wRemoveMonFromBox], a
	call RemovePokemon
	ld a, [wcf91]
	call PlayCry
	ld hl, DayCareComeSeeMeInAWhileText
	jp .done

.daycareInUse
	xor a
	ld hl, wDayCareMonName
	call GetPartyMonName
	ld a, DAYCARE_DATA
	ld [wMonDataLocation], a
	call LoadMonData
	callfar CalcLevelFromExperience
	ld a, d
	cp MAX_LEVEL
	jr c, .skipCalcExp

	ld d, MAX_LEVEL
	callfar CalcExperience
	ld hl, wDayCareMonExp
	ldh a, [hExperience]
	ld [hli], a
	ldh a, [hExperience + 1]
	ld [hli], a
	ldh a, [hExperience + 2]
	ld [hl], a
	ld d, MAX_LEVEL

.skipCalcExp
	xor a
	ld [wDayCareNumLevelsGrown], a
	ld hl, wDayCareMonBoxLevel
	ld a, [hl]
	ld [wDayCareStartLevel], a
	cp d
	ld [hl], d
	ld hl, DayCareMonNeedsMoreTimeText
	jr z, .next
	ld a, [wDayCareStartLevel]
	ld b, a
	ld a, d
	sub b
	ld [wDayCareNumLevelsGrown], a
	ld hl, DayCareMonHasGrownText

.next
	call PrintText
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	ld hl, DayCareNoRoomForMonText
	jp z, .leaveMonInDayCare
	ld de, wDayCareTotalCost
	xor a
	ld [de], a
	inc de
	ld [de], a
	ld hl, wDayCarePerLevelCost
	ld a, $1
	ld [hli], a
	ld [hl], $0
	ld a, [wDayCareNumLevelsGrown]
	inc a
	ld b, a
	ld c, 2
.calcPriceLoop
	push hl
	push de
	push bc
	predef AddBCDPredef
	pop bc
	pop de
	pop hl
	dec b
	jr nz, .calcPriceLoop
	ld hl, DayCareOweMoneyText
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld hl, DayCareAllRightThenText
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .leaveMonInDayCare
	ld hl, wDayCareTotalCost
	ldh [hMoney], a
	ld a, [hli]
	ldh [hMoney + 1], a
	ld a, [hl]
	ldh [hMoney + 2], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, DayCareNotEnoughMoneyText
	jp .leaveMonInDayCare

.enoughMoney
	xor a
	ld [wDayCareInUse], a
	ld hl, wDayCareNumLevelsGrown
	ld [hli], a
	inc hl
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, DayCareHeresYourMonText
	call PrintText
	ld a, DAYCARE_TO_PARTY
	ld [wMoveMonType], a
	call MoveMon
	ld a, [wDayCareMonSpecies]
	ld [wcf91], a
	ld a, [wPartyCount]
	dec a
	push af
	ld bc, wPartyMon2 - wPartyMon1
	push bc
	ld hl, wPartyMon1Moves
	call AddNTimes
	ld d, h
	ld e, l
	ld a, 1
	ld [wLearningMovesFromDayCare], a
	predef WriteMonMoves
	pop bc
	pop af

; set mon's HP to max
	ld hl, wPartyMon1HP
	call AddNTimes
	ld d, h
	ld e, l
	ld bc, wPartyMon1MaxHP - wPartyMon1HP
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

	ld a, [wcf91]
	call PlayCry
	ld hl, DayCareGotMonBackText
	jr .done

.leaveMonInDayCare
	ld a, [wDayCareStartLevel]
	ld [wDayCareMonBoxLevel], a

.done
	call PrintText
	jp TextScriptEnd

DayCareIntroText:
	text_far _DayCareIntroText
	text_end

DayCareWhichMonText:
	text_far _DayCareWhichMonText
	text_end

DayCareWillLookAfterMonText:
	text_far _DayCareWillLookAfterMonText
	text_end

DayCareComeSeeMeInAWhileText:
	text_far _DayCareComeSeeMeInAWhileText
	text_end

DayCareMonHasGrownText:
	text_far _DayCareMonHasGrownText
	text_end

DayCareOweMoneyText:
	text_far _DayCareOweMoneyText
	text_end

DayCareGotMonBackText:
	text_far _DayCareGotMonBackText
	text_end

DayCareMonNeedsMoreTimeText:
	text_far _DayCareMonNeedsMoreTimeText
	text_end

DayCareAllRightThenText:
	text_far _DayCareAllRightThenText
DayCareComeAgainText:
	text_far _DayCareComeAgainText
	text_end

DayCareNoRoomForMonText:
	text_far _DayCareNoRoomForMonText
	text_end

DayCareOnlyHaveOneMonText:
	text_far _DayCareOnlyHaveOneMonText
	text_end

DayCareCantAcceptMonWithHMText:
	text_far _DayCareCantAcceptMonWithHMText
	text_end

DayCareHeresYourMonText:
	text_far _DayCareHeresYourMonText
	text_end

DayCareNotEnoughMoneyText:
	text_far _DayCareNotEnoughMoneyText
	text_end

; This is porting the Yellow Melanie event to Red.
; Because we don't have Pikachu for happiness, the condition is made to be
; the Cascade Badge instead.
; We could hide her entirely with regards to the starter system, it would just
; look super cringe
DaycareMelanie:
	text_asm
	CheckEvent EVENT_GOT_BULBASAUR
	jr nz, .gotBulbasaur

	ld hl, MelanieText1 ; Firstly, important text.
	call PrintText
	ld a, [wSimulatedJoypadStatesEnd] ; ensuring that the text doesn't autoskip.
	and a ; yep, here too.
	call z, WaitForTextScrollButtonPress ; and here.
	call EnableAutoTextBoxDrawing ; and here. it's very hasty.
	
	CheckEvent EVENT_BEAT_MISTY ; Beat Misty?
	jr z, .superDone ; Didn't beat Misty? It's over. It's just over. 
	
	; If they picked any of the main 3 they can't get this.
	ld a, [wPlayerStarter]
	cp STARTER1
	jr z, .notTheOne
	cp STARTER2
	jr z, .notTheOne
	cp STARTER3
	jr z, .notTheOne
	
	ld hl, MelanieText2 ; yes? let's continue, then.
	call PrintText
	
	call YesNoChoice ; let's get things going.
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused ; imagine refusing a bulbasaur tbh
	call SaveScreenTilesToBuffer1 ; prevents nickname screen corruption
	lb bc, BULBASAUR, 14 ; load the bulbasaur
	call GivePokemon ; attempt to give the bulbasaur
	jr nc, .fullParty ; if it's fucked just go here
	ld a, HS_DAYCARE_BULBASAUR ; hide the bulbasaur
	ld [wMissableObjectIndex], a ; badababa
	predef HideObject ; pow
	SetEvent EVENT_GOT_BULBASAUR
	
	ld hl, MelanieText3
	call PrintText
	ld a, [wSimulatedJoypadStatesEnd] ; ensuring that the text doesn't autoskip.
	and a ; yep, here too.
	call z, WaitForTextScrollButtonPress ; and here.
	call EnableAutoTextBoxDrawing ; and here.
	jr .superDone ; anyway tons of textscriptends is cringe so let's do things better this time
.gotBulbasaur ; If they have Bulbasaur, just go here.
	ld hl, MelanieText4
	jr .done
.refused ; If they refused, they're not the one.
	ld hl, MelanieText5
	jr .done
.fullParty ; if they have a full party they can get knotted
	ld hl, MelanieText6
	jr .done
.notTheOne ; If they started with the original trio, they're not the one.
	ld hl, MelanieText7
	; fallthrough
.done
	call PrintText
	; fallthrough
.superDone
	jp TextScriptEnd

DaycareBulbasaur:
	text_far _BulbasaurText
	text_asm
	ld a, BULBASAUR
	call PlayCry
	jp TextScriptEnd

DaycareOddish:
	text_far _OddishText
	text_asm
	ld a, ODDISH
	call PlayCry
	jp TextScriptEnd

DaycareSandshrew:
	text_far _SandshrewText
	text_asm
	ld a, SANDSHREW
	call PlayCry
	jp TextScriptEnd

DaycareRibbito:
	text_far _RibbitoText
	text_asm
	ld a, RIBBITO
	call PlayCry
	jp TextScriptEnd

_RibbitoText:
	text "RIBBITO: Ribbi"
	line "ribbi!"
	done

MelanieText1:
	text_far _MelanieText1
	text_end

MelanieText2:
	text_far _MelanieText2
	text_end

MelanieText3:
	text_far _MelanieText3
	text_end
	
MelanieText4:
	text_far _MelanieText4
	text_end
	
MelanieText5:
	text_far _MelanieText5
	text_end

MelanieText6:
	text_far _MelanieText6
	text_end

MelanieText7:
	text_far _MelanieText7
	text_end

DaycareBook:
	text "It's a drawing of"
	line "a TRAINER with a"
	cont "PIKACHU and an"
	cont "EEVEE!"
	done

BrunswickTrail_Script:
	call EnableAutoTextBoxDrawing
	ld hl, BrunswickTrailTrainerHeaders
	ld de, BrunswickTrail_ScriptPointers
	ld a, [wBrunswickTrailCurScript]
	call ExecuteCurMapScriptInTable
	ld [wBrunswickTrailCurScript], a
	ret

BrunswickTrail_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw HideCactus
	
BrunswickTrail_TextPointers:
	dw FakeTreeEvent
	dw BrunswickTrainer1
	dw BrunswickTrainer2
	dw BrunswickTrainer3
	dw CaveGuy
	dw GZapFound
	dw Lover1
	dw Lover2
	dw PickUpItemText
	dw TrailDirections

BrunswickTrailTrainerHeaders:
	def_trainers
CactusTrainerHeader:
	trainer EVENT_BEAT_CACTUS, 0, CactusBattleText, CactusBattleText, CactusBattleText
BrunswickTrainerHeader0:
	trainer EVENT_BEAT_BRUNSWICK_TRAINER_0, 4, BrunswickBattleText1, BrunswickEndBattleText1, BrunswickAfterBattleText1
BrunswickTrainerHeader1:
	trainer EVENT_BEAT_BRUNSWICK_TRAINER_1, 4, BrunswickBattleText2, BrunswickEndBattleText2, BrunswickAfterBattleText2
BrunswickTrainerHeader2:
	trainer EVENT_BEAT_BRUNSWICK_TRAINER_2, 1, BrunswickBattleText3, BrunswickEndBattleText3, BrunswickAfterBattleText3
	db -1 ; end

Lover1:
	text_far _Lover1
	text_end

Lover2:
	text_far _Lover2
	text_end

BrunswickTrainer1:
	text_asm
	ld hl, BrunswickTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

BrunswickBattleText1:
	text_far _BrunswickBattleText1
	text_end

BrunswickEndBattleText1:
	text_far _BrunswickEndBattleText1
	text_end

BrunswickAfterBattleText1:
	text_far _BrunswickAfterBattleText1
	text_end

BrunswickTrainer2:
	text_asm
	ld hl, BrunswickTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

BrunswickBattleText2:
	text_far _BrunswickBattleText2
	text_end

BrunswickEndBattleText2:
	text_far _BrunswickEndBattleText2
	text_end

BrunswickAfterBattleText2:
	text_far _BrunswickAfterBattleText2
	text_end

BrunswickTrainer3:
	text_asm
	ld hl, BrunswickTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

BrunswickBattleText3:
	text_far _BrunswickBattleText3
	text_end

BrunswickEndBattleText3:
	text_far _BrunswickEndBattleText3
	text_end

BrunswickAfterBattleText3:
	text_far _BrunswickAfterBattleText3
	text_end

CaveGuy:
	text_far _CaveGuy
	text_end

TrailDirections:
	text_far _TrailDirections
	text_end

FakeTreeNoCut: 
	text_far _FakeTreeNoCut
	text_end

FakeTreePrompt:
	text_far _FakeTreePrompt
	text_end

; Ok, so here's how it is.
; I tried to make the text work more efficiently here, but nothing worked.
; One bug literally took me back to the fucking title screen and at that point I gave up.
; I wanted to have some text before the CUT check. It did not work. It was terrifying.
; So instead I have two different versions of the same text, despite some being the same.
; It is inefficient, but it works. There's a lot to see in this life, and I'm not wasting it in Notepad++.
FakeTreeEvent:
	text_asm
;	ld d, CUT
;	farcall HasPartyMove
;	jr z, .NoCut
;	jr nz, .HasCut	
;.HasCut
	ld hl, FakeTreePrompt
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	
	ld a, SFX_CUT
	call PlaySound

	ld hl, CactusTrainerHeader
	call TalkToTrainer
	
;let's try a separate map script as a backup in case cactormous does not disappear like other static wild pokemon.
	ld a, 3
	ld [wBrunswickTrailCurScript], a
	ld [wCurMapScript], a

;	jp TextScriptEnd ; I have tried a lot of things and it's not disappearing AAA
;.NoCut
;	ld hl, FakeTreeNoCut ; Why do you have to be this way? I scream, for I do not know.
;	call PrintText
;	ret
.refused
	jp TextScriptEnd

CactusBattleText:
	text_far _FakeTreeAttack
	text_asm
	ld a, CACTORMUS
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

HideCactus:
;this runs after the cactormous battle to make sure it gets hidden
	ld a, HS_CACTUS
	ld [wMissableObjectIndex], a
	predef HideObject
	call UpdateSprites
	call Delay3
	xor a
	ld [wBrunswickTrailCurScript], a
	ld [wCurMapScript], a
	ret

	
GZapFound:
	text_asm
	ld hl, BirdTextCall
	call PrintText
	ld a, ZAPDOS_G
	call PlayCry
	call WaitForSoundToFinish
	
	ld a, $ff
	ld [wJoyIgnore], a
	call GBFadeOutToBlack
	ld a, SFX_RUN
	call PlaySound
	ld a, HS_BRUNSWICK_ZAPDOS_G_1
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_GLADE_GZAP_1
	ld [wMissableObjectIndex], a
	predef ShowObject
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	ld a, 0
	ld [wJoyIgnore], a
	ld hl, GZapRunText
	call PrintText
	jp TextScriptEnd
	
GZapRunText:
	text "It ran off"
	line "somewhere..."
	done
	text_end

BirdTextCall:
	text_far _BirdBattleText
	text_end


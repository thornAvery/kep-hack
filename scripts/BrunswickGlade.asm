BrunswickGlade_Script:
	call EnableAutoTextBoxDrawing
	ld hl, BrunswickGladeTrainerHeaders
	ld de, BrunswickGlade_ScriptPointers
	ld a, [wBrunswickGladeCurScript]
	call ExecuteCurMapScriptInTable
	ld [wBrunswickGladeCurScript], a
	ret

BrunswickGlade_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

BrunswickGlade_TextPointers:
	dw BrunswickGladeTrainer1
	dw BrunswickGladeTrainer2
	dw BrunswickGladeTrainer3
	dw BrunswickGladeTrainer4
	dw GZapRun1
	dw GZapRun2
	dw GZapRun3
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw BrunswickGladeSign1

BrunswickGladeTrainerHeaders:
	def_trainers
BrunswickGladeTrainerHeader0:
	trainer EVENT_BEAT_BRUNSWICK_GLADE_COOLTRAINER_F, 1, BrunswickGladeBattleText1, BrunswickGladeEndBattleText1, BrunswickGladeAfterBattleText1
BrunswickGladeTrainerHeader1:
	trainer EVENT_BEAT_BRUNSWICK_GLADE_GENTLEMAN, 4, BrunswickGladeBattleText2, BrunswickGladeEndBattleText2, BrunswickGladeAfterBattleText2
BrunswickGladeTrainerHeader2:
	trainer EVENT_BEAT_BRUNSWICK_GLADE_BEAUTY, 4, BrunswickGladeBattleText3, BrunswickGladeEndBattleText3, BrunswickGladeAfterBattleText3
BrunswickGladeTrainerHeader3:
	trainer EVENT_BEAT_BRUNSWICK_GLADE_COOLTRAINER_M, 3, BrunswickGladeBattleText4, BrunswickGladeEndBattleText4, BrunswickGladeAfterBattleText4
	db -1 ; end

GZapRun1:
	text_far _BirdBattleText
	text_asm
	ld a, ZAPDOS_G
	call PlayCry
	call WaitForSoundToFinish
	ld a, $ff
	ld [wJoyIgnore], a
	call GBFadeOutToBlack
	ld a, SFX_RUN
	call PlaySound
	ld a, HS_GLADE_GZAP_1
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_GLADE_GZAP_2
	ld [wMissableObjectIndex], a
	predef ShowObject
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	ld a, 0
	ld [wJoyIgnore], a
	ld hl, GZapGladeRunText
	call PrintText
	jp TextScriptEnd

GZapRun2:
	text_far _BirdBattleText
	text_asm
	ld a, ZAPDOS_G
	call PlayCry
	call WaitForSoundToFinish
	ld a, $ff
	ld [wJoyIgnore], a
	call GBFadeOutToBlack
	ld a, SFX_RUN
	call PlaySound
	ld a, HS_GLADE_GZAP_2
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_GLADE_GZAP_3
	ld [wMissableObjectIndex], a
	predef ShowObject
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	ld a, 0
	ld [wJoyIgnore], a
	ld hl, GZapGladeRunText
	call PrintText
	jp TextScriptEnd

GZapRun3:
	text_far _BirdBattleText
	text_asm
	ld a, ZAPDOS_G
	call PlayCry
	call WaitForSoundToFinish
	ld a, $ff
	ld [wJoyIgnore], a
	call GBFadeOutToBlack
	ld a, SFX_RUN
	call PlaySound
	ld a, HS_GLADE_GZAP_3
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_BRUNSWICK_ZAPDOS_G_2
	ld [wMissableObjectIndex], a
	predef ShowObject
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	ld a, 0
	ld [wJoyIgnore], a
	ld hl, GZapGladeRunText
	call PrintText
	jp TextScriptEnd

GZapGladeRunText:
	text_far _GZapGladeRunText
	text_end

BrunswickGladeSign1:
	text_far _BrunswickGladeSign
	text_end
	
BrunswickGladeTrainer1:
	text_asm
	ld hl, BrunswickGladeTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

BrunswickGladeTrainer2:
	text_asm
	ld hl, BrunswickGladeTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

BrunswickGladeTrainer3:
	text_asm
	ld hl, BrunswickGladeTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

BrunswickGladeTrainer4:
	text_asm
	ld hl, BrunswickGladeTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

BrunswickGladeBattleText1:
	text_far _BrunswickGladeBattleText1
	text_end

BrunswickGladeEndBattleText1:
	text_far _BrunswickGladeEndBattleText1
	text_end

BrunswickGladeAfterBattleText1:
	text_far _BrunswickGladeAfterBattleText1
	text_end

BrunswickGladeBattleText2:
	text_far _BrunswickGladeBattleText2
	text_end

BrunswickGladeEndBattleText2:
	text_far _BrunswickGladeEndBattleText2
	text_end

BrunswickGladeAfterBattleText2:
	text_far _BrunswickGladeAfterBattleText2
	text_end

BrunswickGladeBattleText3:
	text_far _BrunswickGladeBattleText3
	text_end

BrunswickGladeEndBattleText3:
	text_far _BrunswickGladeEndBattleText3
	text_end

BrunswickGladeAfterBattleText3:
	text_far _BrunswickGladeAfterBattleText3
	text_end

BrunswickGladeBattleText4:
	text_far _BrunswickGladeBattleText4
	text_end

BrunswickGladeEndBattleText4:
	text_far _BrunswickGladeEndBattleText4
	text_end

BrunswickGladeAfterBattleText4:
	text_far _BrunswickGladeAfterBattleText4
	text_end

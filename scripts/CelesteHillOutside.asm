CelesteHillOutside_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CelesteHillOutsideTrainerHeaders
	ld de, CelesteHillOutside_ScriptPointers
	ld a, [wCelesteHillOutsideCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCelesteHillOutsideCurScript], a
	ret

CelesteHillOutside_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

CelesteHillOutside_TextPointers:
	dw CelesteHillOutsideTrainer1
	dw CelesteHillOutsideTrainer2
	dw CelesteHillOutsideTrainer3
	dw HikerNPC
	dw CelesteSign

CelesteHillOutsideTrainerHeaders:
	def_trainers
CelesteHillOutsideTrainerHeader0:
	trainer EVENT_BEAT_CELESTE_HILL_OUTSIDE_BEAUTY, 2, CelesteHillOutsideBattleText1, CelesteHillOutsideEndBattleText1, CelesteHillOutsideAfterBattleText1
CelesteHillOutsideTrainerHeader1:
	trainer EVENT_BEAT_CELESTE_HILL_OUTSIDE_COOLTRAINER_M, 4, CelesteHillOutsideBattleText2, CelesteHillOutsideEndBattleText2, CelesteHillOutsideAfterBattleText2
CelesteHillOutsideTrainerHeader2:
	trainer EVENT_BEAT_CELESTE_HILL_OUTSIDE_GENTLEMAN, 4, CelesteHillOutsideBattleText3, CelesteHillOutsideEndBattleText3, CelesteHillOutsideAfterBattleText3
	db -1 ; end

CelesteHillOutsideTrainer1:
	text_asm
	ld hl, CelesteHillOutsideTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

CelesteHillOutsideTrainer2:
	text_asm
	ld hl, CelesteHillOutsideTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

CelesteHillOutsideTrainer3:
	text_asm
	ld hl, CelesteHillOutsideTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

CelesteHillOutsideBattleText1:
	text_far _CelesteHillOutsideBattleText1
	text_end

CelesteHillOutsideEndBattleText1:
	text_far _CelesteHillOutsideEndBattleText1
	text_end

CelesteHillOutsideAfterBattleText1:
	text_far _CelesteHillOutsideAfterBattleText1
	text_end

CelesteHillOutsideBattleText2:
	text_far _CelesteHillOutsideBattleText2
	text_end

CelesteHillOutsideEndBattleText2:
	text_far _CelesteHillOutsideEndBattleText2
	text_end

CelesteHillOutsideAfterBattleText2:
	text_far _CelesteHillOutsideAfterBattleText2
	text_end

CelesteHillOutsideBattleText3:
	text_far _CelesteHillOutsideBattleText3
	text_end

CelesteHillOutsideEndBattleText3:
	text_far _CelesteHillOutsideEndBattleText3
	text_end

CelesteHillOutsideAfterBattleText3:
	text_far _CelesteHillOutsideAfterBattleText3
	text_end

HikerNPC:
	text_far _HikerNPC
	text_end

CelesteSign:
	text_far _CelesteSign
	text_end
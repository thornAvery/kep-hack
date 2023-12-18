CelesteHillCave_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CelesteHillCaveTrainerHeaders
	ld de, CelesteHillCave_ScriptPointers
	ld a, [wCelesteHillCaveCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCelesteHillCaveCurScript], a
	ret

CelesteHillCave_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

CelesteHillCave_TextPointers:
	dw CelesteHillCaveTrainer1
	dw CelesteHillCaveTrainer2

CelesteHillCaveTrainerHeaders:
	def_trainers
CelesteHillCaveTrainerHeader0:
	trainer EVENT_BEAT_CELESTE_HILL_CAVE_BEAUTY, 2, CelesteHillCaveBattleText1, CelesteHillCaveEndBattleText1, CelesteHillCaveAfterBattleText1
CelesteHillCaveTrainerHeader1:
	trainer EVENT_BEAT_CELESTE_HILL_CAVE_COOLTRAINER_M, 4, CelesteHillCaveBattleText2, CelesteHillCaveEndBattleText2, CelesteHillCaveAfterBattleText2
	db -1 ; end

CelesteHillCaveTrainer1:
	text_asm
	ld hl, CelesteHillCaveTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

CelesteHillCaveTrainer2:
	text_asm
	ld hl, CelesteHillCaveTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

CelesteHillCaveBattleText1:
	text_far _CelesteHillCaveBattleText1
	text_end

CelesteHillCaveEndBattleText1:
	text_far _CelesteHillCaveEndBattleText1
	text_end

CelesteHillCaveAfterBattleText1:
	text_far _CelesteHillCaveAfterBattleText1
	text_end

CelesteHillCaveBattleText2:
	text_far _CelesteHillCaveBattleText2
	text_end

CelesteHillCaveEndBattleText2:
	text_far _CelesteHillCaveEndBattleText2
	text_end

CelesteHillCaveAfterBattleText2:
	text_far _CelesteHillCaveAfterBattleText2
	text_end


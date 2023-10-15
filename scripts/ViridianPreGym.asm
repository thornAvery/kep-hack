ViridianPreGym_Script:
	call EnableAutoTextBoxDrawing
	ld hl, ViridianPreGymTrainerHeaders
	ld de, ViridianPreGym_ScriptPointers
	ld a, [wViridianPreGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wViridianPreGymCurScript], a
	ret

ViridianPreGymResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wViridianPreGymCurScript], a
	ld [wCurMapScript], a
	ret

ViridianPreGym_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw ViridianGymYujirouPostBattle

ViridianGymYujirouPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jp z, ViridianGymResetScripts
	ld a, $f0
	ld [wJoyIgnore], a
	
	SetEvents EVENT_BEAT_YUJIROU, EVENT_BEAT_VIRIDIAN_PREGYM_TRAINER_0, EVENT_BEAT_VIRIDIAN_PREGYM_TRAINER_1 ; Needs to be set here for the correct text to pop up.
	ld a, $3
	ld [hSpriteIndex], a
	call DisplayTextID
	
	jp ViridianPreGymResetScripts

ViridianPreGym_TextPointers:
	dw ViridianPreGymText1
	dw ViridianPreGymText2
	dw YujirouText
	dw ViridianPreGymGuide
	dw ViridianPreGymSign1
	dw ViridianPreGymSign2
	dw ViridianPreGymSign3
	dw ViridianPreGymSign4
	dw ViridianPreGymStatue1
	dw ViridianPreGymStatue2

ViridianPreGymTrainerHeaders:
	def_trainers
ViridianPreGymTrainerHeader0:
	trainer EVENT_BEAT_VIRIDIAN_PREGYM_TRAINER_0, 3, ViridianPreGymBattleText1, ViridianPreGymEndBattleText1, ViridianPreGymAfterBattleText1
ViridianPreGymTrainerHeader1:
	trainer EVENT_BEAT_VIRIDIAN_PREGYM_TRAINER_1, 3, ViridianPreGymBattleText2, ViridianPreGymEndBattleText2, ViridianPreGymAfterBattleText2
	db -1 ;end

YujirouText:
	text_asm
	CheckEvent EVENT_POST_GAME_ATTAINED ; No need to view previous stuff
	jr nz, .rematchMode
	CheckEvent EVENT_BEAT_YUJIROU
	jp nz, .YujirouBeaten
	ld hl, YujirouIntro
	call PrintText
	
	ld c, BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	call PlayMusic
	
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, YujirouLoseText
	ld de, YujirouWinText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	
	; gym scaling spaghetti code begins here - remove initial parameters as we're making our own
	ld a, OPP_YUJIROU
	ld [wCurOpponent], a
	
	ld hl, wObtainedBadges ; Picking the team based on badge count. Need +1 so it loads the right team: remember, you're fighting for the badge! Thanks to Chatot4444 for the help.
	ld b, 1
	call CountSetBits
	ld a, [wNumSetBits]
	inc a
	ld [wTrainerNo], a
	
	ld a, 1
	ld [wIsTrainerBattle], a
	ld a, $3
	ld [wViridianPreGymCurScript], a
	ld [wCurMapScript], a
	jr .done
.rematchMode ; Rematch functionality. Just loads pre-battle text and his trainer.
	ld hl, YujirouIntro2
	call PrintText
	ld c, BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	call PlayMusic
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	ld hl, YujirouLoseText2
	ld de, YujirouWinText
	call SaveEndBattleTextPointers
	call EngageMapTrainer
	ld a, OPP_YUJIROU
	ld [wCurOpponent], a
	ld a, 10
	ld [wTrainerNo], a
	ld a, 1
	ld [wIsTrainerBattle], a
	ld a, $1
	ld [wGymLeaderNo], a
	jr .done
.YujirouBeaten
	ld hl, YujirouAfterBattleText
	call PrintText
.done
	jp TextScriptEnd

YujirouIntro::
	text_far _YujirouIntro
	text_end
	
YujirouLoseText::
	text_far _YujirouLoseText
	text_end

YujirouWinText::
	text_far _YujirouWinText
	text_end

YujirouAfterBattleText::
	text_far _YujirouAfterBattleText
	text_end

YujirouIntro2::
	text_far _YujirouIntro2
	text_end
	
YujirouLoseText2::
	text_far _YujirouLoseText2
	text_end

YujirouAfterBattleText2::
	text_far _YujirouAfterBattleText2
	text_end

ViridianPreGymText1:
	text_asm
	ld hl, ViridianPreGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

ViridianPreGymBattleText1:
	text_far _ViridianPreGymBattleText1
	text_end

ViridianPreGymEndBattleText1:
	text_far _ViridianPreGymEndBattleText1
	text_end

ViridianPreGymAfterBattleText1:
	text_far _ViridianPreGymAfterBattleText1
	text_end

ViridianPreGymText2:
	text_asm
	ld hl, ViridianPreGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

ViridianPreGymBattleText2:
	text_far _ViridianPreGymBattleText2
	text_end

ViridianPreGymEndBattleText2:
	text_far _ViridianPreGymEndBattleText2
	text_end

ViridianPreGymAfterBattleText2:
	text_far _ViridianPreGymAfterBattleText2
	text_end

ViridianPreGymGuide:
	text_far _ViridianPreGymGuide
	text_end

ViridianPreGymSign1:
	text_far _ViridianPreGymSign1
	text_end

ViridianPreGymSign2:
	text_far _ViridianPreGymSign2
	text_end

ViridianPreGymSign3:
	text_far _ViridianPreGymSign3
	text_end

ViridianPreGymSign4:
	text_far _ViridianPreGymSign4
	text_end

ViridianPreGymStatue1:
	text_far _PreGymStatueText
	text_end

ViridianPreGymStatue2:
	text_far _PreGymStatueText
	text_end

	text_end ; unused

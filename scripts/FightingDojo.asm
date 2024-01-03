FightingDojo_Script:
	call EnableAutoTextBoxDrawing
	ld hl, FightingDojoTrainerHeaders
	ld de, FightingDojo_ScriptPointers
	ld a, [wFightingDojoCurScript]
	call ExecuteCurMapScriptInTable
	ld [wFightingDojoCurScript], a
	ret

FightingDojoScript_5cd70:
	xor a
	ld [wJoyIgnore], a
	ld [wFightingDojoCurScript], a
	ld [wCurMapScript], a
	ret

FightingDojo_ScriptPointers:
	dw FightingDojoScript1
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw FightingDojoScript3

FightingDojoScript1:
	call CheckFightingMapTrainers
	ld a, [wTrainerHeaderFlagBit]
	and a
	ret nz
	CheckEvent EVENT_BEAT_KARATE_MASTER
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld [wcf0d], a
	ld a, [wYCoord]
	cp 2
	ret nz
	ld a, [wXCoord]
	cp 4
	ret nz
	ld a, $1
	ld [wcf0d], a
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld a, $1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ret

FightingDojoScript3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, FightingDojoScript_5cd70
	ld a, [wcf0d]
	and a
	jr z, .asm_5cde4
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld a, $1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay

.asm_5cde4
	ld a, $f0
	ld [wJoyIgnore], a
	SetEventRange EVENT_BEAT_KARATE_MASTER, EVENT_BEAT_FIGHTING_DOJO_TRAINER_3
	ld a, $9
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld [wFightingDojoCurScript], a
	ld [wCurMapScript], a
	ret

FightingDojo_TextPointers:
	dw FightingDojoText1
	dw FightingDojoText2
	dw FightingDojoText3
	dw FightingDojoText4
	dw FightingDojoText5
	dw FightingDojoText6
	dw FightingDojoText7
	dw FightingDojoTextHitmontop
	dw FightingDojoText8

FightingDojoTrainerHeaders:
	def_trainers 2
FightingDojoTrainerHeader0:
	trainer EVENT_BEAT_FIGHTING_DOJO_TRAINER_0, 4, FightingDojoBattleText1, FightingDojoEndBattleText1, FightingDojoAfterBattleText1
FightingDojoTrainerHeader1:
	trainer EVENT_BEAT_FIGHTING_DOJO_TRAINER_1, 4, FightingDojoBattleText2, FightingDojoEndBattleText2, FightingDojoAfterBattleText2
FightingDojoTrainerHeader2:
	trainer EVENT_BEAT_FIGHTING_DOJO_TRAINER_2, 3, FightingDojoBattleText3, FightingDojoEndBattleText3, FightingDojoAfterBattleText3
FightingDojoTrainerHeader3:
	trainer EVENT_BEAT_FIGHTING_DOJO_TRAINER_3, 3, FightingDojoBattleText4, FightingDojoEndBattleText4, FightingDojoAfterBattleText4
	db -1 ; end

FightingDojoText1: ; gym scaling can be removed to make space
	text_asm
	CheckEvent EVENT_POST_GAME_ATTAINED ; No need to view previous stuff, technically you can skip Bide this way but I think that's hilarious
	jp z, .normalProcessing
	CheckEvent EVENT_DEFEATED_FIGHTING_DOJO
	jp z, .normalProcessing
	ld hl, KoichiRematchPreBattleText ; Rematch functionality. Just loads pre-battle text and his trainer.
	call PrintText
	ld c, BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	call PlayMusic
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	ld hl, KoichiRematchDefeatedText
	ld de, KoichiRematchDefeatedText
	call SaveEndBattleTextPointers
	call EngageMapTrainer
	ld a, OPP_KOICHI
	ld [wCurOpponent], a
	ld a, 10 ; Silph Gauntlet lineup.
	ld [wTrainerNo], a
	ld a, 1
	ld [wIsTrainerBattle], a
	jr .asm_9dba4
.normalProcessing
	CheckEvent EVENT_DEFEATED_FIGHTING_DOJO
	jp nz, .continue1
	CheckEventReuseA EVENT_BEAT_KARATE_MASTER
	jp nz, .continue2
	CheckEvent EVENT_GOT_HITMON ; failsafe
	jp nz, .continue2
	ld hl, FightingDojoText_5ce8e
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, FightingDojoText_5ce93
	ld de, FightingDojoText_5ce93
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndexOrTextID]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	; call InitBattleEnemyParameters ; put this back if you mess up
	
	; gym scaling spaghetti code begins here - remove initial parameters as we're making our own
	ld a, OPP_KOICHI
	ld [wCurOpponent], a
	
	ld hl, wObtainedBadges ; Picking the team based on badge count. Need +1 so it loads the right team: remember, you're fighting for the badge! Thanks to Chatot4444 for the help.
	ld b, 1
	call CountSetBits
	ld a, [wNumSetBits]
	inc a
	
	ld [wTrainerNo], a
	ld a, 1
	ld [wIsTrainerBattle], a
	
	;ends here
	
	ld a, $3
	ld [wFightingDojoCurScript], a
	ld [wCurMapScript], a
	jr .asm_9dba4
.continue1
	ld hl, FightingDojoText_5ce9d
	call PrintText
	jr .asm_9dba4
.continue2
	ld hl, FightingDojoText8
	call PrintText
	SetEvent EVENT_DEFEATED_FIGHTING_DOJO
.asm_9dba4
	jp TextScriptEnd

FightingDojoText_5ce8e:
	text_far _FightingDojoText_5ce8e
	text_end

FightingDojoText_5ce93:
	text_far _FightingDojoText_5ce93
	text_end

FightingDojoText8:
	text_far _FightingDojoText_5ce98
	text_end

FightingDojoText_5ce9d:
	text_far _FightingDojoText_5ce9d
	text_end

FightingDojoText2:
	text_asm
	ld hl, FightingDojoTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBattleText1:
	text_far _FightingDojoBattleText1
	text_end

FightingDojoEndBattleText1:
	text_far _FightingDojoEndBattleText1
	text_end

FightingDojoAfterBattleText1:
	text_far _FightingDojoAfterBattleText1
	text_end

FightingDojoText3:
	text_asm
	ld hl, FightingDojoTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBattleText2:
	text_far _FightingDojoBattleText2
	text_end

FightingDojoEndBattleText2:
	text_far _FightingDojoEndBattleText2
	text_end

FightingDojoAfterBattleText2:
	text_far _FightingDojoAfterBattleText2
	text_end

FightingDojoText4:
	text_asm
	ld hl, FightingDojoTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBattleText3:
	text_far _FightingDojoBattleText3
	text_end

FightingDojoEndBattleText3:
	text_far _FightingDojoEndBattleText3
	text_end

FightingDojoAfterBattleText3:
	text_far _FightingDojoAfterBattleText3
	text_end

FightingDojoText5:
	text_asm
	ld hl, FightingDojoTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBattleText4:
	text_far _FightingDojoBattleText4
	text_end

FightingDojoEndBattleText4:
	text_far _FightingDojoEndBattleText4
	text_end

FightingDojoAfterBattleText4:
	text_far _FightingDojoAfterBattleText4
	text_end

; So get this, the game had an EVENT_GOT_HITMONCHAN and EVENT_GOT_HITMONLEE here.
; However, in the way it was being used...
; You can just make it EVENT_GOT_HITMON and be outright better off.
; So when implementing the new stuff, I made this optimisation. 
; Oh, and because of the new Dojo structure, I had to rework the EVENT_DEFEATED_FIGHTING_DOJO system, to ensure people don't grab their prizes early.

FightingDojoText6:
; Hitmonlee Poké Ball
	text_asm
	CheckEvent EVENT_DEFEATED_FIGHTING_DOJO
	jr z, .Oi
	CheckEvent EVENT_GOT_HITMON
	jr z, .GetMon
	ld hl, OtherHitmonText
	call PrintText
	jr .done
.GetMon
	ld a, HITMONLEE
	call DisplayPokedex
	ld hl, WantHitmonleeText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld a, [wcf91]
	ld b, a
	ld c, 30
	call GivePokemon
	jr nc, .done

	; once Poké Ball is taken, hide sprite
	ld a, HS_FIGHTING_DOJO_GIFT_1
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvents EVENT_GOT_HITMON
	jr .done
.Oi
	ld hl, OiMateText
	call PrintText
	;fallthrough
.done
	jp TextScriptEnd

WantHitmonleeText:
	text_far _WantHitmonleeText
	text_end

FightingDojoText7:
; Hitmonchan Poké Ball
	text_asm
	CheckEvent EVENT_DEFEATED_FIGHTING_DOJO
	jr z, .Oi
	CheckEvent EVENT_GOT_HITMON
	jr z, .GetMon
	ld hl, OtherHitmonText
	call PrintText
	jr .done
.GetMon
	ld a, HITMONCHAN
	call DisplayPokedex
	ld hl, WantHitmonchanText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld a, [wcf91]
	ld b, a
	ld c, 30
	call GivePokemon
	jr nc, .done
	SetEvent EVENT_GOT_HITMON

	; once Poké Ball is taken, hide sprite
	ld a, HS_FIGHTING_DOJO_GIFT_2
	ld [wMissableObjectIndex], a
	predef HideObject
	jr .done
.Oi
	ld hl, OiMateText
	call PrintText
	;fallthrough
.done
	jp TextScriptEnd

FightingDojoTextHitmontop:
; Hitmontop Poké Ball
	text_asm
	CheckEvent EVENT_DEFEATED_FIGHTING_DOJO
	jr z, .Oi
	CheckEvent EVENT_GOT_HITMON
	jr z, .GetMon
	ld hl, OtherHitmonText
	call PrintText
	jr .done
.GetMon
	ld a, HITMONTOP
	call DisplayPokedex
	ld hl, WantHitmontopText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld a, [wcf91]
	ld b, a
	ld c, 30
	call GivePokemon
	jr nc, .done
	SetEvent EVENT_GOT_HITMON

	; once Poké Ball is taken, hide sprite
	ld a, HS_FIGHTING_DOJO_GIFT_3
	ld [wMissableObjectIndex], a
	predef HideObject
	jr .done
.Oi
	ld hl, OiMateText
	call PrintText
	;fallthrough
.done
	jp TextScriptEnd

WantHitmonchanText:
	text_far _WantHitmonchanText
	text_end

WantHitmontopText:
	text_far _WantHitmontopText
	text_end

OtherHitmonText:
	text_far _GreedyBastardText
	text_end

OiMateText:
	text_far _OiMateText
	text_end

KoichiRematchPreBattleText:
	text_far _KoichiRematchPreBattleText
	text_end

KoichiRematchDefeatedText:
	text_far _KoichiRematchDefeatedText
	text_end

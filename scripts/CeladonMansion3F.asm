CeladonMansion3F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMansion3F_TextPointers:
	dw ProgrammerText
	dw GraphicArtistText
	dw WriterText
	dw DirectorText
	dw MorimotoFight
	dw GameFreakPCText1
	dw GameFreakPCText2
	dw GameFreakPCText3
	dw GameFreakSignText

ProgrammerText:
	text_far _ProgrammerText
	text_end

GraphicArtistText:
	text_far _GraphicArtistText
	text_end

WriterText:
	text_far _WriterText
	text_end

DirectorText:
	text_asm
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	cp NUM_POKEMON
	jr nc, .completed_dex
	ld hl, .GameDesignerText
	jr .done
.completed_dex
	ld hl, .CompletedDexText
.done
	call PrintText
	jp TextScriptEnd

.GameDesignerText:
	text_far _GameDesignerText
	text_end

.CompletedDexText:
	text_far _CompletedDexText
	text_promptbutton
	text_asm
	callfar DisplayDiploma
	ld a, TRUE
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	jp TextScriptEnd

GameFreakPCText1:
	text_far _CeladonMansion3Text5
	text_end

GameFreakPCText2:
	text_far _CeladonMansion3Text6
	text_end

GameFreakPCText3:
	text_far _CeladonMansion3Text7
	text_end

GameFreakSignText:
	text_far _CeladonMansion3Text8
	text_end

MorimotoFight:
	text_asm
	ld hl, CeladonMansionMorimotoGreeting
	call PrintText

	call YesNoChoice ; Do they want in?
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	
	ld hl, CeladonMansionMorimotoFight
	call PrintText
	ld c, BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	call PlayMusic
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	
	call Delay3
	ld a, OPP_COOLTRAINER_M
	ld [wCurOpponent], a
	ld a, 11
	ld [wTrainerNo], a
	ld a, 1
	ld [wIsTrainerBattle], a
	ld hl, CeladonMansionMorimotoDefeated
	ld de, CeladonMansionMorimotoWin
	call SaveEndBattleTextPointers
	jr .done
.refused
	ld hl, CeladonMansionMorimotoNo
	call PrintText
	; fallthrough
.done
	jp TextScriptEnd

CeladonMansionMorimotoGreeting:
	text_far _CeladonMansionMorimotoGreeting
	text_end

CeladonMansionMorimotoFight:
	text_far _CeladonMansionMorimotoFight
	text_end

CeladonMansionMorimotoNo:
	text_far _CeladonMansionMorimotoNo
	text_end

CeladonMansionMorimotoDefeated:
	text_far _CeladonMansionMorimotoDefeated
	text_end

CeladonMansionMorimotoWin:
	text_far _CeladonMansionMorimotoWin
	text_end

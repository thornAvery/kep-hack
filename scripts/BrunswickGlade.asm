BrunswickGlade_Script:
	jp EnableAutoTextBoxDrawing

BrunswickGlade_TextPointers:
	dw GZapRun1
	dw GZapRun2
	dw GZapRun3
	dw BrunswickGladeSign1
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText

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
	text "It ran away"
	line "again..."
	done
	text_end

BrunswickGladeSign1:
	text "BRUNSWICK GLADE"
	line "The lush..."
	
	para "The sign has been"
	line "kicked in. It's"
	cont "impossible to"
	cont "read..."
	done
	text_end
	

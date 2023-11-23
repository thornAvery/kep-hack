SilphCo1F_Script:
	call EnableAutoTextBoxDrawing
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ret z
	CheckAndSetEvent EVENT_SILPH_CO_RECEPTIONIST_AT_DESK
	ret nz
	ld a, HS_SILPH_CO_1F_RECEPTIONIST
	ld [wMissableObjectIndex], a
	predef_jump ShowObject
	ld hl, SilphCo1F_ScriptPointers
	ld a, [wSilphCo1FCurScript]
	jp CallFunctionInTable
	
SilphCo1F_ScriptPointers:
	dw SilphCo1FScript0
	dw SilphCo1FScript1
	
SilphCo1FScript0:
	call SilphCo1FScript_CheckForLetter
	
SilphCo1FScript_CheckForLetter:
	ld b, SILPHLETTER
	call IsItemInBag
	ret nz
	ld a, [wYCoord]
	cp 3
	ret nz
	ld a, [wXCoord]
	cp 15
	ret nz
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	ld a, $3
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
	call SilphCo1FScript_ForceDown
	ld a, $1
	ld [wSilphCo1FCurScript], a
	ret
	
SilphCo1FScript_ForceDown:
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpritePlayerStateData1FacingDirection], a
	ld [wJoyIgnore], a
	ret
	
SilphCo1FScript1:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, $0
	ld [wSilphCo1FCurScript], a
	ret

SilphCo1F_TextPointers:
	dw SilphCo1Text1
	dw SilphCo1Text2
	dw SilphCo1Text3

SilphCo1Text1:
	text_far _SilphCo1Text1
	text_end
	
SilphCo1Text2:
	text_far _SilphCo1Text2
	text_end
	
SilphCo1Text3:
	text_far _SilphCo1Text3
	text_end


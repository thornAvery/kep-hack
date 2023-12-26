SilphCo1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo1F_ScriptPointers
	ld a, [wSilphCo1FCurScript]
	jp CallFunctionInTable
	
SilphCo1F_ScriptPointers:
	dw SilphCo1FScript0
	dw SilphCo1FScript1
	
SilphCo1FScript0:
	ResetEvent EVENT_BEAT_CHIEF ; Used so you can rematch Chief and later the gauntlet, without him being reset alongside everything else. An absolutely tragic way to fix a bug, but it works. If you enter his room, you have to fight him, so this all works under the hood without infringing on design.
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
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	xor a
	ld [wSpritePlayerStateData1FacingDirection], a
	ld [wJoyIgnore], a
	ld a, $1
	ld [wSilphCo1FCurScript], a
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


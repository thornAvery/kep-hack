CinnabarIsland_Script:
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ResetEvent EVENT_MANSION_SWITCH_ON
	ResetEvent EVENT_LAB_STILL_REVIVING_FOSSIL
	ld hl, CinnabarIsland_ScriptPointers
	ld a, [wCinnabarIslandCurScript]
	jp CallFunctionInTable

CinnabarIsland_ScriptPointers:
	dw CinnabarIslandScript0
	dw CinnabarIslandScript1

CinnabarIslandScript0:
	ld b, SECRET_KEY
	call IsItemInBag
	ret nz
	ld a, [wYCoord]
	cp 10
	ret nz
	ld a, [wXCoord]
	cp 20
	ret nz
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld a, $8
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
	ld [wCinnabarIslandCurScript], a
	ret

CinnabarIslandScript1:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, $0
	ld [wCinnabarIslandCurScript], a
	ret

CinnabarIsland_TextPointers:
	dw CinnabarIslandText1
	dw CinnabarIslandText2
	dw CinnabarPocketLapras
	dw CinnabarIslandText3
	dw MartSignText
	dw PokeCenterSignText
	dw CinnabarIslandText6
	dw CinnabarIslandText7
	dw CinnabarIslandText8

CinnabarIslandText8:
	text_far _CinnabarIslandText8
	text_end

CinnabarIslandText1:
	text_far _CinnabarIslandText1
	text_end

CinnabarIslandText2:
	text_far _CinnabarIslandText2
	text_end

CinnabarIslandText3:
	text_far _CinnabarIslandText3
	text_end

CinnabarIslandText6:
	text_far _CinnabarIslandText6
	text_end

CinnabarIslandText7:
	text_far _CinnabarIslandText7
	text_end

_CinnabarPocketLapras1:
	text "Bah, this LAPRAS"
	line "just doesn't"
	cont "wanna fight! Can"
	cont "you believe that?"
	
	para "All it does is"
	line "SURF. My GYARADOS"
	cont "can do that!"
	
	para "Here. Take it."
	line "I can't stand"
	cont "looking at its"
	cont "big ol' eyes."
	done

_PocketLaprasNoRoomText:
	text "You don't have"
	line "room either?"
	
	para "Well, it's not"
	line "going anywhere..."
	done

_ReceivedPocketLaprasText:
	text "Take care of that"
	line "LAPRAS though,"
	cont "yeah? They're"
	cont "an endangered"
	cont "species."
	
	para "You should stay"
	line "safe, too." ; haha, llinos, you sly dog
	done

; for some reason it crashed super hard if I didn't do this.
CinnabarPocketLapras1:
	text_far _CinnabarPocketLapras1
	text_end

PocketLaprasNoRoomText:
	text_far _PocketLaprasNoRoomText
	text_end

ReceivedPocketLaprasText:
	text_far _ReceivedPocketLaprasText
	text_end

CinnabarPocketLapras:
	text_asm
	CheckEvent EVENT_GOT_POCKET_LAPRAS
	jr nz, .skip
	ld hl, CinnabarPocketLapras1
	call PrintText
	call TheAutoskipStopinator ; it's been a while but i didnt forget how annoying this was
	lb bc, SURFBOARD, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_GOT_POCKET_LAPRAS ; if you get here, it's done. Using this to load all three texts with one PrintText instruction
	sound_get_key_item
	ld hl, ReceivedPocketLaprasText
	jr .end
.bag_full
	ld hl, PocketLaprasNoRoomText
	jr .end
.skip
	ld hl, ReceivedPocketLaprasText
	; fallthrough
.end
	call PrintText
	call TheAutoskipStopinator 
	jp TextScriptEnd

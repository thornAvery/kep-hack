MtMoonB1F_Script:
	call EnableAutoTextBoxDrawing
	ld de, MtMoonB1F_ScriptPointers
	ld a, [wMtMoonB1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wMtMoonB1FCurScript], a
	ret

MtMoonB1F_ScriptPointers:
	dw MtMoonB1FScript0

MtMoonB1FScript0:
	ld hl, CoordsData_Crater
	call MtMoonB1FScript_5225b
	ld a, [wWhichDungeonWarp]
	and a
	ld a, MT_MOON_CRATER
	ld [wDungeonWarpDestinationMap], a
	ret

CoordsData_Crater:
	dbmapcoord  6, 23
	db -1 ; end

MtMoonB1FScript_5225b:
	xor a
	ld [wWhichDungeonWarp], a
	ld a, [wd72d]
	bit 4, a
	ret nz
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wCoordIndex]
	ld [wWhichDungeonWarp], a
	ld hl, wd72d
	set 4, [hl]
	ld hl, wd732
	set 4, [hl]
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ld c, 0 ; BANK(Music_MeetRival)
	ld a, MUSIC_AREA_ZERO
	call PlayMusic
	ret

MtMoonB1F_TextPointers:
	dw MtMoonText1

MtMoonText1:
	text_far _MtMoonText1
	text_end

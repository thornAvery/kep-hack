MtMoonB1F_Script:
	call EnableAutoTextBoxDrawing
	ld a, MT_MOON_CRATER
	ld [wDungeonWarpDestinationMap], a
	ld hl, MtMoonHolesCoords
	jp IsPlayerOnDungeonWarp

MtMoonHolesCoords:
	dbmapcoord  6, 23
	db -1 ; end

MtMoonB1F_TextPointers:
	dw MtMoonText1

MtMoonText1:
	text_far _MtMoonText1
	text_end

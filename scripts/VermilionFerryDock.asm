VermilionFerryDock_Script:
	ld a, VERMILION_CITY
	ld [wLastMap], a
	jp EnableAutoTextBoxDrawing

VermilionFerryDock_TextPointers:

	text_end
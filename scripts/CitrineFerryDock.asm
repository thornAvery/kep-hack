CitrineFerryDock_Script:
	ld a, CITRINE_CITY
	ld [wLastMap], a
	jp EnableAutoTextBoxDrawing

CitrineFerryDock_TextPointers:

	text_end
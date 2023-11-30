PokemonMansionB2F_Script:
	jp EnableAutoTextBoxDrawing
	ld a, [wPokemonMansionB2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonMansionB2FCurScript], a
	ret

PokemonMansionB2F_TextPointers:
	dw B2FBook1
	dw B2FBook2
	dw PickUpItemText
	dw PickUpItemText
	dw B2FPicture
	dw B2FTrioPods
	dw B2FTrioPods
	dw B2FTrioPods
	dw B2FAmberPod
	dw B2FMewtwoPod
	dw B2FComputer1
	dw B2FComputer2
	dw B2FMissingNo

B2FBook1:
	text_far _B2FBook1
	text_end

B2FBook2:
	text_far _B2FBook2
	text_end

B2FPicture:
	text_far _B2FPicture
	text_end

B2FComputer1:
	text_far _B2FComputer1
	text_end

B2FComputer2:
	text_far _B2FComputer2
	text_end
	
B2FMissingNo:
	text_far _B2FMissingNo
	text_end

B2FTrioPods:
	text_far _TrioPods
	text_end

B2FAmberPod:
	text_far _AmberPod
	text_end

B2FMewtwoPod:
	text_far _MewtwoPod
	text_end

	text_end ; unused

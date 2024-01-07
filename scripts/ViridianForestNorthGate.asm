ViridianForestNorthGate_Script:
	jp EnableAutoTextBoxDrawing

ViridianForestNorthGate_TextPointers:
	dw ViridianForestExitText1
	dw ViridianForestExitText2
	dw ViridianForestExitText3

ViridianForestExitText1:
	text_far _ViridianForestExitText1
	text_end

ViridianForestExitText2:
	text_far _ViridianForestExitText2
	text_end

ViridianForestExitText3:
	text_asm
	ld a, TRADE_FOR_CHIKUCHIKU
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

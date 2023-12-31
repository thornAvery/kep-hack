Route10Gate_Script:
	jp EnableAutoTextBoxDrawing

Route10Gate_TextPointers:
	dw Route10GateText1

Route10GateText1:
	text_asm
	ld a, TRADE_FOR_JENNY
	ld [wWhichTrade], a
	jr Route10GateDoTrade
	
Route10GateDoTrade:
	predef DoInGameTradeDialogue
	jp TextScriptEnd

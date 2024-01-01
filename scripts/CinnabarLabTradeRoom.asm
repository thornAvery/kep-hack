CinnabarLabTradeRoom_Script:
	jp EnableAutoTextBoxDrawing

CinnabarLabTradeRoom_TextPointers:
	dw Lab2Text1
	dw CinnabarLabTrader

Lab2Text1:
	text_far _Lab2Text1
	text_end

CinnabarLabTrader:
	text_asm
	ld a, TRADE_WITH_SELF
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd
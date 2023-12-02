PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuMon3Entries, PrizeMenuMon3Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

NoThanksText:
	db "NO THANKS@"

PrizeMenuMon1Entries:
	db ABRA
	db SEEL
	db CLEFAIRY
	db "@"

PrizeMenuMon1Cost:
	bcd2 300
	bcd2 500
	bcd2 1000
	db "@"

PrizeMenuMon2Entries:
	db CACTORMUS
	db SQUEAMATA
	db DRATINI
	db "@"

PrizeMenuMon2Cost:
	bcd2 1500
	bcd2 3000
	bcd2 3000
	db "@"

PrizeMenuMon3Entries:
	db SCYTHER
	db PINSIR
	db PORYGON
	db "@"

PrizeMenuMon3Cost:
	bcd2 4500
	bcd2 4500
	bcd2 7000
	db "@"

PrizeMenuTMsEntries:
	db MOON_STONE
	db TM_HYPER_BEAM
	db TM_SUBSTITUTE
	db "@"

PrizeMenuTMsCost:
	bcd2 3000
	bcd2 5000
	bcd2 7000
	db "@"

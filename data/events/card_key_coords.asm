; These tables are probably supposed to be door locations in Silph Co.,
; but they are unused.
; The reason there are 3 tables is unknown.

; Format: map ID, Y, X, gate ID?

CardKeyTable1:
	db  SILPH_CO_7F, $06, $0A, 4
	db  SILPH_CO_7F, $06, $0B, 5
	db -1 ; end

CardKeyTable2:
	db SILPH_CO_3F, $08, $09, 10
	db SILPH_CO_3F, $09, $09, 11
	db SILPH_CO_5F, $04, $07, 12
	db SILPH_CO_5F, $05, $07, 13
	db -1 ; end

CardKeyTable3:
	db SILPH_CO_11F, $08, $09, 20
	db SILPH_CO_11F, $09, $09, 21
	db -1 ; end

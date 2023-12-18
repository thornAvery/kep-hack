DisplayDexRating:
	ld hl, wPokedexSeen
	ld b, wPokedexSeenEnd - wPokedexSeen
	call CountSetBits
	ld a, [wNumSetBits]
	ldh [hDexRatingNumMonsSeen], a
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	ldh [hDexRatingNumMonsOwned], a
	ld hl, DexRatingsTable
.findRating
	ld a, [hli]
	ld b, a
	ldh a, [hDexRatingNumMonsOwned]
	cp b
	jr c, .foundRating
	inc hl
	inc hl
	jr .findRating
.foundRating
	ld a, [hli]
	ld h, [hl]
	ld l, a ; load text pointer into hl
	CheckAndResetEventA EVENT_HALL_OF_FAME_DEX_RATING
	jr nz, .hallOfFame
	push hl
	ld hl, DexCompletionText
	call PrintText
	pop hl
	call PrintText
	farcall PlayPokedexRatingSfx
	jp WaitForTextScrollButtonPress
.hallOfFame
	ld de, wDexRatingNumMonsSeen
	ldh a, [hDexRatingNumMonsSeen]
	ld [de], a
	inc de
	ldh a, [hDexRatingNumMonsOwned]
	ld [de], a
	inc de
.copyRatingTextLoop
	ld a, [hli]
	cp "@"
	jr z, .doneCopying
	ld [de], a
	inc de
	jr .copyRatingTextLoop
.doneCopying
	ld [de], a
	ret

DexCompletionText:
	text_far _DexCompletionText
	text_end

DexRatingsTable:
	dbw 15, DexRatingText_Own0To14
	dbw 30, DexRatingText_Own15To29
	dbw 50, DexRatingText_Own30To49
	dbw 65, DexRatingText_Own50To64
	dbw 80, DexRatingText_Own65To79
	dbw 100, DexRatingText_Own80To99
	dbw 115, DexRatingText_Own100To114
	dbw 130, DexRatingText_Own115To129
	dbw 150, DexRatingText_Own130To149
	dbw 165, DexRatingText_Own150To164
	dbw 180, DexRatingText_Own165To179
	dbw 200, DexRatingText_Own180To199
	dbw 215, DexRatingText_Own200To214
	dbw 230, DexRatingText_Own215To229
	dbw 251, DexRatingText_Own230To249
	dbw NUM_POKEMON + 1, DexRatingText_OwnComplete

DexRatingText_Own0To14:
	text_far _DexRatingText_Own0To14
	text_end

DexRatingText_Own15To29:
	text_far _DexRatingText_Own15To29
	text_end

DexRatingText_Own30To49:
	text_far _DexRatingText_Own30To49
	text_end

DexRatingText_Own50To64:
	text_far _DexRatingText_Own50To64
	text_end

DexRatingText_Own65To79:
	text_far _DexRatingText_Own65To79
	text_end

DexRatingText_Own80To99:
	text_far _DexRatingText_Own80To99
	text_end

DexRatingText_Own100To114:
	text_far _DexRatingText_Own100To114
	text_end

DexRatingText_Own115To129:
	text_far _DexRatingText_Own115To129
	text_end

DexRatingText_Own130To149:
	text_far _DexRatingText_Own130To149
	text_end

DexRatingText_Own150To164:
	text_far _DexRatingText_Own150To164
	text_end

DexRatingText_Own165To179:
	text_far _DexRatingText_Own165To179
	text_end

DexRatingText_Own180To199:
	text_far _DexRatingText_Own180To199
	text_end

DexRatingText_Own200To214:
	text_far _DexRatingText_Own200To214
	text_end

DexRatingText_Own215To229:
	text_far _DexRatingText_Own215To229
	text_end

DexRatingText_Own230To249:
	text_far _DexRatingText_Own230To249
	text_end

DexRatingText_OwnComplete:
	text_far _DexRatingText_OwnComplete
	text_end

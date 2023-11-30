DebugMenu:
IF DEF(_DEBUG)
	call ClearScreen

	; These debug names are used for TestBattle.
	; StartNewGameDebug uses the debug names from PrepareOakSpeech.
	ld hl, DebugBattlePlayerName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData

	ld hl, DebugBattleRivalName
	ld de, wRivalName
	ld bc, NAME_LENGTH
	call CopyData

	call LoadFontTilePatterns
	call LoadHpBarAndStatusTilePatterns
	call ClearSprites
	call RunDefaultPaletteCommand

	hlcoord 5, 6
	ld b, 3
	ld c, 9
	call TextBoxBorder

	hlcoord 7, 7
	ld de, DebugMenuOptions
	call PlaceString

	ld a, TEXT_DELAY_MEDIUM
	ld [wOptions], a

	ld a, A_BUTTON | B_BUTTON | START
	ld [wMenuWatchedKeys], a
	xor a
	ld [wMenuJoypadPollCount], a
	inc a
	ld [wMaxMenuItem], a
	ld a, 7
	ld [wTopMenuItemY], a
	dec a
	ld [wTopMenuItemX], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wMenuWatchMovingOutOfBounds], a

	call HandleMenuInput
	bit BIT_B_BUTTON, a
	jp nz, DisplayTitleScreen

	ld a, [wCurrentMenuItem]
	and a ; FIGHT?
	jp z, TestBattle

	; DEBUG
	ld hl, wd732
	set 1, [hl]
	jp StartNewGameDebug

DebugBattlePlayerName:
	db "Tom@"

DebugBattleRivalName:
	db "Juerry@"

DebugMenuOptions:
	db   "FIGHT"
	next "DEBUG@"
ELSE
	ret
ENDC

TestBattle:
.loop
	call GBPalNormal

	; Get some debug items.
	ld hl, wNumBagItems
	ld de, BattleDebugItemsList
.items_loop
	ld a, [de]
	cp -1
	jr z, .items_end
	ld [wcf91], a
	inc de
	ld a, [de]
	inc de
	ld [wItemQuantity], a
	call AddItemToInventory
	jr .items_loop
.items_end

	; Don't mess around
	; with obedience.
	ld a, 1 << BIT_EARTHBADGE
	ld [wObtainedBadges], a

	ld hl, wFlags_D733
	set BIT_TEST_BATTLE, [hl]

	; Reset the party.
	ld hl, wPartyCount
	xor a
	ld [hli], a
	dec a
	ld [hl], a

	; Player's Pokemon.
	ld a, GLACEON
	ld [wcf91], a
	ld a, 16
	ld [wCurEnemyLVL], a
	xor a
	ld [wMonDataLocation], a
	ld [wCurMap], a
	call AddPartyMon
	
	; This function gives you a way to waste a turn, never know when you'll need it.
	; Alternatively, add a move to test.
	ld hl, wPartyMon1Moves
	ld a, UPPERCUT ; Something super weak
	ld [hli], a
	ld a, POWDER_SNOW ; Test new failure text
	ld [hli], a
	ld a, LOW_KICK ; Something that'll miss easily
	ld [hli], a
	ld a, LEER ; Skip turn
	ld [hli], a
	
	; Opponent's Pokemon.
	ld a, BUU ; Test new theme
	ld [wCurOpponent], a
	ld a, 10 ; Set the level you want here.
	ld [wCurEnemyLVL], a

	predef InitOpponent

	; When the battle ends,
	; do it all again.
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ldh [hAutoBGTransferEnabled], a
	jr .loop

BattleDebugItemsList:
	db X_ACCURACY, 99 ; Test Guillotine animation
	db FULL_RESTORE, 99
	db MAX_ELIXER, 99
	db FULL_HEAL, 99
	db X_ATTACK, 99
	db X_SPECIAL, 99
	db X_DEFEND, 99
	db X_SPEED, 99
	db DIRE_HIT, 99
	db GUARD_SPEC, 99
	db POKE_FLUTE, 1
	db -1 ; end

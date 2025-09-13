PrepareOakSpeech:
	ld a, [wLetterPrintingDelayFlags]
	push af
	ld a, [wOptions]
	push af
	ld a, [wd732]
	push af
	ld hl, wPlayerName
	ld bc, wBoxDataEnd - wPlayerName
	xor a
	call FillMemory
	ld hl, wSpriteDataStart
	ld bc, wSpriteDataEnd - wSpriteDataStart
	xor a
	call FillMemory
	pop af
	ld [wd732], a
	pop af
	ld [wOptions], a
	pop af
	ld [wLetterPrintingDelayFlags], a
	ld a, [wOptionsInitialized]
	and a
	call z, InitOptions
	; These debug names are used for StartNewGameDebug.
	; TestBattle uses the debug names from DebugMenu.
	ld hl, DebugNewGamePlayerName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, DebugNewGameRivalName
	ld de, wRivalName
	ld bc, NAME_LENGTH
	jp CopyData

OakSpeech:
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ld a, 0 ; BANK(Music_Routes2)
	ld c, a
	ld a, MUSIC_ROUTES2
	call PlayMusic
	call ClearScreen
	call LoadTextBoxTilePatterns
	call PrepareOakSpeech
	predef InitPlayerData2
	ld hl, wNumBoxItems
	ld a, POTION
	ld [wcf91], a
	ld a, 1
	ld [wItemQuantity], a
	call AddItemToInventory  ; give one potion
	ld a, [wDefaultMap]
	ld [wDestinationMap], a
	call SpecialWarpIn
	xor a
	ldh [hTileAnimations], a
	ld a, [wd732]
	bit 1, a ; possibly a debug mode bit
	jp nz, .skipChoosingNames
   	call ClearScreen ; clear the screen before resuming normal intro
	ld de, ProfOakPic
	lb bc, BANK(ProfOakPic), $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, OakSpeechText1
	call PrintText
	
.charChoice
	ld hl, BoyGirlText  ; added to the same file as the other oak text
  	call PrintText     ; show this text
  	call BoyGirlChoice ; added routine at the end of this file
   	ld a, [wCurrentMenuItem]
   	ld [wPlayerSex], a ; store player's gender. 00 for boy, 01 for girl, 02 for enby
	call GBFadeOutToWhite
	call ClearScreen
	
	ld de, RedPicFront
	lb bc, BANK(RedPicFront), $00
	ld a, [wPlayerSex] 	; check sex
	and a      				; check sex
	jr z, .NotGreen0
	ld de, EnbyPicFront
	lb bc, BANK(EnbyPicFront), $00
	cp a, 2
	jr z, .NotGreen0
	ld de, GreenPicFront
	lb bc, BANK(GreenPicFront), $00
.NotGreen0
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, IsThisOk
	call PrintText
	call YesNoChoice ; Do they want in?
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .charChoice
	
	call GBFadeOutToWhite
	call ClearScreen
	ld a, [wPlayerSex] ; Let's change the Nidorins based on the choice. It's really cute and makes use of an unused command sound.
	and a
	jr z, .Nidorino
	cp a, 2
	jr z, .Nidoreign
;	jr nz, .Nidorina
.Nidorina
	ld a, NIDORINA
	ld [wd0b5], a
	ld [wcf91], a
	call GetMonHeader
	hlcoord 6, 4
	call LoadFlippedFrontSpriteByMonIndex
	call MovePicLeft
	ld hl, OakSpeechText2Green
	jr .cont
.Nidorino
	ld a, NIDORINO
	ld [wd0b5], a
	ld [wcf91], a
	call GetMonHeader
	hlcoord 6, 4
	call LoadFlippedFrontSpriteByMonIndex
	call MovePicLeft
	ld hl, OakSpeechText2Red
	jr .cont
.Nidoreign
	ld a, NIDOREIGN
	ld [wd0b5], a
	ld [wcf91], a
	call GetMonHeader
	hlcoord 6, 4
	call LoadFlippedFrontSpriteByMonIndex
	call MovePicLeft
	ld hl, OakSpeechText2Enby

.cont
	call PrintText
	call GBFadeOutToWhite
	call ClearScreen
	ld de, RedPicFront
	lb bc, BANK(RedPicFront), $00
	ld a, [wPlayerSex] 	; load gender
	and a      				; check gender - and a is equivalent to `cp a, 0` (but faster)
						; if a=0->gender=male, ergo jump to the vanilla part of the code
	jr z, .ContinueWithOakIntro1
	cp a, 2					; check gender: if a=2->gender=enby, jump to the yellow subroutine, otherwise continue below
	jp z, .LoadEnbyPicFront1
	ld de, GreenPicFront
	lb bc, BANK(GreenPicFront), $00
	jr .ContinueWithOakIntro1
.LoadEnbyPicFront1
	ld de, EnbyPicFront
	lb bc, BANK(EnbyPicFront), $00
.ContinueWithOakIntro1:
	call IntroDisplayPicCenteredOrUpperRight
	call MovePicLeft
	ld hl, IntroducePlayerText
	call PrintText
	call ChoosePlayerName
	call GBFadeOutToWhite
	call ClearScreen
	ld de, Rival1Pic
	lb bc, BANK(Rival1Pic), $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, IntroduceRivalText
	call PrintText
	call ChooseRivalName
.skipChoosingNames
	call GBFadeOutToWhite
	call ClearScreen
	ld de, RedPicFront
	lb bc, BANK(RedPicFront), $00
	ld a, [wPlayerSex]   ; check sex
    and a      				; check sex
   	jr z, .NotGreen2
	ld de, EnbyPicFront
	lb bc, BANK(EnbyPicFront), $00
	cp a, 2
	jr z, .NotGreen2
    ld de, GreenPicFront
    lb bc, Bank(GreenPicFront), $00
.NotGreen2:
	call IntroDisplayPicCenteredOrUpperRight
	call GBFadeInFromWhite
	ld a, [wd72d]
	and a
	jr nz, .next
	ld hl, OakSpeechText3
	call PrintText
.next
	ldh a, [hLoadedROMBank]
	push af
	ld a, SFX_SHRINK
	call PlaySound
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld c, 4
	call DelayFrames
	ld de, RedSprite
	ld hl, vSprites
	lb bc, BANK(RedSprite), $0C
	ld a, [wPlayerSex] ; check sex
    and a      ; check sex
    jr z, .NotGreen3
	ld de, TealSprite
	lb bc, BANK(TealSprite), $0C
	cp a, 2
	jr z, .NotGreen3
    ld de,GreenSprite
    lb bc, BANK(GreenSprite), $0C
.NotGreen3:
   	ld hl, vSprites
   	call CopyVideoData
    ld de, ShrinkPic1
   	lb bc, BANK(ShrinkPic1), $00
   	call IntroDisplayPicCenteredOrUpperRight
	ld c, 4
	call DelayFrames
	ld de, ShrinkPic2
	lb bc, BANK(ShrinkPic2), $00
	call IntroDisplayPicCenteredOrUpperRight
	call ResetPlayerSpriteData
	ldh a, [hLoadedROMBank]
	push af
;	ld a, 0 ; BANK(Music_PalletTown)
;	ld [wAudioROMBank], a
;	ld [wAudioSavedROMBank], a

	ld a, 10
	ld [wMusicFade], a
	xor a
	ld [wMusicFadeID], a

	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld c, 20
	call DelayFrames
	hlcoord 6, 5
	ld b, 7
	ld c, 7
	call ClearScreenArea
	call LoadTextBoxTilePatterns
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld c, 50
	call DelayFrames
	call GBFadeOutToWhite
	jp ClearScreen
OakSpeechText1:
	text_far _OakSpeechText1
	text_end
OakSpeechText2Red: ; this is such a clunky way to do it but the text_asm way caused crashes
	text_far _OakSpeechText2A
	sound_cry_nidorino
	text_far _OakSpeechText2B
	text_end
OakSpeechText2Green:
	text_far _OakSpeechText2A
	sound_cry_nidorina
	text_far _OakSpeechText2B
	text_end
OakSpeechText2Enby:
	text_far _OakSpeechText2A
	sound_cry_nidoreign
	text_far _OakSpeechText2B
	text_end
IntroducePlayerText:
	text_far _IntroducePlayerText
	text_end
IntroduceRivalText:
	text_far _IntroduceRivalText
	text_end
OakSpeechText3:
	text_far _OakSpeechText3
	text_end

FadeInIntroPic:
	ld hl, IntroFadePalettes
	ld b, 6
.next
	ld a, [hli]
	ldh [rBGP], a
	ld c, 10
	call DelayFrames
	dec b
	jr nz, .next
	ret

IntroFadePalettes:
	db %01010100
	db %10101000
	db %11111100
	db %11111000
	db %11110100
	db %11100100

MovePicLeft:
	ld a, 119
	ldh [rWX], a
	call DelayFrame

	ld a, %11100100
	ldh [rBGP], a
.next
	call DelayFrame
	ldh a, [rWX]
	sub 8
	cp $FF
	ret z
	ldh [rWX], a
	jr .next

DisplayPicCenteredOrUpperRight:
	call GetPredefRegisters
IntroDisplayPicCenteredOrUpperRight:
; b = bank
; de = address of compressed pic
; c: 0 = centred, non-zero = upper-right
	push bc
	ld a, b
	call UncompressSpriteFromDE
	ld hl, sSpriteBuffer1
	ld de, sSpriteBuffer0
	ld bc, $310
	call CopyData
	ld de, vFrontPic
	call InterlaceMergeSpriteBuffers
	pop bc
	ld a, c
	and a
	hlcoord 15, 1
	jr nz, .next
	hlcoord 6, 4
.next
	xor a
	ldh [hStartTileID], a
	predef_jump CopyUncompressedPicToTilemap

; displays boy/girl choice
BoyGirlChoice::
	call SaveScreenTilesToBuffer1
	jr DisplayBoyGirlNoChoice

DisplayBoyGirlNoChoice::
	ld a, BOY_GIRL_NO
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, wTopMenuItemY
	ld a, 7
	ld [hli], a ; top menu item Y
	ld a, 13
	ld [hli], a ; top menu item X
	xor a
	ld [hli], a ; current menu item ID
	inc hl
	ld a, $2
	ld [hli], a ; wMaxMenuItem
;	ld a, B_BUTTON | A_BUTTON
	ld a, A_BUTTON
	ld [hli], a ; wMenuWatchedKeys
	xor a
	ld [hl], a ; wLastMenuItem
	call HandleMenuInput
;	bit BIT_B_BUTTON, a
;	jr nz, .defaultOption ; if B was pressed, assign enby
; A was pressed
	call PlaceUnfilledArrowMenuCursor
	ld a, [wCurrentMenuItem]
	jp LoadScreenTilesFromBuffer1
;.defaultOption
;	ld a, $02
;	ld [wCurrentMenuItem], a
;	jp LoadScreenTilesFromBuffer1

BoyGirlText: ; This is new so we had to add a reference to get it to compile
    text_far _BoyGirlText
    text_end

IsThisOk:
	text "Is this OK?"
	prompt
	text_end

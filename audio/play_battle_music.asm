PlayBattleMusic::
	xor a
	ld [wMusicFade], a
	ld [wLowHealthAlarm], a
	dec a ; SFX_STOP_ALL_MUSIC
;	ld [wNewSoundID], a
	call PlaySound
	call DelayFrame
	ld c, 0 ; BANK(Music_GymLeaderBattle)
	ld a, [wGymLeaderNo]
	and a
	jr z, .notGymLeaderBattle
	ld a, MUSIC_GYM_LEADER_BATTLE
	jr .playSong
.notGymLeaderBattle
	ld a, [wCurOpponent] ; This can probably be made better with a list thing but uhhh idk how to do it. seethe.
	cp MEWTWO ; Needs to be before OPP_ID_OFFSET to skip the wild check.
	jr z, .mewtwoBattle
	cp ARTICUNO
	jr z, .legendaryBattle
	cp ZAPDOS
	jr z, .legendaryBattle
	cp MOLTRES
	jr z, .legendaryBattle
	cp MEW
	jr z, .legendaryBattle
	cp OMEGADGE
	jr z, .legendaryBattle
	cp SNORLAX ; Just like LGPE. Snorlax is basically a legendary in RBY, so I love this.
	jr z, .legendaryBattle
	cp DRATINI ; In the Tajiri lore, the Dratini family is considered legendary. Also, we have a static Dragonite. I think the appearance of Dratini in the Safari Zone with this theme could also add some reeeeeal nice hype to the whole ordeal.
	jr z, .legendaryBattle
	cp DRAGONAIR
	jr z, .legendaryBattle
	cp DRAGONITE
	jr z, .legendaryBattle
	cp ARTICUNO_G
	jr z, .legendaryBattle
	cp ZAPDOS_G
	jr z, .legendaryBattle
	cp MOLTRES_G
	jr z, .legendaryBattle
	cp OPP_ID_OFFSET
	jr c, .wildBattle
	cp OPP_YUJIROU
	jr z, .Elite4Battle
	cp OPP_KOICHI
	jr z, .Elite4Battle
	cp OPP_LORELEI ; elite four now play the gym leader battle theme
	jr z, .Elite4Battle
	cp OPP_BRUNO
	jr z, .Elite4Battle
	cp OPP_AGATHA
	jr z, .Elite4Battle
	cp OPP_LANCE
	jr z, .Elite4Battle
	cp OPP_PROF_OAK ; could also use the final battle theme, but I think the gym leader/elite 4 theme fits better instead. I'm happy to change this if it isn't well-liked.
	jr z, .Elite4Battle 
	cp OPP_RIVAL3
	jr z, .finalBattle 
	cp OPP_CHIEF
	jr z, .finalBattle 
	jr nz, .normalTrainerBattle
.Elite4Battle
	ld a, MUSIC_GYM_LEADER_BATTLE
	jr .playSong
.normalTrainerBattle
	ld a, MUSIC_TRAINER_BATTLE
	jr .playSong
.finalBattle
	ld a, MUSIC_FINAL_BATTLE
	jr .playSong
.mewtwoBattle
	ld a, MUSIC_MEWTWO01
	jr .playSong
.legendaryBattle
	ld a, MUSIC_LEGENDARYBATTLE
	jr .playSong
.wildBattle
	ld a, MUSIC_WILD_BATTLE
.playSong
	jp PlayMusic

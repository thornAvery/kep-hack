_CaveGuy:: ; Used to describe GZap, but the beauty seemed funnier. Needed some lore for Garnet Cavern, if any.
	text "I've gone through"
	line "many caves in my"
	cont "day, but this one"
	cont "is taking the"
	cont "mickey!"
	
	para "Those #MON are"
	line "way too strong!"
	done

_Lover1::
	text "Here's the spot"
	line "where she first"
	cont "confessed to me."
	
	para "Now it's by far"
	line "my favorite place"
	cont "in all of KANTO!"
	
	para "Though, any place"
	line "seems perfect as"
	cont "long as she's by"
	cont "my side..."
	done

_Lover2::
	text "I absolutely love"
	line "visiting this"
	cont "TRAIL with my"
	cont "girlfriend!"
	
	para "Watching the sun"
	line "set as the waves"
	cont "gently roll by..."
	
	para "It's a beautiful"
	line "sight, but not as"
	cont "beautiful as her!"
	done

_BrunswickBattleText1::
	text "I'm searching"
	line "for rare bird"
	cont "#MON!"
	done

_BrunswickEndBattleText1::
	text "Not"
	line "enough..."
	prompt

_BrunswickAfterBattleText1::
	text "AERODACTYL is the"
	line "progenitor of"
	cont "birds."
	
	para "It's my prized"
	line "#MON!"
	done

_BrunswickBattleText2::
	text "My hubby brought"
	line "me here!"
	done

_BrunswickEndBattleText2::
	text "Ohh..."
	prompt

_BrunswickAfterBattleText2::
	text "I saw a bird"
	line "#MON with huge"
	cont "legs sprint past"
	cont "me!"
	
	para "It almost blew me"
	line "away! How rude!"
	done

_BrunswickBattleText3::
	text "The fish here are"
	line "huge!"
	done

_BrunswickEndBattleText3::
	text "Washed"
	line "up..."
	prompt

_BrunswickAfterBattleText3::
	text "Catching the fish"
	line "on this island"
	cont "is really hard!"
	
	para "The #MON are"
	line "so distracting!"
	done

_FakeTreeNoCut::
	text "This tree can be"
	line "CUT!"
	done

_FakeTreePrompt::
	text "This tree can be"
	line "CUT!"
	
	para "Would you like to"
	line "use CUT?"
	prompt

; The Cut script currently doesn't load what I want it to. Sp, I commented out the RAM and made it "you".
; For this to work, I need to make a special version of HasPartyMove.
_FakeTreeAttack::
	;text_ram wcd6d
	text "You tried"
	line "to hack away..."
	
	para "But it was a"
	line "CACTORMUS!"
	
	para "It retaliated in"
	line "a rage!"
	prompt

_TrailDirections::
	text "BRUNSWICK TRAIL"
	
	para "Go north for"
	line "CITRINE CITY!"

	para "Follow the path"
	line "to reach GARNET"
	cont "CAVERN!"

	para "Go northwest to"
	line "find BRUNSWICK"
	cont "GLADE!"
	done

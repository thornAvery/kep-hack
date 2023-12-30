_Route1ViridianMartSampleText::
	text "Hi! I work at a"
	line "#MON MART."

	para "It's a convenient"
	line "shop, so please"
	cont "visit us in"
	cont "VIRIDIAN CITY."

	para "I know, I'll give"
	line "you a sample!"
	cont "Here you go!"
	prompt

_Route1Text_1cae8::
	text "<PLAYER> got"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_Route1Text_1caee::
	text "We also carry"
	line "# BALLs for"
	cont "catching #MON!"
	done

_Route1Text_1caf3::
	text "You have too much"
	line "stuff with you!"
	done

_Route1Text2::
	text "See those ledges"
	line "along the road?"

	para "It's a bit scary,"
	line "but you can jump"
	cont "from them."

	para "You can get back"
	line "to PALLET TOWN"
	cont "quicker that way."
	done

_Route1Text3::
	text "ROUTE 1"
	line "PALLET TOWN -"
	cont "VIRIDIAN CITY"
	done

_OakFirstBattleText::
	text "OAK: Ah, yes!"
	line "<PLAYER>!"
	
	para "Good to see you!"
	
	para "The last time we"
	line "met here, you"
	cont "didn't even have"
	cont "your first"
	cont "#MON..."
	
	para "Anyway! <PLAYER>!"
	
	para "Your #MON"
	line "LEAGUE challenge"
	cont "has reignited"
	cont "a spirit that"
	cont "left me a long"
	cont "time ago..."
	
	para "How about we"
	line "spar a bit?"
	cont "What say you?"
	done

_OakBeforeBattleText::
	text "OAK: Oh, my!"
	
	para "It seems you"
	line "caught me during"
	cont "during my lunch"
	cont "hour!"
	
	para "Did you come for"
	line "a rematch?"
	done

_OakDefeatedText::
	text "Hmm..."
	
	para "I still have a"
	line "lot to learn!"
	prompt

_OakWonText::
	text "I still"
	line "have it!"
	prompt
	
_OakYes::
	text "Back in my day,"
	line "I was a serious"
	cont "trainer! Prepare"
	cont "yourself!"
	prompt

_OakNo::
	text "Another time,"
	line "then?"
	done
	
_OakFirstWin::
	text "OAK: I thought you"
	line "would fight more"
	cont "like AGATHA, but I"
	cont "see myself in"
	cont "you..."
	
	para "It reminds me of"
	line "the old days..."
	
	para "But, now is not"
	line "the time for"
	cont "that."
	
	para "<PLAYER>!"
	line "I have a gift for"
	cont "you."
	prompt

_ReceivedCitrinePassText::
	text "<PLAYER> received"
	line "the @"
	text_ram wStringBuffer
	text "!@"
	text_end

_OakCitrineExplain::
	text "This is a ticket"
	line "to CITRINE CITY."
	
	para "It's a place where"
	line "the best trainers"
	cont "go to become far"
	cont "stronger."
	
	para "Some strange bird"
	line "#MON are said"
	cont "to roost there,"
	cont "but they are so"
	cont "fast and vicious,"
	cont "few can even get"
	cont "close to them..."
	
	para "Perhaps you can"
	line "make history once"
	cont "again!"
	done

_OakTryAgain::
	text "OAK: Ok! Have you"
	line "made room in your"
	cont "BAG?"
	prompt

_OakBagFull::
	text "Ah! Your BAG is"
	line "full. Go back to"
	cont "your house and"
	cont "make room!"
	done

_OakBagStillFull::
	text "Ohoho, not so"
	line "fast! It's still"
	cont "full. Your PC can"
	cont "store items, yes?"
	done

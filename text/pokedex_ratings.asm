_DexCompletionText::
	text "#DEX comp-"
	line "letion is:"

	para "@"
	text_decimal hDexRatingNumMonsSeen, 1, 3
	text " #MON seen"
	line "@"
	text_decimal hDexRatingNumMonsOwned, 1, 3
	text " #MON owned"

	para "PROF.OAK's"
	line "Rating:"
	prompt

_DexRatingText_Own0To14::
	text "You still have"
	line "lots to do."
	cont "Look for #MON"
	cont "in grassy areas!"
	done

_DexRatingText_Own15To29::
	text "You're on the"
	line "right track! "
	cont "Get a FLASH HM"
	cont "from my AIDE!"
	done

_DexRatingText_Own30To49::
	text "Good, you're"
	line "trying hard!"
	cont "Get an ITEMFINDER"
	cont "from my AIDE!"
	done

_DexRatingText_Own50To64::
	text "Looking good!"
	line "Be sure to get"
	cont "EXP.ALL from my"
	cont "AIDE!"
	done

_DexRatingText_Own65To79::
	text "This is getting"
	line "even better!"
	done

_DexRatingText_Own80To99::
	text "Very good!"
	line "Go fish for some"
	cont "marine #MON!"
	done

_DexRatingText_Own100To114::
	text "You've finally got"
	line "over 100 species!"
	cont "Great job!"
	done

_DexRatingText_Own115To129::
	text "Wonderful!"
	line "Do you like to"
	cont "collect things?"
	done

_DexRatingText_Own130To149::
	text "You're over half-"
	line "way to completing"
	cont "the #DEX!"
	cont "Well done!"
	done

_DexRatingText_Own150To164::
	text "I'm impressed!"
	line "It must have been"
	cont "difficult to do!"
	done

_DexRatingText_Own165To179::
	text "You even have the"
	line "evolved forms of"
	cont "#MON! Super!"
	done

_DexRatingText_Own180To199::
	text "Excellent! Trade"
	line "with friends to"
	cont "get some more!"
	done

_DexRatingText_Own200To214::
	text "You finally passed"
	line "200 species!"
	cont "I can't believe"
	cont "how good you are!"
	done

_DexRatingText_Own215To229::
	text "Outstanding!"
	line "You've become a"
	cont "real pro at this!"
	done

_DexRatingText_Own230To249::
	text "I have nothing"
	line "left to say!"
	cont "You're the"
	cont "authority now!"
	done

_DexRatingText_OwnComplete::
	text "Your #DEX is"
	line "fully complete!"
	cont "Congratulations!"
	done

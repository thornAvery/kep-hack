_ProgrammerText::
	text "Me? I'm the"
	line "programmer!"
	done

_GraphicArtistText::
	text "I'm the graphic"
	line "artist!"
	cont "I drew you!"
	done

_WriterText::
	text "I wrote the story!"
	line "Isn't ERIKA cute?"

	para "I like MISTY a"
	line "lot too!"

	para "Oh, and SABRINA,"
	line "I like her!"
	done

_GameDesignerText::
	text "Is that right?"

	para "I'm the game"
	line "designer!"

	para "Filling up your"
	line "#DEX is tough,"
	cont "but don't quit!"

	para "When you finish,"
	line "come tell me!"
	done

_CompletedDexText::
	text "Wow! Excellent!"
	line "You completed"
	cont "your #DEX!"
	cont "Congratulations!"
	cont "...@"
	text_end

_CeladonMansion3Text5::
	text "It's the game"
	line "program! Messing"
	cont "with it could bug"
	cont "out the game!"
	done

_CeladonMansion3Text6::
	text "Someone's playing"
	line "a game instead of"
	cont "working!"
	done

_CeladonMansion3Text7::
	text "It's the script!"
	line "Better not look"
	cont "at the ending!"
	done

_CeladonMansion3Text8::
	text "GAME FREAK"
	line "Development Room"
	done

; Morimoto Boss Fight from LGPE.
; We use a mix of quotes from across the series, and adapt it to RBY jargon.
; Eg. Cooltrainer > Coach Trainer.

_CeladonMansionMorimotoGreeting:: ; LGPE
	text "I'm MORIMOTO."
	
	para "I help out all"
	line "the COOLTRAINERs."
;	cont "I have my reasons." this is insanely cringe it's off by ONE CHARACTER
	
	para "Do you really want"
	line "to battle me, the"
	cont "strongest COOL-"
	cont "TRAINER?"
	prompt

_CeladonMansionMorimotoFight:: ; LGPE
	text "Here I go!"
	prompt

_CeladonMansionMorimotoNo:: ; USUM
	text "Oh yeah?"
	
	para "Well, that's a"
	line "real shame. I'm"
	cont "really good,"
	cont "after all."
	done

_CeladonMansionMorimotoDefeated:: ; LGPE, compressed
	text "When"
	line "it comes down"
	cont "to it, you are"
	cont "still the best!"
	prompt

_CeladonMansionMorimotoWin:: ; BW/BW2, compressed & repositioned
	text "I am"
	line "the best, after"
	cont "all!"
	
	para "Just kidding!"
	prompt

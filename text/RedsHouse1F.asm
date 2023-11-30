_MomWakeUpText::
	text "MOM: Right."
	line "Everyone leaves"
	cont "home some day."
	cont "It said so on TV."

	para "PROF.OAK, next"
	line "door, is looking"
	cont "for you."
	done

_MomHealText1::
	text "MOM: <PLAYER>!"
	line "You should take a"
	cont "quick rest."
	prompt

_MomHealText2::
	text "MOM: Oh good!"
	line "You and your"
	cont "#MON are"
	cont "looking great!"
	cont "Take care now!"
	done

_StandByMeText::
	text "There's a movie"
	line "on TV. Four boys"
	cont "are walking on"
	cont "railroad tracks."

	para "I better go too."
	done

_TVWrongSideText::
	text "Oops, wrong side."
	done

_MomYoureBack::
	text "MOM: <PLAYER>!"
	line "Good morning!"
	
	para "I'm so proud of"
	line "you, dear! You've"
	cont "grown so much!"
	
	para "Oh! I nearly"
	line "forgot..."
	
	para "I received this"
	line "letter from SILPH"
	cont "CO. What does it"
	cont "say?"
	prompt

; I want the letter text to play when we use the letter, so it's gonna be like this.
_ReceivedChiefLetterText::
	text "<PLAYER> received"
	line "the @"
	text_ram wStringBuffer
	text "!@"
	text_end

_ChiefLetterText::
	text "Dear <PLAYER>!"
	line "You are cordially"
	cont "invited to my"
	cont "greatest event!"
	
	para "I call it...the"
	line "SILPH GAUNTLET!"
	
	para "I have called the"
	line "greatest trainers"
	cont "in all of KANTO!"
	
	para "Stronger than even" ; A sneaky trick - we can fit 18 characters, they just mess up the arrow.
	line "the ELITE FOUR!" ; Thus, the para avoids the visual artefacting.
	
	para "You will come to"
	line "SILPH CO., yes?"
	
	para "See you then!"
	line "    - CHIEF"
	prompt

_MomAmazing::
	text "Oh! Isn't this"
	line "amazing, sweetie?"
	
	para "I'm sure you'll do"
	line "great!"
	
	para "By the way, PROF."
	line "OAK was looking"
	cont "for you. He said"
	cont "he would be on"
	cont "ROUTE 1."
	
	para "I wonder why..."
	done

_MomBagFull::
	text "Oh, your BAG is"
	line "full! You must"
	cont "have had such an"
	cont "adventure!"
	
	para "Go upstairs and"
	line "sort it out. I" ; Made me smile making this GSC mom reference.
	cont "kept your room"
	cont "tidy!"
	done

_MomSavedIt::
	text "Did you sort out"
	line "your BAG?"
	
	para "You're just like"
	line "when you were"
	cont "ready to go!"
	
	para "Anyway, here's the"
	line "the LETTER. What"
	cont "does it say?"
	prompt

_MomBagStillFull::
	text "Silly! It's still"
	line "full! Go on, sort"
	cont "it out!"
	done

_SilphCoPresidentText::
	text "CHIEF: Thank"
	line "you for saving"
	cont "SILPH!"
	
	para "And...sorry about"
	line "that OMEGADGE."
	cont "It must have seen"
	cont "you as a threat."
	
	para "Anyway!"

	para "I will never"
	line "forget you saved"
	cont "us in our moment"
	cont "of peril!"

	para "I have to thank"
	line "you in some way!"

	para "Because I am rich,"
	line "I can give you"
	cont "anything!"

	para "Here, maybe this"
	line "will do!"
	prompt

_ReceivedSilphCoMasterBallText::
	text "<PLAYER> got a"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_SilphCo10Text_6231c::
	text "CHIEF: You"
	line "can't buy that"
	cont "anywhere!"

	para "It's our secret"
	line "prototype MASTER"
	cont "BALL!"

	para "It will catch any"
	line "#MON without"
	cont "fail!"

	para "You should be"
	line "quiet about using"
	cont "it, though."
	done

_SilphCoMasterBallNoRoomText::
	text "You have no"
	line "room for this."
	done

_SilphCo11Text2::
	text "SECRETARY: Thank"
	line "you for rescuing"
	cont "all of us!"

	para "Hmm? OMEGADGE?"
	
	para "All I know is the"
	line "CHIEF quickly"
	cont "started making it"
	cont "last year."
	
	done

_SilphCo11Text3::
	text "Ah <PLAYER>!"
	line "So we meet again!"

	para "The CHIEF and"
	line "I are discussing"
	cont "a vital business"
	cont "proposition."

	para "Keep your nose"
	line "out of grown-up"
	cont "matters..."

	para "Or, experience a"
	line "world of pain!"
	done

_SilphCo10Text_62330::
	text "Arrgh!!"
	line "I lost again!?"
	prompt

_SilphCo10Text_62335::
	text "Blast it all!"
	line "You ruined our"
	cont "plans for SILPH!"

	para "But, TEAM ROCKET"
	line "will never fall!"

	para "<PLAYER>! Never"
	line "forget that all"
	cont "#MON exist"
	cont "for TEAM ROCKET!"

	para "I must go, but I"
	line "shall return!"
	done

_SilphCo11BattleText1::
	text "Stop right there!"
	line "Don't you move!"
	done

_SilphCo11EndBattleText1::
	text "Don't..."
	line "Please!"
	prompt

_SilphCo11AfterBattleText1::
	text "So, you want to"
	line "see my BOSS?"
	done

_SilphCo11BattleText2::
	text "Halt! Do you have"
	line "an appointment"
	cont "with my BOSS?"
	done

_SilphCo11EndBattleText2::
	text "Gaah!"
	line "Demolished!"
	prompt

_SilphCo11AfterBattleText2::
	text "Watch your step,"
	line "my BOSS likes his"
	cont "#MON tough!"
	done

_SilphCo10Text_6237b::
	text "The monitor has"
	line "#MON on it!"
	done

_OmegaBattleText::
	text "Bzzt! Clank!"
	prompt

; Fun fact: For some reason, this text is stored in 10F. Seems to be a beta element - they ARE encountered in 11F.
_SilphCoJessieJamesText1::
	text "Hold it right"
	line "there, brat!@"
	text_end

_SilphCoJessieJamesText2::
	text "Our BOSS is in a"
	line "meeting!"

	para "You better not"
	line "disturb him!"
	done

_SilphCoJessieJamesText3::
	text "Like"
	line "always..."
	prompt

_SilphCoJessieJamesText4::
	text "TEAM ROCKET, blast"
	line "off at the speed"
	cont "of light!"

	para "Again...@"
	text_end

_SilphCo11FPorygonText::
	text "The monitor has"
	line "#MON on it!"
	prompt ; this fixes its strange scrolling issue


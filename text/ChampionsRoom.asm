_GaryChampionIntroText::
	text "<RIVAL>: Hey!"

	para "I was looking" ; this just barely works for a refight
	line "forward to seeing"
	cont "you, <PLAYER>!"

	para "My rival should"
	line "be strong to keep"
	cont "me sharp!"

	para "While working on"
	line "#DEX, I looked"
	cont "all over for"
	cont "powerful #MON!"

	para "Not only that, I"
	line "assembled teams"
	cont "that would beat"
	cont "any #MON type!"

	para "And now..."
	prompt

_GaryChampionIntroTextPart2::
	text "I'm the #MON"
	line "LEAGUE champion!"

	para "<PLAYER>! Do you"
	line "know what that"
	cont "means?"

	para "I'll tell you!"

	para "I am the most"
	line "powerful trainer"
	cont "in the world!"
	done

_GaryDefeatedText::
	text "NO!"
	line "That can't be!"
	cont "You beat my best!"

	para "After all that"
	line "work to become"
	cont "LEAGUE champ?"

	para "My reign is over"
	line "already?"
	cont "It's not fair!"
	prompt

_GaryVictoryText::
	text "Hahaha!"
	line "I won, I won!"

	para "I'm too good for"
	line "you, <PLAYER>!"

	para "You did well to"
	line "even reach me,"
	cont "<RIVAL>, the"
	cont "#MON genius!"

	para "Nice try, loser!"
	line "Hahaha!"
	prompt

_GaryText_76103::
	text "Why?"
	line "Why did I lose?"

	para "I never made any"
	line "mistakes raising"
	cont "my #MON..."

	para "Darn it! You're"
	line "the new #MON"
	cont "LEAGUE champion!"

	para "Although I don't"
	line "like to admit it."
	done

_GaryText2::
	text "OAK: <PLAYER>!"
	done

_GaryText_76120::
	text "OAK: So, you won!"
	line "Congratulations!"
	cont "You're the new"
	cont "#MON LEAGUE"
	cont "champion!"

	para "You've grown up so"
	line "much since you"
	cont "first left with"
	cont "@"
	text_ram wcd6d
	text "!"

	para "<PLAYER>, you have"
	line "come of age!"
	done

_GaryText_76125::
	text "OAK: <RIVAL>! I'm"
	line "disappointed!"

	para "I came when I"
	line "heard you beat"
	cont "the ELITE FOUR!"

	para "But, when I got"
	line "here, you had"
	cont "already lost!"

	para "<RIVAL>! Do you"
	line "understand why"
	cont "you lost?"

	para "You have forgotten"
	line "to treat your"
	cont "#MON with"
	cont "trust and love!"

	para "Without them, you"
	line "will never become"
	cont "a champ again!"
	done

_GaryText_7612a::
	text "OAK: <PLAYER>!"

	para "You understand"
	line "that your victory"
	cont "was not just your"
	cont "own doing!"

	para "The bond you share"
	line "with your #MON"
	cont "is marvelous!"

	para "<PLAYER>!"
	line "Come with me!"
	done

; this stuff is unused for now the champion room is kinda complicated
; may not use at all as this whole title defence thing was only rly started in gen 7
_BlueRematchText::
	text "uhhh"
	
	done

_BlueRematchEndBattleText::
	text "Aw man,"
	line "what was I"
	cont "doing?"
	prompt

_BlueRematchAfterBattleText::
	text "Tch..."
	
	para "As long as I can"
	line "battle strong"
	cont "trainers, I don't"
	cont "care what happens."
	
	para "You get what I"
	line "mean, right?"
	cont "You'd better come"
	cont "back again!"
	
	para "For now, though..."
	line "Go through."
	
	done

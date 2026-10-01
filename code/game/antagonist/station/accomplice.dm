GLOBAL_TYPED_NEW(accomplices, /datum/antagonist/accomplice)

// Crew recruited in-round by other antagonists. Every accomplice is a faction member (sub-antag) of this
// template, whoever recruited them, so they are handled the same way as in-round revolutionaries.
/datum/antagonist/accomplice
	id = MODE_ACCOMPLICE
	role_text = "Accomplice"
	role_text_plural = "Accomplices"
	welcome_text = "You have agreed to help an antagonist. You have no special equipment or objectives of your own: support the one who recruited you and follow their lead. You may recruit further accomplices."
	flags = ANTAG_RANDOM_EXCEPTED
	// No antag_indicator: accomplices are not marked on the HUD of other antagonists, or of each other.

	faction_role_text = "Accomplice"
	faction_descriptor = "conspiracy"
	faction_verb = /mob/living/proc/convert_to_accomplice
	faction_welcome = "You have agreed to help an antagonist. You have no special equipment or objectives of your own: support the one who recruited you and follow their lead. You may recruit further accomplices."
	faction_members_promotable = TRUE

	blacklisted_jobs = list(/datum/job/ai, /datum/job/cyborg, /datum/job/submap)

// Accomplices are always faction members, including ones added through the antag panel.
/datum/antagonist/accomplice/add_antagonist_mind(datum/mind/player, ignore_role, nonstandard_role_type, nonstandard_role_msg, bypass = FALSE)
	return ..(player, ignore_role, nonstandard_role_type || faction_role_text, nonstandard_role_msg || faction_welcome, bypass)

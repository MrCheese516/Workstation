/datum/unit_test/antag_faction_promotion_test
	name = "ANTAGONISTS: Only promotable sub-antags can be drafted into other antag roles"

/datum/unit_test/antag_faction_promotion_test/start_test()
	var/list/errors = list()
	var/mob/living/carbon/human/H = new(get_safe_turf())
	H.mind_initialize("TestKey[rand(0,10000)]")
	var/datum/mind/player = H.mind
	// The test mob has no client, so draft_antagonist() treats it as a ghost, which it only drafts from the antag pool.
	// Real lottery candidates always have a client.
	SSticker.antag_pool |= player

	// Plain crew.
	if(get_promotable_faction(player))
		errors += "A player with no antag role was treated as a promotable sub-antag."

	// Promotable sub-antag.
	GLOB.revs.add_antagonist_mind(player, TRUE, GLOB.revs.faction_role_text, GLOB.revs.faction_welcome)
	if(get_promotable_faction(player) != GLOB.revs)
		errors += "A [GLOB.revs.faction_role_text] was not treated as a promotable sub-antag."
	if(GLOB.traitors.draft_antagonist(player))
		errors += "A [GLOB.revs.faction_role_text] was drafted without allowing faction promotion."
	GLOB.traitors.reset_antag_selection()
	player.special_role = GLOB.revs.faction_role_text // In case the draft above wrongly succeeded and overwrote it.

	if(!GLOB.traitors.draft_antagonist(player, TRUE))
		errors += "A [GLOB.revs.faction_role_text] could not be drafted with faction promotion allowed."
	else
		GLOB.traitors.leave_factions_for_promotion(player)
		if(!GLOB.traitors.add_antagonist(player, 0, 1, 0, 1, 1))
			errors += "A drafted [GLOB.revs.faction_role_text] could not be added as a [GLOB.traitors.role_text]."
		if(player in GLOB.revs.current_antagonists)
			errors += "A promoted [GLOB.revs.faction_role_text] is still in the [GLOB.revs.faction_descriptor]."
		if(!(player in GLOB.traitors.current_antagonists) || player.special_role != GLOB.traitors.role_text)
			errors += "A promoted [GLOB.revs.faction_role_text] is not a [GLOB.traitors.role_text] (special role: [player.special_role])."
		// Full antags cannot be promoted again.
		if(get_promotable_faction(player))
			errors += "A full [GLOB.traitors.role_text] was treated as a promotable sub-antag."
	GLOB.traitors.reset_antag_selection()
	GLOB.traitors.remove_antagonist(player)
	GLOB.revs.remove_antagonist(player)

	// Non-promotable sub-antag.
	GLOB.wizards.add_antagonist_mind(player, TRUE, ANTAG_APPRENTICE, "Unit test")
	if(get_promotable_faction(player))
		errors += "A [ANTAG_APPRENTICE] was treated as a promotable sub-antag."
	if(GLOB.traitors.draft_antagonist(player, TRUE))
		errors += "A [ANTAG_APPRENTICE] was drafted with faction promotion allowed."
	GLOB.traitors.reset_antag_selection()
	GLOB.wizards.remove_antagonist(player)

	SSticker.antag_pool -= player
	qdel(H)

	if(length(errors))
		for(var/error in errors)
			log_bad(error)
		fail("Sub-antag promotion did not behave as expected.")
	else
		pass("Only promotable sub-antags could be drafted, and they left their faction when promoted.")
	return 1

/datum/unit_test/antag_recruit_verb_test
	name = "ANTAGONISTS: Antags recruit accomplices, except factions with their own recruits and excluded roles"

/datum/unit_test/antag_recruit_verb_test/start_test()
	var/list/recruit_verbs = list(/mob/living/proc/convert_to_accomplice, /mob/living/proc/convert_to_rev, /mob/living/proc/convert_to_loyalist)
	var/list/expected_verbs = list(
		MODE_REVOLUTIONARY = /mob/living/proc/convert_to_rev,
		MODE_LOYALIST = /mob/living/proc/convert_to_loyalist,
		MODE_CULTIST = null,
		MODE_ERT = null,
		MODE_DEATHSQUAD = null,
		MODE_ACTOR = null
	)
	var/list/errors = list()
	for(var/id in GLOB.all_antag_types_)
		var/datum/antagonist/antag = GLOB.all_antag_types_[id]
		var/expected_verb = (id in expected_verbs) ? expected_verbs[id] : /mob/living/proc/convert_to_accomplice
		var/mob/living/carbon/human/H = new(get_safe_turf())
		H.mind_initialize("TestKey[rand(0,10000)]")
		if(!antag.add_antagonist_mind(H.mind, TRUE, bypass = TRUE))
			errors += "[antag.role_text] ([id]): could not add the test mob."
			qdel(H)
			continue
		for(var/recruit_verb in recruit_verbs)
			var/has_verb = (recruit_verb in H.verbs)
			if(has_verb && recruit_verb != expected_verb)
				errors += "[antag.role_text] ([id]) has the recruit verb [recruit_verb], expected [expected_verb || "none"]."
			else if(!has_verb && recruit_verb == expected_verb)
				errors += "[antag.role_text] ([id]) does not have the recruit verb [recruit_verb]."
		antag.remove_antagonist(H.mind)
		for(var/recruit_verb in recruit_verbs)
			if(recruit_verb in H.verbs)
				errors += "[antag.role_text] ([id]) kept the recruit verb [recruit_verb] after being removed."
		qdel(H)

	if(length(errors))
		for(var/error in errors)
			log_bad(error)
		fail("Antag recruit verbs were not as expected.")
	else
		pass("All antags had the expected recruit verb.")
	return 1

/datum/unit_test/antag_accomplice_test
	name = "ANTAGONISTS: Accomplices are hidden, promotable sub-antags"

/datum/unit_test/antag_accomplice_test/start_test()
	var/list/errors = list()
	var/mob/living/carbon/human/H = new(get_safe_turf())
	H.mind_initialize("TestKey[rand(0,10000)]")
	var/datum/mind/player = H.mind
	// See antag_faction_promotion_test.
	SSticker.antag_pool |= player
	var/list/starting_contents = H.contents.Copy()

	// The same call convert_to_faction() makes when a player accepts.
	if(!GLOB.accomplices.add_antagonist_mind(player, 0, GLOB.accomplices.faction_role_text, GLOB.accomplices.faction_welcome))
		errors += "A crew member could not be made an accomplice."
	if(!(player in GLOB.accomplices.faction_members) || player.special_role != GLOB.accomplices.faction_role_text)
		errors += "An accomplice is not a faction member with the accomplice special role (special role: [player.special_role])."
	if(player_is_antag(player) != GLOB.accomplices)
		errors += "An accomplice does not count as an antagonist, so could be recruited again."
	if(GLOB.accomplices.antag_indicator || GLOB.accomplices.get_indicator(player, player))
		errors += "Accomplices have a HUD indicator."
	for(var/antag_type in GLOB.all_antag_types_)
		var/datum/antagonist/antag = GLOB.all_antag_types_[antag_type]
		if(antag != GLOB.accomplices && (player in antag.current_antagonists))
			errors += "An accomplice is also a member of [antag.role_text_plural], so would share their HUD."
	if(length(H.contents - starting_contents))
		errors += "An accomplice was given equipment."

	// Lottery promotion.
	if(get_promotable_faction(player) != GLOB.accomplices)
		errors += "An accomplice was not treated as a promotable sub-antag."
	else if(!GLOB.traitors.draft_antagonist(player, TRUE))
		errors += "An accomplice could not be drafted with faction promotion allowed."
	else
		GLOB.traitors.leave_factions_for_promotion(player)
		if(!GLOB.traitors.add_antagonist(player, 0, 1, 0, 1, 1))
			errors += "A drafted accomplice could not be added as a [GLOB.traitors.role_text]."
		if((player in GLOB.accomplices.current_antagonists) || !(player in GLOB.traitors.current_antagonists))
			errors += "A promoted accomplice did not move from the accomplices to the [GLOB.traitors.role_text_plural]."
		if(!(/mob/living/proc/convert_to_accomplice in H.verbs))
			errors += "A promoted accomplice lost the ability to recruit accomplices."
	GLOB.traitors.reset_antag_selection()
	GLOB.traitors.remove_antagonist(player)
	GLOB.accomplices.remove_antagonist(player)

	SSticker.antag_pool -= player
	qdel(H)

	if(length(errors))
		for(var/error in errors)
			log_bad(error)
		fail("Accomplices did not behave as expected.")
	else
		pass("Accomplices were hidden sub-antags without equipment, and could be promoted.")
	return 1

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

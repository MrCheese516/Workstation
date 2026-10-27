/datum/job/chief_steward
	title = "Head Steward"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	minimum_character_age = list(SPECIES_HUMAN = 28)
	ideal_character_age = 35
	economic_power = 6
	minimal_player_age = 7
	supervisors = "the Executive Officer"
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/service/chief_steward
	allowed_branches = list(
		/datum/mil_branch/nt/union
	)
	allowed_ranks = list(
		/datum/mil_rank/nt/deck/able
	)
	min_skill = list( // 9 points
		SKILL_BUREAUCRACY = SKILL_TRAINED, // 2 points
		SKILL_COOKING = SKILL_TRAINED, // 2 points
		SKILL_BOTANY = SKILL_BASIC, // 1 point
		SKILL_CHEMISTRY = SKILL_BASIC // 4 points
	)
	access = list(
		access_bridge,
		access_torch_fax,
		access_chief_steward,
		access_solgov_crew,
		access_radio_comm,
		access_radio_serv,
		access_emergency_storage,
		access_janitor,
		access_commissary,
		access_hydroponics,
		access_kitchen,
		access_o_mess
	)

/datum/job/chaplain
	title = "Chaplain"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	minimum_character_age = list(SPECIES_HUMAN = 24)
	ideal_character_age = 40
	economic_power = 6
	minimal_player_age = 0
	supervisors = "the Executive Officer"
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/service/chaplain
	allowed_branches = list(
		/datum/mil_branch/nt/union)
	allowed_ranks = list(
		/datum/mil_rank/nt/deck/spacer,
		/datum/mil_rank/nt/deck/able)
	min_skill = list( // 1 point
		SKILL_BUREAUCRACY = SKILL_BASIC, // 1 point
		SKILL_WEAPONS = SKILL_UNSKILLED // Fleet chaplains may refuse weapon training
	)

	access = list(
		access_morgue, access_chapel_office,
		access_crematorium, access_solgov_crew,
		access_radio_serv
	)

/datum/job/janitor
	title = "Sanitation Technician"
	department = "Service"
	department_flag = SRV
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Steward"
	minimum_character_age = list(SPECIES_HUMAN = 20)
	ideal_character_age = 20
	alt_titles = list(
		"Custodian",
		"Janitor")
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/service/janitor
	allowed_branches = list(
		/datum/mil_branch/nt/union
	)
	allowed_ranks = list(
		/datum/mil_rank/nt/deck/spacer
	)
	min_skill = list( // 1 point
		SKILL_HAULING = SKILL_BASIC // 1 point
	)

	access = list(
		access_maint_tunnels, access_emergency_storage,
		access_janitor, access_solgov_crew,
		access_radio_serv
	)


/datum/job/chef
	title = "Steward"
	department = "Service"
	department_flag = SRV
	total_positions = 2
	spawn_positions = 2
	minimum_character_age = list(SPECIES_HUMAN = 20)
	supervisors = "the Chief Steward"
	alt_titles = list(
		"Bartender",
		"Cook",
		"Culinary Specialist"
	)
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/service/cook
	allowed_branches = list(
		/datum/mil_branch/nt/union
	)
	allowed_ranks = list(
		/datum/mil_rank/nt/deck/spacer
	)
	min_skill = list( // 7 points
		SKILL_BOTANY = SKILL_BASIC, // 1 point
		SKILL_CHEMISTRY = SKILL_BASIC, // 4 points
		SKILL_COOKING = SKILL_TRAINED // 2 points
	)
	access = list(
		access_commissary,
		access_hydroponics,
		access_kitchen,
		access_radio_serv,
		access_solgov_crew,
		access_o_mess
	)


/datum/job/crew
	title = "Crewman"
	department = "Service"
	department_flag = SRV
	total_positions = 5
	spawn_positions = 5
	supervisors = "the Chief Steward"
	minimum_character_age = list(SPECIES_HUMAN = 20)
	ideal_character_age = 20
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/service/crewman
	allowed_branches = list(
		/datum/mil_branch/nt/union
	)
	allowed_ranks = list(
		/datum/mil_rank/nt/deck/spacer
	)

	access = list(
		access_maint_tunnels, access_emergency_storage,
		access_solgov_crew, access_radio_serv
	)

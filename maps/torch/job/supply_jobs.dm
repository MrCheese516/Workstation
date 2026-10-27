/datum/job/qm
	title = "Quartermaster"
	department = "Supply"
	department_flag = SUP
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Executive Officer"
	selection_color = "#bb9040"
	economic_power = 5
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 27)
	ideal_character_age = 35
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/supply/deckofficer
	allowed_branches = list(
		/datum/mil_branch/nt/union
	)
	allowed_ranks = list(
		/datum/mil_rank/nt/deck/able
	)
	skill_points = 24
	min_skill = list( // 9 points
		SKILL_BUREAUCRACY = SKILL_TRAINED, // 2 points
		SKILL_FINANCE = SKILL_BASIC, // 1 point
		SKILL_HAULING = SKILL_BASIC, // 1 point
		SKILL_EVA = SKILL_BASIC, // 1 point
		SKILL_PILOT = SKILL_BASIC, // 2 points
		SKILL_MECH = SKILL_BASIC // 2 points
	)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)

	access = list(
		access_maint_tunnels, access_bridge, access_emergency_storage, access_tech_storage,  access_cargo, access_guppy_helm,
		access_cargo_bot, access_qm, access_mailsorting, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar,
		access_mining, access_mining_office, access_mining_station, access_commissary, access_teleporter, access_eva, access_torch_fax,
		access_radio_sup, access_radio_exp, access_radio_comm
	)

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/cargo_tech
	title = "Deck Technician"
	department = "Supply"
	department_flag = SUP
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Quartermaster"
	selection_color = "#bb9040"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 24
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/supply/tech
	allowed_branches = list(
		/datum/mil_branch/nt/union
	)
	allowed_ranks = list(
		/datum/mil_rank/nt/deck/spacer
	)
	min_skill = list( // 5 points
		SKILL_BUREAUCRACY = SKILL_BASIC, // 1 point
		SKILL_FINANCE = SKILL_BASIC, // 1 point
		SKILL_HAULING = SKILL_BASIC, // 1 point
		SKILL_MECH =	SKILL_BASIC // 2 points
	)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)

	access = list(
		access_maint_tunnels, access_emergency_storage, access_cargo, access_guppy_helm,
		access_cargo_bot, access_mailsorting, access_solgov_crew, access_expedition_shuttle,
		access_guppy, access_hangar, access_commissary, access_radio_sup
	)

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/acquisition_tech
	title = "Acquisitions Tech"
	department = "Supply"
	department_flag = SUP
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Acquisitions Boss"
	selection_color = "#bb9040"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 20
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/supply/acquisitions
	allowed_branches = list(/datum/mil_branch/nt/union)

	allowed_ranks = list(
		/datum/mil_rank/nt/deck/spacer
	)
	min_skill = list( // 1 point
		SKILL_EVA = SKILL_TRAINED, // 2 points
		SKILL_PILOT = SKILL_BASIC // 2 points
	)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERIENCED,
	                    SKILL_WEAPONS     = SKILL_EXPERIENCED)

	access = list(
		access_acquis, access_maint_tunnels, access_eva, access_emergency_storage,
		access_guppy_helm, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar,
		access_petrov, access_petrov_maint, access_research, access_radio_exp, access_mining,
		access_mining_office, access_mining_station, access_radio_sup
	)

	software_on_spawn = list(/datum/computer_file/program/deck_management)

/datum/job/acquisition_tech/get_description_blurb()
	return "You are an Acquisitions Tech. Your duty is to go on expeditions to away sites. The Acquisitions Boss is your team leader. You are to look for anything of economic or scientific interest to the crew - mineral deposits, weaponry, electronics, cash, and even alien artifacts. You will also likely encounter hazardous environments, aggressive wildlife or malfunctioning defense systems, so tread carefully."


/datum/job/acquisition_boss
	title = "Acquisitions Boss"
	department = "Supply"
	department_flag = SUP
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Bosun"
	selection_color = "#bb9040"
	minimal_player_age = 1
	economic_power = 10
	minimum_character_age = list(SPECIES_HUMAN = 25)
	ideal_character_age = 35
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/supply/acquisitions/acquisition_boss
	allowed_branches = list(/datum/mil_branch/nt/union)
	allowed_ranks = list(
		/datum/mil_rank/nt/deck/able
	)
	skill_points = 28
	min_skill = list( // 9 points
		SKILL_BUREAUCRACY = SKILL_BASIC, // 1 point
		SKILL_EVA = SKILL_TRAINED, // 2 points
		SKILL_SCIENCE = SKILL_BASIC, // 2 points
		SKILL_PILOT = SKILL_TRAINED // 2 points
	)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERIENCED,
	                    SKILL_WEAPONS     = SKILL_EXPERIENCED)

	access = list(
		access_acquis_boss, access_acquis, access_eva, access_maint_tunnels, access_bridge, access_emergency_storage,
		access_guppy_helm, access_solgov_crew, access_expedition_shuttle, access_expedition_shuttle_helm,
		access_guppy, access_hangar, access_petrov, access_petrov_helm, access_petrov_analysis, access_petrov_phoron,
		access_petrov_toxins, access_petrov_chemistry, access_petrov_maint, access_tox, access_tox_storage, access_research,
		access_xenobiology, access_xenoarch, access_torch_fax, access_radio_comm,
		access_radio_exp, access_radio_sci, access_research_storage, access_radio_sup
	)

	software_on_spawn = list(/datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/acquisition_boss/get_description_blurb()
	return "You are the Acquisitions Boss. Your duty is to organize and lead the expeditions to away sites. You command Acquisitions Technicians. You make sure that expedition has the supplies and personnel it needs. Once on the away mission, your duty is to ensure the quality and quantity of the haul, as well as the safety of your acquisitions team."

/datum/job/scientist
	title = "Scientist"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the Research Director"
	economic_power = 10
	minimum_character_age = list(SPECIES_HUMAN = 25)
	ideal_character_age = 45
	minimal_player_age = 0
	alt_titles = list(
		"Xenoarcheologist",
		"Anomalist",
		"Researcher",
		"Xenobiologist",
		"Xenobotanist"
	)
	skill_points = 26
	min_skill = list( // 6 points
		SKILL_BUREAUCRACY = SKILL_BASIC, // 1 point
		SKILL_COMPUTER = SKILL_BASIC, // 1 point
		SKILL_DEVICES = SKILL_BASIC, // 2 points
		SKILL_SCIENCE = SKILL_TRAINED // 2 points
	)

	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/research/scientist
	allowed_branches = list(
		/datum/mil_branch/nt
	)
	allowed_ranks = list(
		/datum/mil_rank/nt/research/researcher
	)

	access = list(
		access_tox, access_tox_storage, access_research, access_petrov, access_petrov_helm,
		access_mining_office, access_mining_station, access_xenobiology, access_guppy_helm,
		access_xenoarch, access_nanotrasen, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar,
		access_petrov_analysis, access_petrov_phoron, access_petrov_toxins, access_petrov_chemistry, access_petrov_control, access_torch_fax,
		access_petrov_maint, access_radio_sci, access_radio_exp, access_research_storage, access_fabrication
	)
	possible_goals = list(/datum/goal/achievement/notslimefodder)

/datum/job/scientist_assistant
	title = "Research Assistant"
	department = "Science"
	department_flag = SCI
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Research Director and science personnel"
	selection_color = "#633d63"
	economic_power = 3
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 30
	alt_titles = list(
		"Testing Assistant",
		"Intern",
		"Clerk",
		"Field Assistant")

	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/research
	allowed_branches = list(
		/datum/mil_branch/nt
	)
	allowed_ranks = list(
		/datum/mil_rank/nt/research/researcher
	)
	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

	access = list(
		access_tox, access_tox_storage, access_research, access_petrov,
		access_mining_office, access_mining_station, access_xenobiology, access_guppy_helm,
		access_xenoarch, access_nanotrasen, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar,
		access_petrov_analysis, access_petrov_phoron, access_petrov_toxins, access_petrov_chemistry, access_petrov_control,
		access_radio_sci, access_radio_exp, access_research_storage, access_fabrication
	)
	possible_goals = list(/datum/goal/achievement/notslimefodder)

/datum/job/submap
	branch = /datum/mil_branch/civilian
	rank =   /datum/mil_rank/civ/civ
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/civ)
	required_language = null

/datum/map/torch
	branch_types = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet,
		/datum/mil_branch/civilian,
		/datum/mil_branch/solgov,
		/datum/mil_branch/nap,
		/datum/mil_branch/mops,
		/datum/mil_branch/css,
		/datum/mil_branch/alien,
		/datum/mil_branch/skrell_fleet,
		/datum/mil_branch/iccgn,
		/datum/mil_branch/scga,
		/datum/mil_branch/auf,
		/datum/mil_branch/nt,
		/datum/mil_branch/nt/union,
		/datum/mil_branch/nt/security,
	)

	spawn_branch_types = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet,
		/datum/mil_branch/civilian,
		/datum/mil_branch/solgov,
		/datum/mil_branch/nap,
		/datum/mil_branch/mops,
		/datum/mil_branch/css,
		/datum/mil_branch/alien,
		/datum/mil_branch/skrell_fleet,
		/datum/mil_branch/iccgn,
		/datum/mil_branch/scga,
		/datum/mil_branch/auf,
		/datum/mil_branch/nt,
		/datum/mil_branch/nt/union,
		/datum/mil_branch/nt/security,
	)

	species_to_branch_blacklist = list(
		/singleton/species/human   = list(/datum/mil_branch/alien, /datum/mil_branch/skrell_fleet),
		/singleton/species/machine = list(/datum/mil_branch/alien, /datum/mil_branch/skrell_fleet),
		/singleton/species/vox     = list(
			/datum/mil_branch/expeditionary_corps,
			/datum/mil_branch/fleet,
			/datum/mil_branch/civilian,
			/datum/mil_branch/solgov,
			/datum/mil_branch/skrell_fleet
		)
	)

	species_to_branch_whitelist = list(
		/singleton/species/diona        = list(/datum/mil_branch/civilian),
		/singleton/species/nabber       = list(/datum/mil_branch/civilian),
		/singleton/species/skrell       = list(/datum/mil_branch/civilian, /datum/mil_branch/expeditionary_corps, /datum/mil_branch/skrell_fleet),
		/singleton/species/unathi       = list(/datum/mil_branch/civilian, /datum/mil_branch/expeditionary_corps),
		/singleton/species/unathi/yeosa = list(/datum/mil_branch/civilian, /datum/mil_branch/expeditionary_corps),
		/singleton/species/adherent     = list(/datum/mil_branch/civilian),
		/singleton/species/vox          = list(/datum/mil_branch/alien)
	)

	species_to_rank_blacklist = list(
		/singleton/species/machine = list(
			/datum/mil_branch/solgov = list(
				/datum/mil_rank/nap/agent
			)
		)
	)

	species_to_rank_whitelist = list(
		/singleton/species/machine = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5,
				/datum/mil_rank/ec/e7,
				/datum/mil_rank/ec/o1
			),
			/datum/mil_branch/fleet = list(
				/datum/mil_rank/fleet/e1,
				/datum/mil_rank/fleet/e2,
				/datum/mil_rank/fleet/e3,
				/datum/mil_rank/fleet/e4,
				/datum/mil_rank/fleet/e5,
				/datum/mil_rank/fleet/e6,
				/datum/mil_rank/fleet/e7,
				/datum/mil_rank/fleet/o1
			)
		),
		/singleton/species/skrell = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5,
				/datum/mil_rank/ec/e7,
				/datum/mil_rank/ec/o1
			)
		),
		/singleton/species/unathi = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5
			)
		),
		/singleton/species/unathi/yeosa = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5
			)
		),
		/singleton/species/vox = list(
			/datum/mil_branch/alien = list(
				/datum/mil_rank/alien
			)
		)
	)

/*
 *  Branches
 *  ========
 */

/datum/mil_branch/expeditionary_corps
	name = "Expeditionary Corps"
	name_short = "SCGEC"
	email_domain = "torch.ec.scg"

	rank_types = list(
		/datum/mil_rank/ec/e3,
		/datum/mil_rank/ec/e5,
		/datum/mil_rank/ec/e7,
		/datum/mil_rank/ec/o1,
		/datum/mil_rank/ec/o3,
		/datum/mil_rank/ec/o5,
		/datum/mil_rank/ec/o6,
		/datum/mil_rank/ec/o8,
		/datum/mil_rank/ec/o10
	)

	spawn_rank_types = list(
		/datum/mil_rank/ec/e3,
		/datum/mil_rank/ec/e5,
		/datum/mil_rank/ec/e7,
		/datum/mil_rank/ec/o1,
		/datum/mil_rank/ec/o3,
		/datum/mil_rank/ec/o5,
		/datum/mil_rank/ec/o6
	)

	assistant_job = /datum/job/crew

	min_skill = list( // 4 points
		SKILL_HAULING = SKILL_BASIC, // 1 point
		SKILL_SCIENCE = SKILL_BASIC, // 2 points
		SKILL_EVA = SKILL_BASIC // 1 point
	)

/datum/mil_branch/fleet
	name = "Fleet"
	name_short = "SCGF"
	email_domain = "torch.fleet.mil"

	rank_types = list(
		/datum/mil_rank/fleet/e1,
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8,
		/datum/mil_rank/fleet/e9,
		/datum/mil_rank/fleet/e9_alt1,
		/datum/mil_rank/fleet/e9_alt2,
		/datum/mil_rank/fleet/e9_alt3,
		/datum/mil_rank/fleet/e9_alt4,
		/datum/mil_rank/fleet/o1,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4,
		/datum/mil_rank/fleet/o5,
		/datum/mil_rank/fleet/o6,
		/datum/mil_rank/fleet/o7,
		/datum/mil_rank/fleet/o8,
		/datum/mil_rank/fleet/o9,
		/datum/mil_rank/fleet/o10,
		/datum/mil_rank/fleet/o10_alt
	)

	spawn_rank_types = list(
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8,
		/datum/mil_rank/fleet/e9,
		/datum/mil_rank/fleet/e9_alt1,
		/datum/mil_rank/fleet/o1,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4,
		/datum/mil_rank/fleet/o5
	)

	assistant_job = /datum/job/crew
	min_skill = list( // 4 points
		SKILL_HAULING = SKILL_BASIC, // 1 point
		SKILL_WEAPONS = SKILL_BASIC, // 2 points
		SKILL_EVA = SKILL_BASIC // 1 point
	)


/datum/mil_branch/civilian
	name = "Civilian"
	name_short = "Civ"
	email_domain = "freemail.net"
	allow_custom_email = TRUE

	rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/contractor,
		/datum/mil_rank/civ/synthetic
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/contractor,
		/datum/mil_rank/civ/synthetic
	)

/datum/mil_branch/solgov
	name = "Solar Confederation Employee"
	name_short = "GOVT"
	email_domain = "torch.sc"

	rank_types = list(
		/datum/mil_rank/sol/gov,
	)


	spawn_rank_types = list(
		/datum/mil_rank/sol/gov,
	)

/datum/mil_branch/nap

	name = "National Associated Police"
	name_short = "NAP"
	email_domain = "torch.nap"

	rank_types = list(
		/datum/mil_rank/nap/agent
	)


	spawn_rank_types = list(
		/datum/mil_rank/nap/agent
	)

/datum/mil_branch/mops

	name = "Ministry of Public Safety"
	name_short = "MoPS"
	email_domain = "torch.mops"

	rank_types = list(
		/datum/mil_rank/mops/agent
	)


	spawn_rank_types = list(
		/datum/mil_rank/mops/agent
	)

/datum/mil_branch/css

	name = "Cryptography and Signals Service"
	name_short = "CSS"
	email_domain = "torch.css"

	rank_types = list(
		/datum/mil_rank/css/agent
	)


	spawn_rank_types = list(
		/datum/mil_rank/css/agent
	)

/datum/mil_branch/nt
	name = "NanoTrasen Employee"
	name_short = "NT"
	email_domain = "NTmail.net"
	allow_custom_email = TRUE

	rank_types = list(
		/datum/mil_rank/nt/med/chief,
		/datum/mil_rank/nt/med/surgeon,
		/datum/mil_rank/nt/med/surgeon_mate,
		/datum/mil_rank/nt/research/chief,
		/datum/mil_rank/nt/research/researcher,
		/datum/mil_rank/nt/liaison
	)

	spawn_rank_types = list(
		/datum/mil_rank/nt/med/chief,
		/datum/mil_rank/nt/med/surgeon,
		/datum/mil_rank/nt/med/surgeon_mate,
		/datum/mil_rank/nt/research/chief,
		/datum/mil_rank/nt/research/researcher,
		/datum/mil_rank/nt/liaison
	)

/datum/mil_branch/nt/union
	name = "Unionized Spacefarer"
	name_short = "UN"

	rank_types = list(
		/datum/mil_rank/nt/deck/captain,
		/datum/mil_rank/nt/deck/first_mate,
		/datum/mil_rank/nt/deck/second_mate,
		/datum/mil_rank/nt/deck/third_mate,
		/datum/mil_rank/nt/deck/chief,
		/datum/mil_rank/nt/deck/able,
		/datum/mil_rank/nt/deck/spacer,
		/datum/mil_rank/nt/eng/chief,
		/datum/mil_rank/nt/eng/second_engineer,
		/datum/mil_rank/nt/eng/third_engineer,
		/datum/mil_rank/nt/eng/fourth_engineer,
		/datum/mil_rank/nt/eng/trainee
	)

	spawn_rank_types = list(
		/datum/mil_rank/nt/deck/captain,
		/datum/mil_rank/nt/deck/first_mate,
		/datum/mil_rank/nt/deck/second_mate,
		/datum/mil_rank/nt/deck/third_mate,
		/datum/mil_rank/nt/deck/chief,
		/datum/mil_rank/nt/deck/able,
		/datum/mil_rank/nt/deck/spacer,
		/datum/mil_rank/nt/eng/chief,
		/datum/mil_rank/nt/eng/second_engineer,
		/datum/mil_rank/nt/eng/third_engineer,
		/datum/mil_rank/nt/eng/fourth_engineer,
		/datum/mil_rank/nt/eng/trainee
	)

/datum/mil_branch/nt/security
	name = "Private Security Contractor"
	name_short = "PMC"

	rank_types = list(
		/datum/mil_rank/nt/sec/chief,
		/datum/mil_rank/nt/sec/sergeant,
		/datum/mil_rank/nt/sec/constable
	)

	spawn_rank_types = list(
		/datum/mil_rank/nt/sec/chief,
		/datum/mil_rank/nt/sec/sergeant,
		/datum/mil_rank/nt/sec/constable
	)

//This variable returns decimal values for alt-ranks, but isn't player facing.
/datum/mil_rank/grade()
	. = ..()
	if(!sort_order)
		return ""
	if(sort_order <= 100)
		return "E-[floor(sort_order / 10)]"
	return "O-[floor((sort_order - 100) / 10)]"

// Within the scope of the Torch, this is the only necessary differentiation.
/datum/mil_rank/rank_category()
	. = ..()
	if(!sort_order)
		return null
	if(sort_order <= 100)
		return GET_SINGLETON(/singleton/rank_category/enlisted)
	else
		return GET_SINGLETON(/singleton/rank_category/commissioned)

/singleton/rank_category/enlisted
	name = "Enlisted"

/singleton/rank_category/commissioned
	name = "Commissioned"
	add_accesses = list(access_o_mess)

/*
 *  Fleet
 *  =====
 */

/datum/mil_rank/fleet/e1
	name = "Crewman Recruit"
	name_short = "CR"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 10

/datum/mil_rank/fleet/e2
	name = "Crewman Apprentice"
	name_short = "CA"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e2, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 20

/datum/mil_rank/fleet/e3
	name = "Crewman"
	name_short = "CN"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e3, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 30

/datum/mil_rank/fleet/e4
	name = "Petty Officer Third Class"
	name_short = "PO3"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e4, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 40

/datum/mil_rank/fleet/e5
	name = "Petty Officer Second Class"
	name_short = "PO2"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e5, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 50

/datum/mil_rank/fleet/e6
	name = "Petty Officer First Class"
	name_short = "PO1"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e6, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 60

/datum/mil_rank/fleet/e7
	name = "Chief Petty Officer"
	name_short = "CPO"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e7, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 70

/datum/mil_rank/fleet/e8
	name = "Senior Chief Petty Officer"
	name_short = "SCPO"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e8, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 80

/datum/mil_rank/fleet/e9
	name = "Master Chief Petty Officer"
	name_short = "MCPO"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e9, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 90

/datum/mil_rank/fleet/e9_alt1
	name = "Command Master Chief Petty Officer"
	name_short = "CMCPO"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e9_alt1, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 91

/datum/mil_rank/fleet/e9_alt2
	name = "Fleet Master Chief Petty Officer"
	name_short = "FLTCM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e9_alt2, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 92

/datum/mil_rank/fleet/e9_alt3
	name = "Force Master Chief Petty Officer"
	name_short = "FORCM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e9_alt3, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 93

/datum/mil_rank/fleet/e9_alt4
	name = "Master Chief Petty Officer of the Fleet"
	name_short = "MCPOF"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e9_alt4, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 94

/datum/mil_rank/fleet/o1
	name = "Ensign"
	name_short = "ENS"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/officer, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 110

/datum/mil_rank/fleet/o2
	name = "Sub-lieutenant"
	name_short = "SLT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/officer/o2, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 120

/datum/mil_rank/fleet/o3
	name = "Lieutenant"
	name_short = "LT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/officer/o3, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 130

/datum/mil_rank/fleet/o4
	name = "Lieutenant Commander"
	name_short = "LCDR"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/officer/o4, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 140

/datum/mil_rank/fleet/o5
	name = "Commander"
	name_short = "CDR"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/officer/o5, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 150

/datum/mil_rank/fleet/o6
	name = "Captain"
	name_short = "CAPT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/officer/o6, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 160

/datum/mil_rank/fleet/o7
	name = "Commodore"
	name_short = "CDRE"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/flag, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 170

/datum/mil_rank/fleet/o8
	name = "Rear Admiral"
	name_short = "RADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/flag/o8, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 180

/datum/mil_rank/fleet/o9
	name = "Vice Admiral"
	name_short = "VADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/flag/o9, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 190

/datum/mil_rank/fleet/o10
	name = "Admiral"
	name_short = "ADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/flag/o10, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 200

/datum/mil_rank/fleet/o10_alt
	name = "Fleet Admiral"
	name_short = "FADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/flag/o10_alt, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 201


/*
 *  EC
 *  =====
 */
/datum/mil_rank/ec/e1
	name = "Apprentice Explorer"
	name_short = "AXPL"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/enlisted)
	sort_order = 10

/datum/mil_rank/ec/e3
	name = "Explorer"
	name_short = "XPL"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/enlisted/e3)
	sort_order = 30

/datum/mil_rank/ec/e5
	name = "Senior Explorer"
	name_short = "SXPL"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/enlisted/e5)
	sort_order = 50

/datum/mil_rank/ec/e7
	name = "Chief Explorer"
	name_short = "CXPL"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/enlisted/e7)
	sort_order = 70

/datum/mil_rank/ec/o1
	name = "Ensign"
	name_short = "ENS"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/officer)
	sort_order = 110

/datum/mil_rank/ec/o3
	name = "Lieutenant"
	name_short = "LT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/officer/o3)
	sort_order = 130

/datum/mil_rank/ec/o5
	name = "Commander"
	name_short = "CDR"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/officer/o5)
	sort_order = 150

/datum/mil_rank/ec/o6
	name = "Captain"
	name_short = "CAPT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/officer/o6)
	sort_order = 160

/datum/mil_rank/ec/o8
	name = "Admiral"
	name_short = "ADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/officer/o8)
	sort_order = 180

/datum/mil_rank/ec/o10
	name = "Commandant of the Expeditionary Corps"
	name_short = "CMDT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/officer/o10)
	sort_order = 200

/*
 *  Civilians
 *  =========
 */

/datum/mil_rank/civ/civ
	name = "Civilian"

/datum/mil_rank/civ/contractor
	name = "Freelancer"

/datum/mil_rank/civ/synthetic
	name = "Synthetic"

/*
 *  SolGov Employees
 *  ====== =========
 */

/datum/mil_rank/sol/gov
	name = "Justice"
	accessory = list(/obj/item/clothing/accessory/badge/solgov/representative)

/datum/mil_rank/nap/agent
	name = "Deputy Marshal"
	name_short = "AGT"
	accessory = list(/obj/item/clothing/accessory/badge/agent)

/datum/mil_rank/mops/agent
	name = "Special Agent"
	name_short = "AGT"
	accessory = list(/obj/item/clothing/accessory/badge/agent/mops)

/datum/mil_rank/css/agent
	name = "Field Agent"
	name_short = "AGT"
	accessory = list(/obj/item/clothing/accessory/badge/agent/css)

/datum/mil_rank/sol/scientist
	name = "Government Scientist"
	name_short = "GOVT"

// Vox/foreign alien branch.
/datum/mil_branch/alien
	name = "Alien"
	name_short = "Alien"
	rank_types = list(/datum/mil_rank/alien)
	spawn_rank_types = list(/datum/mil_rank/alien)

/datum/mil_rank/alien
	name = "Alien"

/datum/mil_rank/nt/liaison
	name = "Liaison"

/datum/mil_rank/nt/contractor
	name = "General Contractor"

/datum/mil_rank/nt/deck/captain
	name = "Captain"
	name_short = "CAPT"

/datum/mil_rank/nt/deck/first_mate
	name = "First Officer"
	name_short = "1OF"

/datum/mil_rank/nt/deck/second_mate
	name = "Second Officer"
	name_short = "2OF"

/datum/mil_rank/nt/deck/third_mate
	name = "Third Officer"
	name_short = "3OF"

/datum/mil_rank/nt/deck/chief
	name = "Chief Rate"
	name_short = "CRT"

/datum/mil_rank/nt/deck/able
	name = "Able Spacefarer"
	name_short = "ABLE"

/datum/mil_rank/nt/deck/spacer
	name = "Ordinary Spacefarer"
	name_short = "SPCR"

/datum/mil_rank/nt/eng/chief
	name = "Chief Engineer"
	name_short = "CENG"

/datum/mil_rank/nt/eng/second_engineer
	name = "Second Engineer"
	name_short = "2ENG"

/datum/mil_rank/nt/eng/third_engineer
	name = "Third Engineer"
	name_short = "3ENG"

/datum/mil_rank/nt/eng/fourth_engineer
	name = "Fourth Engineer"
	name_short = "4ENG"

/datum/mil_rank/nt/eng/trainee
	name = "Trainee Engineer"
	name_short = "TENG"

/datum/mil_rank/nt/sec/chief
	name = "Chief of Security"
	name_short = "CSEC"

/datum/mil_rank/nt/sec/sergeant
	name = "Sergeant"
	name_short = "SGT"

/datum/mil_rank/nt/sec/constable
	name = "Constable"
	name_short = "CON"

/datum/mil_rank/nt/agent
	name = "NanoTrasen Agent"
	name_short = "AGT"

/datum/mil_rank/nt/med/chief
	name = "Chief Surgeon"
	name_short = "CMED"

/datum/mil_rank/nt/med/surgeon
	name = "Surgeon"
	name_short = "SR"

/datum/mil_rank/nt/med/surgeon_mate
	name = "Surgeon's Mate"
	name_short = "SRM"

/datum/mil_rank/nt/research/chief
	name = "Chief Researcher"
	name_short = "CRES"

/datum/mil_rank/nt/research/researcher
	name = "Researcher"
	name_short = "SCI"

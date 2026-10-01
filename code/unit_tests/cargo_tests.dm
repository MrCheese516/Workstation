//=======================================================================================

/datum/unit_test/cargo_crates_containment_test
	name = "CARGO: Supply crates containment"

/datum/unit_test/cargo_crates_containment_test/start_test()
	var/bad_tests = 0

	for(var/singleton/hierarchy/supply_pack/supply_pack in SSsupply.master_supply_list)
		if(!ispath(supply_pack.containertype, /obj/structure/closet))
			continue

		var/obj/structure/closet/C = new supply_pack.containertype(get_safe_turf())
		supply_pack.spawn_contents(C)

		var/contents_pre_open = C.contents.Copy()
		C.dump_contents()
		C.store_contents()
		var/list/no_longer_contained_atoms = contents_pre_open - C.contents
		var/list/previously_not_contained_atoms = C.contents - contents_pre_open

		if(length(no_longer_contained_atoms))
			bad_tests++
			log_bad("[supply_pack] - [log_info_line(C)] no longer contains the following atoms: [log_info_line(no_longer_contained_atoms)]")
		if(length(previously_not_contained_atoms))
			log_debug("[supply_pack] - [log_info_line(C)] now contains the following atoms: [log_info_line(previously_not_contained_atoms)]")
		qdel(C)
		QDEL_NULL_LIST(no_longer_contained_atoms)

	if(bad_tests)
		fail("[bad_tests] cargo supply pack\s with inconsistent pre/post-open contents found.")
	else
		pass("No  cargo supply packs with inconsistent pre/post-open contents found.")

	return 1

/datum/unit_test/cargo_sufficient_cost_test
	name = "CARGO: Supply packs shall have sufficient cost"

/datum/unit_test/cargo_sufficient_cost_test/start_test()
	var/fail = FALSE
	for(var/singleton/hierarchy/supply_pack/supply_pack in SSsupply.master_supply_list)
		var/sell_price = 0
		if(ispath(supply_pack.containertype, /obj/structure/closet/crate))
			var/obj/structure/closet/crate/crate = supply_pack.containertype
			sell_price += initial(crate.points_per_crate)
		sell_price += SSsupply.points_per_slip
		if(supply_pack.cost <= sell_price)
			log_bad("[supply_pack.name] ([supply_pack.type]) costs [supply_pack.cost], but can be sold for [sell_price].")
			fail = TRUE
	if(fail)
		fail("A supply pack did not have sufficient cost.")
	else
		pass("All supply packs cost sufficiently.")
	return 1

/datum/unit_test/cargo_supply_account_test
	name = "CARGO: Supply orders and income use the supply account"

/datum/unit_test/cargo_supply_account_test/start_test()
	var/datum/money_account/account = SSsupply.get_account()
	if(!account)
		fail("No supply account found.")
		return 1
	if(account != department_accounts["Supply"])
		log_debug("No Supply department account, using [account.account_name].")

	var/list/errors = list()
	var/start_money = account.money
	var/start_log_length = length(account.transaction_log)
	var/cost = 10
	var/price = cost * GLOB.using_map.supply_price_multiplier

	if(SSsupply.to_currency(cost) != price)
		errors += "to_currency([cost]) returned [SSsupply.to_currency(cost)], expected [price]."

	// Charge and refund.
	account.money = price * 2
	if(!SSsupply.charge(cost, "Unit test charge") || account.money != price)
		errors += "Charging [price] from [price * 2] left [account.money]."
	if(!SSsupply.refund(cost, "Unit test refund") || account.money != price * 2)
		errors += "Refunding [price] to [price] left [account.money]."
	if(SSsupply.get_balance() != account.money)
		errors += "get_balance() returned [SSsupply.get_balance()], but the account holds [account.money]."

	// Insufficient, exact and partial funds.
	account.money = price - 1
	if(SSsupply.charge(cost, "Unit test overdraft") || account.money != price - 1)
		errors += "Charging [price] from [price - 1] succeeded or changed the balance to [account.money]."
	account.money = price
	if(!SSsupply.charge(cost, "Unit test exact charge") || account.money != 0)
		errors += "Charging exactly the balance of [price] failed or left [account.money]."
	account.money = 5
	if(!SSsupply.charge(cost, "Unit test partial charge", partial = TRUE) || account.money != 0)
		errors += "Partially charging [price] from 5 failed or left [account.money]."

	// Income is held until deposited, and kept while the account is suspended.
	var/old_pending = SSsupply.pending_income
	var/old_total = SSsupply.point_sources["total"]
	SSsupply.pending_income = 0
	account.money = 0
	SSsupply.add_points_from_source(cost, "manifest")
	if(account.money != 0 || SSsupply.pending_income != price)
		errors += "Income was not held as pending: balance [account.money], pending [SSsupply.pending_income]."
	if(SSsupply.point_sources["total"] != old_total + price)
		errors += "Income statistics were not recorded in currency."
	account.suspended = TRUE
	SSsupply.deposit_income("Unit test suspended income")
	account.suspended = FALSE
	if(account.money != 0 || SSsupply.pending_income != price)
		errors += "Income was deposited into a suspended account or lost: balance [account.money], pending [SSsupply.pending_income]."
	SSsupply.deposit_income("Unit test income")
	if(account.money != price || SSsupply.pending_income != 0)
		errors += "Depositing income left balance [account.money], pending [SSsupply.pending_income]."

	// charge, refund, exact charge, partial charge and income: 5 successful transactions.
	var/new_log_entries = length(account.transaction_log) - start_log_length
	if(new_log_entries != 5)
		errors += "Expected 5 new transaction log entries, found [new_log_entries]."

	account.money = start_money
	SSsupply.pending_income = old_pending

	if(length(errors))
		for(var/error in errors)
			log_bad(error)
		fail("The supply account did not behave as expected.")
	else
		pass("Supply charges, refunds and income moved the expected amounts of money.")
	return 1

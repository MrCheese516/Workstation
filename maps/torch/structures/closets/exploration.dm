/*
 * Torch Exploration
 */

/singleton/closet_appearance/secure_closet/torch/acquisitions
	color = COLOR_WARM_YELLOW
	decals = list(
		"lower_side_vent"
	)
	extra_decals = list(
		"stripe_vertical_mid_partial" = COLOR_BEASTY_BROWN,
		"stripe_vertical_left_partial" = COLOR_BEASTY_BROWN,
		"mining" = COLOR_BEASTY_BROWN
	)

/singleton/closet_appearance/secure_closet/torch/acquisitions/pilot
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_PURPLE,
		"stripe_vertical_right_full" = COLOR_PURPLE,
		"exped" = COLOR_PURPLE
	)

/singleton/closet_appearance/secure_closet/torch/acquisitions/acquisition_boss
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_BEASTY_BROWN,
		"stripe_vertical_mid_full" = COLOR_CLOSET_GOLD,
		"stripe_vertical_right_full" = COLOR_BEASTY_BROWN,
		"security" = COLOR_CLOSET_GOLD
	)

/obj/structure/closet/secure_closet/torch/acquisitions/acquisition_boss
	name = "acquisitions boss's locker"
	req_access = list(access_acquis_boss)
	closet_appearance = /singleton/closet_appearance/secure_closet/torch/acquisitions/acquisition_boss

/obj/structure/closet/secure_closet/torch/acquisitions/acquisition_boss/WillContain()
	return list(
		/obj/item/device/radio,
		/obj/item/device/gps,
		/obj/item/pinpointer/radio,
		/obj/item/tape_roll,
		/obj/item/material/knife/utility,
		/obj/item/clothing/accessory/storage/holster/knife,
		/obj/item/shuttle_beacon,
		/obj/item/device/scanner/gas,
		/obj/item/device/radio/headset/acquisition_boss,
		/obj/item/device/radio/headset/acquisition_boss/alt,
		/obj/item/storage/box/encryptionkey/acquisitions,
		/obj/item/device/binoculars,
		/obj/item/storage/backpack/dufflebag,
		/obj/item/crowbar/emergency_forcing_tool,
		/obj/item/extinguisher/mini,
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/clothing/mask/gas/half,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/flashlight/lantern,
		/obj/item/shovel,
		/obj/item/pickaxe,
		/obj/item/storage/belt/utility/full,
		/obj/item/storage/ore,
		/obj/item/device/scanner/mining,
		/obj/item/device/gps,
		/obj/item/device/radio,
		/obj/item/clothing/glasses/material,
		/obj/item/clothing/glasses/meson,
	)

/obj/structure/closet/secure_closet/torch/acquisitions/acquisition_tech
	name = "explorer's locker"
	req_access = list(access_acquis)
	closet_appearance = /singleton/closet_appearance/secure_closet/torch/acquisitions

/obj/structure/closet/secure_closet/torch/acquisitions/acquisition_tech/WillContain()
	return list(
		/obj/item/device/radio,
		/obj/item/device/gps,
		/obj/item/tape_roll,
		/obj/item/clothing/accessory/storage/holster/knife,
		/obj/item/shuttle_beacon,
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/device/scanner/gas,
		/obj/item/device/radio/headset/acquisitions,
		/obj/item/device/radio/headset/acquisitions/alt,
		/obj/item/device/binoculars,
		/obj/item/material/knife/utility,
		/obj/item/storage/backpack/dufflebag,
		/obj/item/crowbar/emergency_forcing_tool,
		/obj/item/extinguisher/mini,
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/clothing/mask/gas/half,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/radio/headset/headset_mining,
		/obj/item/device/radio/headset/headset_mining/alt,
		/obj/item/device/flashlight/lantern,
		/obj/item/shovel,
		/obj/item/pickaxe,
		/obj/item/storage/belt/utility/full,
		/obj/item/storage/ore,
		/obj/item/device/scanner/mining,
		/obj/item/device/gps,
		/obj/item/device/radio,
		/obj/item/clothing/glasses/material,
		/obj/item/clothing/glasses/meson,
	)

/obj/structure/closet/secure_closet/pilot
	name = "pilot's locker"
	req_access = list(access_pilot)
	closet_appearance = /singleton/closet_appearance/secure_closet/torch/acquisitions/pilot

/obj/structure/closet/secure_closet/pilot/WillContain()
	return list(
		/obj/item/device/radio,
		/obj/item/device/gps,
		/obj/item/storage/belt/utility/full,
		/obj/item/shuttle_beacon,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/device/scanner/gas,
		/obj/item/device/radio/headset/headset_pilot,
		/obj/item/device/radio/headset/headset_pilot/alt,
		/obj/item/device/binoculars,
		/obj/item/clothing/gloves/thick,
		/obj/item/clothing/suit/storage/hazardvest/blue,
		/obj/item/selection/pilot_helmet,
		/obj/item/storage/firstaid/light,
		/obj/item/material/knife/folding/swiss/acquisition_tech,
		/obj/item/storage/backpack/dufflebag,
		/obj/item/device/flashlight/flare
	)

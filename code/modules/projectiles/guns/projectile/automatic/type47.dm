/obj/item/gun/projectile/type_47
	name = "OS CAR .25 CS \"Type 47\""
	desc = "A compact assault carbine of onestar orgin. "
	icon = 'icons/obj/guns/projectile/os/type_47.dmi'
	icon_state = "type_47"
	item_state = "type_47"
	w_class = ITEM_SIZE_NORMAL
	ammo_mag = "ih_sol"
	load_method = MAGAZINE
	mag_well = MAG_WELL_IH
	caliber = CAL_CLRIFLE
	magazine_type = /obj/item/ammo_magazine/ihclrifle
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5)
	slot_flags = SLOT_BELT|SLOT_BACK
	matter = list(MATERIAL_PLASTEEL = 16, MATERIAL_PLATINUM = 4, MATERIAL_PLASTIC = 12)
	price_tag = 3400
	fire_sound = 'sound/weapons/guns/fire/cal/sky_driver.ogg'
	unload_sound = 'sound/weapons/guns/interact/batrifle_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/batrifle_magin.ogg'
	cocked_sound = 'sound/weapons/guns/interact/batrifle_cock.ogg'
	recoil_buildup = 1.7
	penetration_multiplier = 1.8
	damage_multiplier = 1.4
	one_hand_penalty = 10
	spawn_tags = SPAWN_TAG_GUN_OS
	gun_tags = list(GUN_SILENCABLE)
	gun_parts = list(/obj/item/part/gun = 2 ,/obj/item/stack/material/plasteel = 6)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		FULL_AUTO_600
		)

	spawn_blacklisted = TRUE
	serial_type = "OS"

/obj/item/gun/projectile/type_47/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"
		itemstring += "_mag"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/type_47/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/projectile/type_90
	name = "OS HG .35 Auto \"Type 90\""
	desc = "A Highly advanced gauss pistol produced by onestar right before its collapse "
	icon = 'icons/obj/guns/projectile/os/type_90.dmi'
	icon_state = "type_90"
	item_state = "type_90"
	w_class = ITEM_SIZE_SMALL
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLATINUM = 4, MATERIAL_PLASTIC = 6)
	price_tag = 2600
	caliber = CAL_PISTOL
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL|MAG_WELL_H_PISTOL
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	magazine_type = /obj/item/ammo_magazine/pistol
	damage_multiplier = 1.5
	penetration_multiplier = 2
	recoil_buildup = 1.6
	spawn_tags = SPAWN_TAG_GUN_OS
	fire_sound = 'sound/weapons/guns/fire/energy_shotgun.ogg'
	unload_sound = 'sound/weapons/guns/interact/pistol_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/guns/interact/pistol_cock.ogg'
	init_firemodes = list(
        SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		WEAPON_CHARGE
        )

	spawn_blacklisted = TRUE //until ruins are finished

	serial_type = "OS"


/obj/item/gun/projectile/type_90/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"
		itemstring += "_mag"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/type_90/Initialize()
	. = ..()
	update_icon()

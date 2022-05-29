/obj/item/gun/projectile/type_69
    name = "OS PDW .40 \"QCQ-60\"" //god forgive me
    desc = "A Compact and Powerfull Protoype Onestar PDW typically issued to high ranking officals and spies. Unweildy but extremely deadly in CQC, the perfect gun for self defense and urban warfare. \ Takes Both pistol and SMG .40 magazines "
    icon = 'icons/obj/guns/projectile/os/type_69.dmi'
    icon_state = "type_69"
    item_state = "type_69"
    origin_tech = list(TECH_COMBAT = 10, TECH_MATERIAL = 2)
    caliber = CAL_MAGNUM
    load_method = MAGAZINE
    mag_well = MAG_WELL_PISTOL|MAG_WELL_SMG
    magazine_type = /obj/item/ammo_magazine/magnum
    matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLATINUM = 8, MATERIAL_PLASTIC = 4)
    can_dual = TRUE
    slot_flags = SLOT_BELT|SLOT_HOLSTER
    damage_multiplier = 1.1
    penetration_multiplier = 1.4
    fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
    unload_sound = 'sound/weapons/guns/interact/hpistol_magout.ogg'
    reload_sound = 'sound/weapons/guns/interact/hpistol_magin.ogg'
    cocked_sound = 'sound/weapons/guns/interact/rifle_boltforward.ogg'
    recoil_buildup = 2.5
    init_firemodes = list(
        FULL_AUTO_600,
        FULL_AUTO_800,
        SEMI_AUTO_NODELAY
        )
    spawn_tags = SPAWN_TAG_GUN_OS
    price_tag = 3000

    spawn_blacklisted = TRUE //until loot rework
    serial_type = "OS"

/obj/item/gun/projectile/type_69/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"
		itemstring += "_mag"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/type_69/Initialize()
	. = ..()
	update_icon()

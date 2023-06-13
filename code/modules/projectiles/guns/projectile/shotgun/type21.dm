/obj/item/gun/projectile/shotgun/type_21
	name = "OS Type 21 SG \"Yaoguai\"" //Demon
	desc = "An early model shotgun used by One Star. It is compact with a sawn down barrel and no stock, designed for police use in megacities. The recoil kicks badly but the stopping power is worth it. fed from .50 drum and box magazines"
	icon = 'icons/obj/guns/projectile/os/type_21.dmi'
	icon_state = "type_21"
	item_state = "type_21"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_HOLSTER
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 3)
	caliber = CAL_SHOTGUN
	load_method = MAGAZINE
	mag_well = MAG_WELL_RIFLE|MAG_WELL_RIFLE_D
	magazine_type = /obj/item/ammo_magazine/m12
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 3300
	spawn_tags = SPAWN_TAG_GUN_OS
	spawn_blacklisted = TRUE
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound = 'sound/weapons/guns/interact/hpistol_cock.ogg'
	damage_multiplier = 1.0
	penetration_multiplier = 0.5
	init_recoil = CARBINE_RECOIL(1.0)

	init_firemodes = list(
		SEMI_AUTO_300
		)

/obj/item/gun/projectile/shotgun/type_21/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(ammo_magazine)
		iconstring += "_mag"
		itemstring += "_mag"
		wielded_item_state = "_doble" + "_mag"
		if(ammo_magazine.mag_well == |MAG_WELL_RIFLE_D
			iconstring += "_drum"
		if(!LAZYLEN(ammo_magazine.stored_ammo))
			iconstring += "_empty"
		wielded_item_state = "_doble" + "_mag"
	else
		wielded_item_state = "_doble"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/shotgun/type_21/Initialize()
	. = ..()
	update_icon()

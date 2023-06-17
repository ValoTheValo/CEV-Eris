/obj/machinery/vending/one_star
	name = "One Star HoloVendor"
	desc = "A OneStar Hologram capable of producing an endless supply of goods out of seemingly nothing. only accepts yuan"
	icon = 'icons/obj/machines/one_star/vending.dmi'
	icon_state = "vendor_guns"
	icon_vend = "vendor_printing"
	spawn_tags = SPAWN_TAG_OS_VENDOR
	spawn_blacklisted = TRUE
	bad_type = /obj/machinery/vending/one_star
	//product_slogans = "Usually no carcinogens!;Best sports!;Become the strongest!"
	//product_ads = "Strength!;Cheap!;There are contraindications, it is recommended to consult a medical specialist."
	vendor_department = DEPARTMENT_OFFSHIP
	alt_currency_path = /obj/item/stack/os_cash

/obj/machinery/vending/one_star/Initialize()
	. = ..()
	set_light(1.4, 1, COLOR_LIGHTING_CYAN_BRIGHT)
	earnings_account = department_accounts[DEPARTMENT_OFFSHIP]

/obj/machinery/vending/one_star/guns
	desc = "A OneStar Hologram capable of producing an endless supply of goods out of seemingly nothing, if provided with enough yuan. This machine sells weapons"
	icon_state = "vendor_guns"

	products = list(
		/obj/item/gun/projectile/type_62 = 99,
		/obj/item/gun/projectile/type_90 = 99,
		/obj/item/gun/projectile/shotgun/type_21 = 99,
		/obj/item/gun/projectile/automatic/type_17 = 99,
		/obj/item/gun/projectile/type_47 = 99,
		/obj/item/gun/energy/retro = 99
		)

	prices = list(
		/obj/item/gun/projectile/type_62 = 250,
		/obj/item/gun/projectile/type_90 = 500,
		/obj/item/gun/projectile/shotgun/type_21 = 350,
		/obj/item/gun/projectile/automatic/type_17 = 400,
		/obj/item/gun/projectile/type_47 = 300,
		/obj/item/gun/energy/retro = 75
		)

/obj/machinery/vending/one_star/food
	desc = "A OneStar Hologram capable of producing an endless supply of goods out of seemingly nothing, if provided with enough yuan. This machine sells food and drink"
	icon_state = "vendor_food"

/obj/machinery/vending/one_star/health
	desc = "A OneStar Hologram capable of producing an endless supply of goods out of seemingly nothing, if provided with enough yuan. This machine sells medicine and prosthetics"
	icon_state = "vendor_health"

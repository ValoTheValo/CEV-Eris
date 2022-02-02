/datum/trade_station/recycler
	name_pool = list(
		"JNK \'Garbaj\'" = "Junk collector.",
	)
	start_discovered = FALSE
	spawn_always = TRUE
	markup = UNCOMMON_GOODS
	base_income = 3200
	wealth = -48000		// Starts in debt so we don't get too many oddities early on.
	secret_inv_threshold = 32000
	assortiment = list(
		"Spare Parts" = list(
			/obj/item/part/armor = custom_good_amount_range(list(1, 5)),
			/obj/item/part/gun = custom_good_amount_range(list(1, 5)),
			/obj/item/stock_parts/capacitor/adv = custom_good_amount_range(list(1, 3)),
			/obj/item/stock_parts/scanning_module/adv = custom_good_amount_range(list(1, 3)),
			/obj/item/stock_parts/manipulator/nano = custom_good_amount_range(list(1, 3)),
			/obj/item/stock_parts/micro_laser/high = custom_good_amount_range(list(1, 3)),
			/obj/item/stock_parts/matter_bin/adv = custom_good_amount_range(list(1, 3))
		)
	)
	secret_inventory = list(
		"\"Trash\"" = list(
			/obj/item/oddity/common/blueprint = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/coin = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/photo_landscape = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/photo_coridor = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/photo_eyes = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/photo_crime = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/old_newspaper = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/paper_crumpled = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/paper_omega = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/book_eyes = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/book_omega = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/book_bible = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/book_unholy = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/old_money = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/healthscanner = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/old_pda = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/towel = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/teddy = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/old_knife = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/old_id = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/disk = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/mirror = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/lighter = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/device = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/old_radio = custom_good_amount_range(list(-1, 2)),
			/obj/item/oddity/common/paper_bundle = custom_good_amount_range(list(-1, 2))
		)
	)
	// TODO: Better offers
	offer_types = list(
		/obj/item/reagent_containers/food/snacks/margheritaslice = offer_data("margherita pizza slice", 200, 8),
		/obj/item/reagent_containers/food/snacks/meatpizzaslice = offer_data("meat pizza slice", 200, 8),
		/obj/item/reagent_containers/food/snacks/mushroompizzaslice = offer_data("mushroom pizza slice", 200, 8),
		/obj/item/reagent_containers/food/snacks/vegetablepizzaslice = offer_data("veggie pizza slice", 200, 8)
	)

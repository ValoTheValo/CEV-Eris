/obj/item/implant/excelsior
	name = "excelsior implant"
	icon_state = "implant_excel"
	implant_overlay = "implantstorage_excel"
	allowed_organs = list(BP_HEAD)
	origin_tech = list(TECH_COVERT = 2)
	var/antag_id = ROLE_EXCELSIOR_REV
	var/faction_id = FACTION_EXCELSIOR
	var/global/possible_disguises = list(
		/obj/item/implant/chem,
		/obj/item/implant/death_alarm
	)
	var/disguise

/obj/item/implant/excelsior/Initialize()
	. = ..()
	if(length(possible_disguises))
		var/obj/item/implant/I = pick(possible_disguises)
		disguise = initial(I.name)

/obj/item/implant/excelsior/get_scanner_name()
	return disguise

/obj/item/implantcase/excelsior
	name = "glass case - 'complant'"
	desc = "A case containing an excelsior complant."
	implant = /obj/item/implant/excelsior

/obj/item/implanter/excelsior
	name = "implanter-complant"
	implant = /obj/item/implant/excelsior
	spawn_tags = null

/obj/item/implant/excelsior/broken
	name = "broken excelsior implant"
	malfunction = MALFUNCTION_PERMANENT

/obj/item/implantcase/excelsior/broken
	name = "glass case - 'broken complant'"
	desc = "A case containing an broken excelsior complant."
	implant = /obj/item/implant/excelsior/broken

/obj/item/implanter/excelsior/broken
	name = "broken implanter-complant"
	implant = /obj/item/implant/excelsior/broken

//The excelsior implant converts humans into antags, but it also protects mobs from excelsior turrets and shields
/obj/item/implant/excelsior/can_install(var/mob/living/carbon/human/target, var/obj/item/organ/external/E)
	//First of all, handling of human players
	if(istype(target))
		//Human players have minds. If it doesnt have a mind, its probably a monkey
		if (target.mind)
			//We'll check if the target is already excelsior, return false if so, waste of an implant
			for(var/datum/antagonist/A in target.mind.antagonist)
				if(A.id == antag_id)
					return FALSE

	//Secondly, cruciforms.
	//This is handled seperately to account for the future possibility of non-humans having cruciforms. Like holy dogs!
	if(is_neotheology_disciple(target))
		//Cruciform blocks other implants
		return FALSE


	//Thirdly an organic check. No implanting robots
	//Any other organic creature is fine. This allows you to implant your pets so the turrets dont shoot them
	var/types = target.get_classification()
	if(!(types & CLASSIFICATION_ORGANIC))
		return FALSE

	//Lastly the implant was ejected by cruciform, if yes the implant is broken.
	if(malfunction)
		return FALSE

	//All good, return true
	return TRUE



/obj/item/implant/excelsior/on_install(var/mob/living/target)
	var/datum/faction/F = get_faction_by_id(faction_id)

	if(!wearer || !wearer.mind)
		return

	// Mutant with resistance to mind control still can use an implant, albeit not fully
	if(get_active_mutation(target, MUTATION_GODBLOOD))
		target.verbs.Add(/datum/faction/excelsior/proc/communicate_verb)
		return

	if(!F)
		to_chat(target, SPAN_WARNING("You feel nothing."))

	for(var/datum/antagonist/A in target.mind.antagonist)
		if(A.id == antag_id && A.faction && A.faction.id == faction_id)
			return

	make_antagonist_faction(wearer.mind, antag_id, F, check = FALSE)


/obj/item/implant/excelsior/on_uninstall()
	if(!istype(wearer) || !wearer.mind)
		return

	for(var/datum/antagonist/A in wearer.mind.antagonist)
		if(A.id == antag_id)
			A.remove_antagonist()
	wearer.visible_message(SPAN_DANGER("As \the [src] is removed from \the [wearer]..."))
	if(prob(66) && !get_active_mutation(wearer, MUTATION_GODBLOOD))
		wearer.visible_message(SPAN_DANGER("\The [wearer]'s [part.name] violently explodes from within!"))
		wearer.adjustBrainLoss(200)
		part.droplimb(FALSE, DROPLIMB_BLUNT)
	else
		wearer.visible_message(SPAN_NOTICE("Something fizzles in \the [wearer]'s [part.name], but nothing interesting happens."))
		wearer.verbs.Remove(/datum/faction/excelsior/proc/communicate_verb)

//The leader version of the implant is the one given to antags spawned by the storyteller.
//It has no special gameplay properties and is not attainable in normal gameplay, it just exists to
//prevent buggy behaviour.
/obj/item/implant/excelsior/leader

//Caninstall returns true, so it wont fail when inserted into someone who was already made an antag
/obj/item/implant/excelsior/leader/can_install()
	return TRUE

//On install is short circuited, so that it doesnt spam them with double greeting
/obj/item/implant/excelsior/leader/on_install()
	return TRUE

//excelhud
/obj/item/implant/excelsiorprocess_hud(mob/M)
	if(..())
		return
	if(is_excelsior(M))
		process_excel_hud(M)

/obj/item/implant/excelsior(mob/M)
	. = ..()

	var/mob/living/carbon/human/H = M
	if(!istype(H) || H.glasses != src)
		return

	if(!is_excelsior(H))
		to_chat(H, SPAN_WARNING("The hud fails to activate, a built-in speaker says, \"Failed to locate implant, please contact your nearest Excelsior representative immediately for assistance\"."))


proc/process_excel_hud(mob/M, mob/Alt)
    if(!can_process_hud(M))
        return
    var/datum/arranged_hud_process/P = arrange_hud_process(M, Alt, excel_hud_users)
    for(var/mob/living/carbon/human/comrade in P.Mob.in_view(P.Turf))
        if(P.Mob.see_invisible < comrade.invisibility)
            continue

        P.Client.images += comrade.hud_list[EXCELSIOR_HUD]

datum/arranged_hud_process
    var/client/Client
    var/mob/Mob
    var/turf/Turf

proc/arrange_hud_process(var/mob/M, var/mob/Alt, var/list/hud_list)
    hud_list |= M
    var/datum/arranged_hud_process/P = new
    P.Client = M.client
    P.Mob = Alt ? Alt : M
    P.Turf = get_turf(P.Mob)
    return P

proc/can_process_hud(var/mob/M)
    if(!M)
        return 0
    if(!M.client)
        return 0
    if(M.stat != CONSCIOUS)
        return 0
    return 1

//Deletes the current HUD images so they can be refreshed with new ones.
mob/proc/handle_hud_glasses() //Used in the life.dm of mobs that can use HUDs.
    if(client)
        for(var/image/hud in client.images)
            if(copytext(hud.icon_state, 1, 4) == "hud")
                client.images -= hud
    med_hud_users -= src
    sec_hud_users -= src

mob/proc/in_view(var/turf/T)
    return view(T)

/mob/observer/eye/in_view(var/turf/T)
    var/list/viewed = new
    for(var/mob/living/carbon/human/H in SSmobs.mob_list)
        if(get_dist(H, T) <= 7)
            viewed += H
    return viewed

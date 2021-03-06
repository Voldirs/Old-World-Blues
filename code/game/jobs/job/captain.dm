var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/captain
	title = "Captain"
	flag = CAPTAIN
	department = "Command"
	head_position = 1
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Nanotrasen officials and Corporate Regulations"
	selection_color = "#ccccff"
	idtype = /obj/item/weapon/card/id/gold
	req_admin_notify = 1
	minimal_player_age = 30
	economic_modifier = 20

	minimum_character_age = 27
	ideal_character_age = 70 // Old geezer captains ftw

	implanted = 1
	uniform = /obj/item/clothing/under/rank/captain
	shoes = /obj/item/clothing/shoes/brown
	pda = /obj/item/device/pda/captain
	hat = /obj/item/clothing/head/caphat
	ear = /obj/item/device/radio/headset/heads/captain
	glasses = /obj/item/clothing/glasses/sunglasses

	backpack  = /obj/item/storage/backpack/captain
	satchel_j = /obj/item/storage/backpack/satchel/cap
	dufflebag = /obj/item/storage/backpack/dufflebag/cap

	put_in_backpack = list(
		/obj/item/storage/box/ids
		)

	equip(var/mob/living/carbon/human/H)
		if(!..())	return 0
		if(H.age>49)
			var/obj/item/clothing/under/U = H.w_uniform
			if(istype(U)) U.accessories += new /obj/item/clothing/accessory/medal/gold/captain(U)
			var/sound/announce_sound = (ticker.current_state <= GAME_STATE_SETTING_UP)? null : sound('sound/misc/boatswain.ogg', volume=20)
			captain_announcement.Announce("All hands, Captain [H.real_name] on deck!", new_sound=announce_sound)
		return 1

	get_access()
		return get_all_accesses()


/datum/job/hop
	title = "Head of Personnel"
	flag = HOP
	department = "Civilian"
	head_position = 1
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#ddddff"
	idtype = /obj/item/weapon/card/id/silver
	alt_titles = list("Crew Resources Officer")
	req_admin_notify = 1
	minimal_player_age = 10
	economic_modifier = 10

	minimum_character_age = 25
	ideal_character_age = 50

	implanted = 1
	uniform = /obj/item/clothing/under/rank/hop
	shoes = /obj/item/clothing/shoes/brown
	pda = /obj/item/device/pda/heads/hop
	ear = /obj/item/device/radio/headset/heads/hop


	put_in_backpack = list(
		/obj/item/storage/box/ids,
		/obj/item/weapon/a_gift,
		/obj/item/clothing/head/santa
	)

	minimal_access = list(
		access_security, access_sec_doors, access_brig, access_court, access_forensics_lockers, access_medical,
		access_engine, access_change_ids, access_ai_upload, access_eva, access_heads, access_all_personal_lockers,
		access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue, access_crematorium,
		access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics,
		access_lawyer, access_theatre, access_chapel_office, access_library, access_research, access_mining,
		access_heads_vault, access_mining_station, access_clown, access_mime, access_hop, access_RC_announce,
		access_keycard_auth, access_gateway
	)

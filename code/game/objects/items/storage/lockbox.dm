//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:32

/obj/item/storage/lockbox
	name = "lockbox"
	desc = "A locked box."
	icon_state = "lockbox+l"
	item_state = "syringe_kit"
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = 14 //The sum of the w_classes of all the items in this storage item.
	storage_slots = 4
	req_access = list(access_armory)
	var/locked = 1
	var/broken = 0
	var/icon_locked = "lockbox+l"
	var/icon_closed = "lockbox"
	var/icon_broken = "lockbox+b"


	attackby(obj/item/weapon/W as obj, mob/user as mob)
		if (istype(W, /obj/item/weapon/card/id))
			if(src.broken)
				user << "<span class='warning'>It appears to be broken.</span>"
				return
			if(src.allowed(user))
				src.locked = !( src.locked )
				if(src.locked)
					src.icon_state = src.icon_locked
					user << SPAN_NOTE("You lock \the [src]!")
					close_all()
					return
				else
					src.icon_state = src.icon_closed
					user << SPAN_NOTE("You unlock \the [src]!")
					return
			else
				user << "<span class='warning'>Access Denied</span>"
		else if(istype(W, /obj/item/weapon/melee/energy/blade))
			if(emag_act(INFINITY, user, W, "The locker has been sliced open by [user] with an energy blade!", "You hear metal being sliced and sparks flying."))
				var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
				spark_system.set_up(5, 0, src.loc)
				spark_system.start()
				playsound(src.loc, 'sound/weapons/blade1.ogg', 50, 1)
				playsound(src.loc, "sparks", 50, 1)
		if(!locked)
			..()
		else
			user << "<span class='warning'>It's locked!</span>"
		return


	show_to(mob/user as mob)
		if(locked)
			user << "<span class='warning'>It's locked!</span>"
		else
			..()
		return

/obj/item/storage/lockbox/emag_act(var/remaining_charges, var/mob/user, var/emag_source, var/visual_feedback = "", var/audible_feedback = "")
	if(!broken)
		if(visual_feedback)
			visual_feedback = "<span class='warning'>[visual_feedback]</span>"
		else
			visual_feedback = "<span class='warning'>The locker has been sliced open by [user] with an electromagnetic card!</span>"
		if(audible_feedback)
			audible_feedback = "<span class='warning'>[audible_feedback]</span>"
		else
			audible_feedback = "<span class='warning'>You hear a faint electrical spark.</span>"

		broken = 1
		locked = 0
		desc = "It appears to be broken."
		icon_state = src.icon_broken
		visible_message(visual_feedback, audible_feedback)
		return 1

/obj/item/storage/lockbox/loyalty
	name = "lockbox of loyalty implants"
	req_access = list(access_security)

	New()
		..()
		new /obj/item/weapon/implantcase/loyalty(src)
		new /obj/item/weapon/implantcase/loyalty(src)
		new /obj/item/weapon/implantcase/loyalty(src)
		new /obj/item/weapon/implanter/loyalty(src)


/obj/item/storage/lockbox/clusterbang
	name = "lockbox of clusterbangs"
	desc = "You have a bad feeling about opening this."
	req_access = list(access_security)

	New()
		..()
		new /obj/item/weapon/grenade/flashbang/clusterbang(src)

/obj/item/storage/lockbox/medal
	name = "lockbox of medals"
	desc = "A lockbox filled with commemorative medals, it has the NanoTrasen logo stamped on it."
	req_access = list(access_heads)
	storage_slots = 7

	New()
		..()
		new /obj/item/clothing/accessory/medal/conduct(src)
		new /obj/item/clothing/accessory/medal/bronze_heart(src)
		new /obj/item/clothing/accessory/medal/nobel_science(src)
		new /obj/item/clothing/accessory/medal/silver/valor(src)
		new /obj/item/clothing/accessory/medal/silver/security(src)
		new /obj/item/clothing/accessory/medal/gold/captain(src)
		new /obj/item/clothing/accessory/medal/gold/heroism(src)
///BANDAMARINES CODE
/// задел под будущую кастомную взрывчатку в течтри, может быть кастомное об
/datum/tech/repeatable/ot
	name = "OT arnaments"
	desc = "Приобрести экспериментальную боеголовку"

	required_points = 2
	increase_per_purchase = 1

	tier = /datum/tier/two

	var/type_to_give
/datum/tech/repeatable/ot/on_unlock()
	. = ..()
	if(!type_to_give)
		return

	var/datum/supply_order/O = new /datum/supply_order()
	O.ordernum = GLOB.supply_controller.ordernum++
	var/actual_type = GLOB.supply_packs_types[type_to_give]
	O.objects = list(GLOB.supply_packs_datums[actual_type])
	O.orderedby = MAIN_AI_SYSTEM

	GLOB.supply_controller.shoppinglist += O

/datum/tech/repeatable/ot/cas
	name = "Экспериментальная ракета SV-1-N"
	desc = "Highly explosive bombardment ammo, to be loaded into the orbital cannon."
	icon_state = "cas_ot"

	announce_message = "В Requisitions' ASRS были доставлены дополнительные боеголовки для орбитальных бомбардировок с взрывчатым веществом."

	flags = TREE_FLAG_MARINE

	type_to_give = "Экспериментальная ракета SV1N"

var _contact = place_meeting(x, y, obj_wizard)

if (_contact) {
	if (array_contains(global.inventory.items,"obj_id_card_3D")){
		room_goto(rm_steps)
	} else {
		scr_textbox("Need id_card before continuing!", c_green,,,50)
	}
}
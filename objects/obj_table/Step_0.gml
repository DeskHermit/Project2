var _contact = place_meeting(x, y, obj_wizard)

if (_contact) {
    image_index = 1
} else {
    image_index = 0
}

if (keyboard_check_pressed(ord("E")) && _contact)
{
	global.last_room = room;
	global.store_id = table_key
    show_debug_message("Interacting with: " + global.store_id)
	room_goto(rm_outside_table)
}
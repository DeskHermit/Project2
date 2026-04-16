var _contact = place_meeting(x, y, obj_wizard)

if (_contact) {
    image_index = 1
} else {
    image_index = 0
}

if (keyboard_check_pressed(ord("E")) && _contact)
{
	global.last_room = room; // Store current room ID
	room_goto(rm_outside_table)
}
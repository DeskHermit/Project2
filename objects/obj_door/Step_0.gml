var _contact = place_meeting(x, y, obj_wizard)

if (_contact && keyboard_check_pressed(ord("E"))) {
    is_unlocked = true
	global.last_room = room; // Store current room ID
	room_goto(rm_door_break)
}

if (_contact) {
    image_index = is_unlocked ? 3 : 1
} else {
    image_index = is_unlocked ? 2 : 0
}

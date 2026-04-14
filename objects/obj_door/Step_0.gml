var _contact = place_meeting(x, y, obj_wizard)

if (_contact && keyboard_check_pressed(ord("E"))) {
    is_unlocked = true
}

if (_contact) {
    image_index = is_unlocked ? 3 : 1
} else {
    image_index = is_unlocked ? 2 : 0
}
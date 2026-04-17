var _contact = place_meeting(x, y, obj_wizard)

if (_contact && keyboard_check_pressed(ord("E"))) {
    var _has_hammer = false;
    var _hammer_slot = -1;

    for (var i = 0; i < array_length(global.inventory.items); i++) {
        if (global.inventory.items[i] == obj_hammer_3D) {
            _has_hammer = true;
            _hammer_slot = i;
            break;
        }
    }

    if (_has_hammer) {
        global.inventory.items[_hammer_slot] = noone;
        is_unlocked = true;
        global.last_room = room;
        room_goto(rm_door_break);
    } else {
        show_debug_message("You need the hammer.");
    }
}

if (_contact) {
    image_index = is_unlocked ? 3 : 1
} else {
    image_index = is_unlocked ? 2 : 0
}
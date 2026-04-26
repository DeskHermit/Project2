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
		if (global.inventory.torch) {
	        global.inventory.items[_hammer_slot] = noone;
	        is_unlocked = true;
	        global.last_room = room;
	        room_goto(rm_door_break);
		}
		else{ 
			scr_textbox("You need the torch before continuing!",c_red,,,50)
		}
    } else {
		scr_textbox("You need the hammer!",c_red,,,50)
    }
}

if (_contact) {
    image_index = is_unlocked ? 3 : 1
} else {
    image_index = is_unlocked ? 2 : 0
}
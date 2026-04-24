var _contact = place_meeting(x, y, obj_wizard)

if (_contact && keyboard_check_pressed(ord("E"))) {
    var _has_key = false
    var _key_slot = -1
    if (key_needed) {
        for (var i = 0; i < array_length(global.inventory.items); i++) {
            if (global.inventory.items[i] == obj_key_3D) {
                _has_key = true
                _key_slot = i
                break
            }
        }

        if (_has_key) {
            global.inventory.items[_key_slot] = noone
            is_unlocked = true
            solid = false 
            sprite_index = spr_door_animation
            image_speed = 1
            image_xscale = 1
            image_yscale = 1
        } else {
            scr_textbox("You need the key!", c_red, , , 50)
        }
    } else {
        is_unlocked = true 
		solid = false
        sprite_index = spr_door_animation
        image_speed = 1
        image_xscale = 1
        image_yscale = 1
    }
}

if (sprite_index != spr_door_animation) {
    if (_contact) {
        image_index = is_unlocked ? 3 : 1
    } else {
        image_index = is_unlocked ? 2 : 0
    }
}
var _contact = place_meeting(x+1, y-1, obj_wizard)
var _contact1 = place_meeting(x-1, y+1, obj_wizard)

if ((_contact || _contact1) && keyboard_check_pressed(ord("E"))) {
    var _has_key = false
    var _key_slot = -1
    if (key_needed) {
        for (var i = 0; i < array_length(global.inventory.items); i++) {
            if (global.inventory.items[i] == obj_id_card_3D) {
                _has_key = true
                _key_slot = i
                break
            }
        }

        if (_has_key) {
            is_unlocked = true
            solid = false 
            sprite_index = spr_door_animation
            image_speed = 1
		audio_play_sound(snd_door_open,20,false)
        } else {
            scr_textbox("You need the id card!", c_red, , , 50)
        }
    } else {
        is_unlocked = true
        solid = false 
        sprite_index = spr_door_animation
        image_speed = 1
		audio_play_sound(snd_door_open,20,false)
    }
}

if (sprite_index != spr_door_animation) {
    if (_contact|| _contact1) {
        image_index = is_unlocked ? 3 : 1
    } else {
        image_index = is_unlocked ? 2 : 0
    }
}
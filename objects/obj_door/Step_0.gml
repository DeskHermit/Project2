var _contact = place_meeting(x+1, y-1, obj_wizard)
var _contact1 = place_meeting(x-1, y+1, obj_wizard)
if ((_contact || _contact1) && keyboard_check_pressed(ord("E"))) {
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
			audio_play_sound(snd_door_open,20,false)
        } else {
            scr_textbox("You need the key!", c_red, , , 50)
        }
    } else {
        is_unlocked = true 
		solid = false
        sprite_index = spr_door_animation
        image_speed = 1
    }
	if (!instance_exists(obj_textbox)){
		switch (id){
			case (inst_sg_door):
				scr_textbox("Welcome to room 210", c_white, , , 50)
				break;
			case (inst_su_200):
				scr_textbox("Welcome to room 200", c_white, , , 50)
				break;	
			case (inst_su_230):
				scr_textbox("Welcome to room 230", c_white, , , 50)
				break;
		}
	}
}

if (sprite_index != spr_door_animation) {
    if (_contact || _contact1) {
        image_index = is_unlocked ? 3 : 1
    } else {
        image_index = is_unlocked ? 2 : 0
    }
}
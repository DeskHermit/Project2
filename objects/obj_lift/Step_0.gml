var _contact = place_meeting(x, y, obj_wizard)

if (_contact) {
    var _has_fuse = false
	var _index = 0
    for (var i = 0; i < array_length(global.inventory.items); i++) {
        if (global.inventory.items[i] == obj_fuse_3D) {
            _has_fuse = true
			_index = i
            break
        }
    }

    if (_has_fuse) {
        if (room != rm_lift_scene) {
			if (keyboard_check(ord("E"))){
				global.inventory.items[_index] = noone
				room_persistent = false
				room_goto(rm_lift_scene)
			} else{ 
				scr_textbox("Press E to use lift!", c_green, , , 50)
			}
        }
    } else {
        if (!instance_exists(obj_textbox)) {
            scr_textbox("Need fuse to repair", c_red, , , 50)
        }
    }
}
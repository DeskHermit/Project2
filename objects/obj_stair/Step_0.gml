var _contact = place_meeting(x, y, obj_wizard)

if (_contact) {
    var _has_id = false
    for (var i = 0; i < array_length(global.inventory.items); i++) {
        if (global.inventory.items[i] == obj_id_card_3D) {
            _has_id = true
            break
        }
    }

    if (_has_id) {
        if (room != rm_steps &&  keyboard_check(ord("E"))) {
            room_goto(rm_steps)
        }
    } else {
        if (!instance_exists(obj_textbox)) {
            scr_textbox("Need id_card before continuing!", c_green, , , 50)
        }
    }
}
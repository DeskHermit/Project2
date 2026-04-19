image_speed = 0

var _hover = position_meeting(mouse_x, mouse_y, id)
var _click = _hover && mouse_check_button(mb_left)

if (_hover){
	image_blend = c_white
} else {
	image_blend = c_ltgray
}

if (_hover && mouse_check_button_released(mb_left)) {
    var _list = global.notes[$ global.store_id];
	if (!is_undefined(_list) && array_length(_list) > 1) {
        global.heading = _list[0];
        array_copy(global.content, 0, _list, 1,  array_length(_list) - 1);
        room_goto(rm_notes)
    }
}
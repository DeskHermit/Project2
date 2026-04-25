image_speed = 0

var _hover = position_meeting(mouse_x, mouse_y, id)
var _click = _hover && mouse_check_button(mb_left)

if (_hover){
	image_blend = c_white
} else {
	image_blend = c_ltgray
}

if (_hover && mouse_check_button_released(mb_left)) {
    array_push(global.inventory.items, object_index);
    var _list = global.storage[$ global.store_id];
    if (!is_undefined(_list)) {
        var _idx = array_find_index(_list, function(_val) {
            return _val == object_index;
        });

        if (_idx != -1) {
            array_delete(_list, _idx, 1);
            show_debug_message("Deleted from storage. Remaining: " + string(array_length(_list)));
        }
    }
    
    instance_destroy();
}
if (mouse_check_button_pressed(mb_left)) {
    var _target = instance_position(mouse_x, mouse_y, obj_item_parent);
    
    if (_target != noone) {
        for (var i = 0; i < maxInvSlots; i++) {
            if (global.inventory.items[i] == noone) {
                var _obj_type = _target.object_index;
                global.inventory.items[i] = _obj_type;
                var _list = global.storage[$ global.store_id];
                if (!is_undefined(_list)) {
                    var _idx = -1;
                    for (var j = 0; j < array_length(_list); j++) {
                        if (_list[j] == _obj_type) {
                            _idx = j;
                            break;
                        }
                    }
                    
                    if (_idx != -1) {
                        array_delete(_list, _idx, 1);
						if (global.debug) 
							show_debug_message("Removed from storage data.");
                    }
                }
                instance_destroy(_target);
                
                exit; 
            }
        }
    }
}
var slot_w = sprite_get_width(spr_inventorybox);
var slot_h = sprite_get_height(spr_inventorybox);
var spacing = 8;
var total_w = (slot_w * 5) + (spacing * 4);
var startInvX = (display_get_gui_width() - total_w) / 2;
var startInvY = display_get_gui_height() - slot_h - 10;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

for (var i = 0; i < 5; i++) {
    var itemX = startInvX + (i * (slot_w + spacing));
    var itemY = startInvY;

    if (mx >= itemX && mx <= itemX + slot_w && my >= itemY && my <= itemY + slot_h) {
        var _item = global.inventory.items[i];
        
        if (mouse_check_button_pressed(mb_right) && _item != noone) {
            var _list = global.storage[$ global.store_id];
            
            if (!is_undefined(_list)) {
                var _is_unique = (_item == obj_flashlight_3D || _item == obj_staff_3D);
                var _already_exists = false;
                
                if (_is_unique) {
                    for (var j = 0; j < array_length(_list); j++) {
                        if (_list[j] == _item) {
                            _already_exists = true;
                            break;
                        }
                    }
                }

                if (!_already_exists) {
                    array_push(_list, _item);
                    
	                var _rx = x + irandom_range(40, 400);
	                var _ry = y + irandom_range(20, 150);
					if (!iftable){
						_rx = x + irandom_range(20, 105)
						_ry = y + irandom_range(20, 527)
					}
                    var _inst = instance_create_layer(_rx, _ry, "Instances", _item);
                    
					audio_play_sound(snd_pickup, 10, false);
					
                    _inst.image_xscale = 0.6;
                    _inst.image_yscale = 0.6;
                    _inst.depth = depth - 10;
                    
                    if (_item == obj_flashlight_3D) global.inventory.torch = false;
                    if (_item == obj_staff_3D) global.inventory.staff = false;
                    
                    global.inventory.items[i] = noone;
                    
                } else {
					if (global.debug)
	                    show_debug_message("You already have one of those on the table!");
                }
            }
        }
    }
}
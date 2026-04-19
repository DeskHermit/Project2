// 1. Math for inventory positions (Must match obj_permanent exactly)
var slot_w = sprite_get_width(spr_inventorybox);
var slot_h = sprite_get_height(spr_inventorybox);
var spacing = 8;
var total_w = (slot_w * 5) + (spacing * 4); // Assuming 5 slots
var startInvX = (display_get_gui_width() - total_w) / 2;
var startInvY = display_get_gui_height() - slot_h - 10;

// Use GUI coordinates for inventory clicking
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// 2. Loop through all slots so 'i' is defined
for (var i = 0; i < 5; i++) {
    var itemX = startInvX + (i * (slot_w + spacing));
    var itemY = startInvY;

    // 3. Check if mouse is over THIS specific slot
    if (mx >= itemX && mx <= itemX + slot_w && my >= itemY && my <= itemY + slot_h) {
        var _item = global.inventory.items[i];
        
        if (mouse_check_button_pressed(mb_right) && _item != noone) {
            var _list = global.storage[$ global.store_id];
            
            if (!is_undefined(_list)) {
                // Unique check for Torch and Staff
                var _is_unique = (_item == obj_torch_3D || _item == obj_staff_3D);
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
                    // Add to table data
                    array_push(_list, _item);
                    
                    // Drop physical item
                    var _rx = x + irandom_range(40, 400);
                    var _ry = y + irandom_range(20, 150);
                    var _inst = instance_create_layer(_rx, _ry, "Instances", _item);
                    
                    _inst.image_xscale = 0.6;
                    _inst.image_yscale = 0.6;
                    _inst.depth = depth - 10;
                    
                    // Sync the Booleans if unique
                    if (_item == obj_torch_3D) global.inventory.torch = false;
                    if (_item == obj_staff_3D) global.inventory.staff = false;
                    
                    // Clear the inventory slot
                    global.inventory.items[i] = noone;
                    
                } else {
                    show_debug_message("You already have one of those on the table!");
                }
            }
        }
    }
}
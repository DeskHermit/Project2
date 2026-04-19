// 1. Math for inventory positions
var slot_w = sprite_get_width(spr_inventorybox)
var slot_h = sprite_get_height(spr_inventorybox)
var spacing = 8
var total_w = (slot_w * 5) + (spacing * 4) 
var startInvX = (display_get_gui_width() - total_w) / 2
var startInvY = display_get_gui_height() - slot_h - 10

var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

// 2. Loop through all 5 slots
for (var i = 0; i < 5; i++) {
    var itemX = startInvX + (i * (slot_w + spacing))
    var itemY = startInvY
    
    // Check if mouse is hovering this slot
    if (mx >= itemX && mx <= itemX + slot_w && my >= itemY && my <= itemY + slot_h) {
        
        var _item = global.inventory.items[i] // This 'i' now works because of the loop!
        
        // 3. RIGHT CLICK TO DROP
        if (mouse_check_button_pressed(mb_right) && _item != noone) {
            
            // Add to the table data
            var _list = global.storage[$ global.store_id]
            if (!is_undefined(_list)) {
                array_push(_list, _item)
                
                // Create physical item on table relative to Manager
                var _rx = x + irandom_range(40, 400)
                var _ry = y + irandom_range(20, 150)
                var _inst = instance_create_layer(_rx, _ry, "Instances", _item)
                _inst.image_xscale = 0.6
                _inst.image_yscale = 0.6
                _inst.depth = depth - 10 // Stay on top of table
                
                // Remove from inventory
                global.inventory.items[i] = noone
            }
        }
    }
}
maxInvSlots = 5;
with (obj_item_parent) {
    instance_destroy();
}

var _items_to_spawn = global.storage[$ global.store_id];

if (!is_undefined(_items_to_spawn)) {
    if (global.debug) 
        show_debug_message("SUCCESS: Spawning " + string(array_length(_items_to_spawn)) + " items for " + string(global.store_id));
    
    for (var i = 0; i < array_length(_items_to_spawn); i++) {
        var _item = _items_to_spawn[i];
        
        var _rx = x + irandom_range(40, 460);
        var _ry = y + irandom_range(20, 100);
		
        if (_item != obj_flashlight_3D || (_item == obj_flashlight_3D && !global.inventory.torch)) {
            
            var _inst = instance_create_layer(_rx, _ry, "Instances", _item);
        
            _inst.image_xscale = 0.6;
            _inst.image_yscale = 0.6;
            _inst.depth = depth - 10;
        }
    }
} else {
    if (global.debug)
        show_debug_message("ERROR: Manager could not find list for ID: " + string(global.store_id));
}
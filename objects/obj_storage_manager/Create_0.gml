// 1. CLEAR THE ROOM (The Wipe)

maxInvSlots = 5
// We destroy any items manually placed in the editor to prevent duplicates
with (obj_item_parent) {
    instance_destroy()
}

// 2. CHECK THE DATA (The Rebuild)
// If global.store_id is "outsidetable1", this looks for global.storage.outsidetable1
var _items_to_spawn = global.storage[$ global.store_id]

if (!is_undefined(_items_to_spawn)) {
    show_debug_message("SUCCESS: Spawning " + string(array_length(_items_to_spawn)) + " items for " + string(global.store_id))
    
    for (var i = 0; i < array_length(_items_to_spawn); i++) {
        // Spread across the table relative to manager position
        var _rx = x + irandom_range(40, 460)
        var _ry = y + irandom_range(20, 180)
        
        var _inst = instance_create_layer(_rx, _ry, "Instances", _items_to_spawn[i])
        
        // Apply your size and depth fixes
        _inst.image_xscale = 0.6
        _inst.image_yscale = 0.6
        _inst.depth = depth - 10
    }
} else {
    // This is your warning light!
    show_debug_message("ERROR: Manager could not find list for ID: " + string(global.store_id))
}
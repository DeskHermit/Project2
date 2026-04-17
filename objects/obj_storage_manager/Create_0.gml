
items = [];
if (variable_struct_exists(global.storage, global.store_id)) {
    items = global.storage[$ global.store_id]
}

_manage = [obj_battery_3D, obj_notes_3D, obj_flashlight_3D, obj_fuse_3D, obj_hammer_3D, obj_key_3D];
for(var i=0; i < array_length(_manage); i++) {
    instance_deactivate_object(_manage[i])
}

for(var i=0; i < array_length(items); i++) {
    instance_activate_object(items[i])
}
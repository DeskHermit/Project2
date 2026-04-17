if (variable_struct_exists(global.storage, global.store_id)) {
    items = global.storage[$ global.store_id]
}

for(var i=0; i < array_length(_manage); i++) {
    instance_deactivate_object(_manage[i])
}

for(var i=0; i < array_length(items); i++) {
    instance_activate_object(items[i])
}
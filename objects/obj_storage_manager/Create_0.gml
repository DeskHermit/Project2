maxInvSlots = 5;

if (room == rm_outside_table) {
	audio_play_sound(snd_night,40,true)
} else {
	audio_play_sound(snd_airvents,40,true)
}


with (obj_item_parent) {
    instance_destroy();
}

var _items_to_spawn = global.storage[$ global.store_id];

if (!is_undefined(_items_to_spawn)) {
	if (global.debug) {
		show_debug_message("SUCCESS: Spawning " + string(array_length(_items_to_spawn)) + " items for " + string(global.store_id));
	}

	var _spawn_points_table = [
		[80, 50],
		[180, 50],
		[280, 50],
		[380, 50],
		[120, 120],
		[240, 120],
		[360, 120]
	];

	var _spawn_points_cupboard = [
		[40, 60],
		[40, 150],
		[40, 240],
		[40, 330],
		[40, 420]
	];

	var _spawn_points = _spawn_points_table;

	if (!iftable) {
		_spawn_points = _spawn_points_cupboard;
	}

	var _spawn_index = 0;

	for (var i = 0; i < array_length(_items_to_spawn); i++) {
		var _item = _items_to_spawn[i];

		if (_item == obj_flashlight_3D && global.inventory.torch) {
			continue;
		}

		if (_spawn_index >= array_length(_spawn_points)) {
			break;
		}

		var _pos = _spawn_points[_spawn_index];

		var _rx = x + _pos[0];
		var _ry = y + _pos[1];

		var _inst = instance_create_layer(_rx, _ry, "Instances", _item);

		_inst.image_xscale = 0.6;
		_inst.image_yscale = 0.6;
		_inst.depth = depth - 10 - _spawn_index;

		_spawn_index++;
	}
}
else {
	if (global.debug) {
		show_debug_message("ERROR: Manager could not find list for ID: " + string(global.store_id));
	}
}
if (mouse_check_button_released(mb_left)) {
	var _list_hits = ds_list_create();

	var _count = collision_point_list(
		mouse_x,
		mouse_y,
		obj_item_parent,
		false,
		true,
		_list_hits,
		false
	);

	if (_count > 0) {
		var _target = noone;

		for (var h = 0; h < _count; h++) {
			var _candidate = _list_hits[| h];

			if (_target == noone) {
				_target = _candidate;
			}
			else if (_candidate.depth < _target.depth) {
				_target = _candidate;
			}
		}

		if (_target != noone) {
			var _obj_type = _target.object_index;

			// Special pickup: flashlight does not use inventory slot.
			if (_obj_type == obj_flashlight_3D) {
				global.inventory.torch = true;

				scr_textbox("Flashlight acquired! Toggle F and aim your light.", c_lime, , , 50, 300, , true);
				scr_textbox("Careful: The light scares bats but drains your battery! Use battery to refill the bar", c_lime, , , 150, 300, , true);

				audio_play_sound(snd_pickup_item2, 31, false);

				var _storage_list = global.storage[$ global.store_id];

				if (!is_undefined(_storage_list)) {
					for (var j = 0; j < array_length(_storage_list); j++) {
						if (_storage_list[j] == _obj_type) {
							array_delete(_storage_list, j, 1);
							break;
						}
					}
				}

				instance_destroy(_target);
				ds_list_destroy(_list_hits);
				exit;
			}

			// Special pickup: staff does not use inventory slot.
			if (_obj_type == obj_staff_3D) {
				global.inventory.staff = true;

				scr_textbox("You open a portal to escape!", c_lime, , , 50, 300, , true);

				audio_play_sound(snd_pickup_item2, 31, false);

				var _storage_list = global.storage[$ global.store_id];

				if (!is_undefined(_storage_list)) {
					for (var j = 0; j < array_length(_storage_list); j++) {
						if (_storage_list[j] == _obj_type) {
							array_delete(_storage_list, j, 1);
							break;
						}
					}
				}

				instance_destroy(_target);
				ds_list_destroy(_list_hits);
				exit;
			}

			// Normal inventory item pickup.
			var _free_slot = -1;

			for (var i = 0; i < maxInvSlots; i++) {
				if (global.inventory.items[i] == noone) {
					_free_slot = i;
					break;
				}
			}

			if (_free_slot != -1) {
				global.inventory.items[_free_slot] = _obj_type;
				audio_play_sound(snd_pickup_item2, 31, false);

				var _storage_list = global.storage[$ global.store_id];

				if (!is_undefined(_storage_list)) {
					var _idx = -1;

					for (var j = 0; j < array_length(_storage_list); j++) {
						if (_storage_list[j] == _obj_type) {
							_idx = j;
							break;
						}
					}

					if (_idx != -1) {
						array_delete(_storage_list, _idx, 1);

						if (global.debug) {
							show_debug_message("Removed from storage data.");
						}
					}
				}

				instance_destroy(_target);
			}
			else {
				if (global.debug) {
					show_debug_message("Inventory full.");
				}
			}
		}
	}

	ds_list_destroy(_list_hits);
}
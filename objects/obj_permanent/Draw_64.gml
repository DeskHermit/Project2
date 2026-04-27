display_set_gui_size(1920, 1080);

var _wiz = instance_find(obj_wizard, 0);

if (!array_contains(no_rooms, room) && !array_contains(table_rooms,room)) {
    var _tx = 1800;
    var _ty = 40;
    
    if (!instance_exists(obj_pause_sml)) {
        _ins = instance_create_depth(_tx, _ty, -10000, obj_pause_sml)
		_ins.image_xscale = 0.2
        _ins.image_yscale = 0.2
    }
}

if (!array_contains(no_rooms, room)) {
    #region

    var inv_scale = 0.7; 
    
    var slot_w = sprite_get_width(spr_inventorybox) * inv_scale;
    var slot_h = sprite_get_height(spr_inventorybox) * inv_scale;
    var spacing = 6;
    
    var total_w = (slot_w * maxInvSlots) + (spacing * (maxInvSlots - 1));

    var startInvX = (display_get_gui_width() - total_w) / 2;
    var startInvY = display_get_gui_height() - slot_h - 10;
    
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    for (var inv = 0; inv < maxInvSlots; inv++) {
        var itemX = startInvX + (inv * (slot_w + spacing));
        var itemY = startInvY;
        var is_hovered = (mx >= itemX && mx <= itemX + slot_w && my >= itemY && my <= itemY + slot_h);

        draw_sprite_ext(spr_inventorybox, 0, itemX, itemY, inv_scale, inv_scale, 0, c_white, 1);

        var item = global.inventory.items[inv];

        if (item != noone) {
            var spr = object_get_sprite(item);
            
            if (spr != -1) {
                if (is_hovered && mouse_check_button_pressed(mb_left)) {
                    if (array_contains(table_rooms, room)) {
                        var _list = global.storage[$ global.store_id]
                        
                        if (!is_undefined(_list)) {
                            array_push(_list, item)
                            if (instance_exists(obj_storage_manager)) {
                                var _rx = obj_storage_manager.x + irandom_range(40, 400)
                                var _ry = obj_storage_manager.y + irandom_range(20, 150)
                                
                                var _inst = instance_create_layer(_rx, _ry, "Instances", item)
                                _inst.image_xscale = 0.6
                                _inst.image_yscale = 0.6
                                _inst.depth = obj_storage_manager.depth - 10
                            }
							audio_play_sound(snd_pickup_item, 10, false);
                            global.inventory.items[inv] = noone
                            if (global.debug) 
								show_debug_message("Dropped " + object_get_name(item) + " onto table.")
                        }
                    } 
                    else {
                        if (item == obj_battery_3D) {
						    if (instance_exists(_wiz)) {
						        var _battery_bonus = floor(_wiz.battery) * 10;

						        global.score += _battery_bonus;
						        global.score = min(global.score, global.score_max);

						        _wiz.battery = 100;
						        _wiz.flashlight_on = true;
						        audio_play_sound(snd_pickup_item, 10, false);
						        global.inventory.items[inv] = noone;

						        if (global.debug) {
						            show_debug_message("Battery Consumed. Score bonus: " + string(_battery_bonus));
						        }
						    }
						}
						
						if (item == obj_burger_3D) {
							var _old_hp = global.inventory.hp;
							var _heal_amount = 30;
							var _new_hp = _old_hp + _heal_amount;

							var _overheal = max(_new_hp - 100, 0);

							if (_overheal > 0) {
								var _score_bonus = _overheal * 10;
								global.score += _score_bonus;
								global.score = min(global.score, global.score_max);
							}

							global.inventory.hp = clamp(_new_hp, 0, 100);

							if (instance_exists(_wiz)) {
								if (_overheal > 0) {
									_wiz.overheal_time = 60;
								}
								else {
									_wiz.food_time = 45;
								}
							}

							audio_play_sound(snd_nom, 10, false);
							global.inventory.items[inv] = noone;
						}
						
						if (item == obj_chips_3D) {
							var _old_hp = global.inventory.hp;
							var _heal_amount = 10;
							var _new_hp = _old_hp + _heal_amount;

							var _overheal = max(_new_hp - 100, 0);

							if (_overheal > 0) {
								var _score_bonus = _overheal * 10;
								global.score += _score_bonus;
								global.score = min(global.score, global.score_max);
							}

							global.inventory.hp = clamp(_new_hp, 0, 100);

							if (instance_exists(_wiz)) {
								if (_overheal > 0) {
									_wiz.overheal_time = 60;
								}
								else {
									_wiz.food_time = 45;
								}
							}

							audio_play_sound(snd_nom, 10, false);
							global.inventory.items[inv] = noone;
						}
                    }
                }
                
                var spr_w = sprite_get_width(spr);
                var spr_h = sprite_get_height(spr);
                
                var item_scale = min(slot_w / spr_w, slot_h / spr_h) * 0.8;

                var drawX = itemX + (slot_w / 2);
                var drawY = itemY + (slot_h / 2);

                draw_sprite_ext(spr, 0, drawX, drawY, item_scale, item_scale, 0, c_white, 1);
            }
        }
    }
    #endregion
}
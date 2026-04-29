var _wiz = instance_nearest(x, y, obj_wizard);
var _personal_space = 70; 
var _damage_range = 85;   

if (_wiz != noone) {
    var _dist = point_distance(x, y, _wiz.x, _wiz.y);

    if (!is_chasing && _dist <= detect_range) {
        is_chasing = true;
        is_returning = false;
        
        spawn_x = x;
        spawn_y = y;
        saved_path_pos = path_position; 
        
        path_end();
    }

    if (is_chasing) {
        global.chasing = true;
        var _dir_to_wiz = point_direction(x, y, _wiz.x, _wiz.y);

        if (_dist < _personal_space) {
            path_end();
            
            var _move_dir = point_direction(_wiz.x, _wiz.y, x, y);
            var _xspd = lengthdir_x(chase_speed, _move_dir);
            var _yspd = lengthdir_y(chase_speed, _move_dir);
            
            move_and_collide(_xspd, _yspd, [obj_collision, obj_door]);
            image_angle = _dir_to_wiz - 90;
        } 
        else {
            path_update_timer--;
            if (path_update_timer <= 0) {
                path_update_timer = 15;
                
                if (mp_grid_path(global.grid, my_path, x, y, _wiz.x, _wiz.y, true)) {
                    path_start(my_path, chase_speed, path_action_stop, true);
                }
            }
            image_angle = _dir_to_wiz - 90;
        }

        if (_dist <= _damage_range && _wiz.h_time <= 0) {
            audio_play_sound(snd_wizard_death_temp, 10, false);
            if (!global.inventory.hp_cheat) global.inventory.hp -= 30;
            _wiz.h_time = 560; 
            if (global.inventory.hp <= 0){
                room_persistent = false;
                room_goto(rm_end_negative_screen);
            }
        }

        if (_dist >= lose_range) {
            is_chasing = false;
            is_returning = true;
            path_end();
        }
    } 
    else if (is_returning) {
        path_update_timer--;
        if (path_update_timer <= 0) {
            path_update_timer = 20;
            if (mp_grid_path(global.grid, my_path, x, y, spawn_x, spawn_y, true)) {
                path_start(my_path, chase_speed, path_action_stop, true);
            }
        }
        
        if (path_speed > 0) image_angle = direction - 90;
        
        if (point_distance(x, y, spawn_x, spawn_y) < 10) {
            is_returning = false;
            path_end();
            
            path_start(patrol_path, patrol_speed, path_action_restart, true);
            path_position = saved_path_pos; 
        }
    }
    else {
        if (path_speed > 0) image_angle = direction - 90;
    }
}
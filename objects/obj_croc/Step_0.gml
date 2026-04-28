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
        path_end();
    }

    if (is_chasing) {
        global.chasing = true;

        var _dir_to_wiz = point_direction(x, y, _wiz.x, _wiz.y);

        if (_dist < _personal_space) {
            var _move_dir = point_direction(_wiz.x, _wiz.y, x, y);
            x += lengthdir_x(chase_speed, _move_dir);
            y += lengthdir_y(chase_speed, _move_dir);
            speed = 0; 
            image_angle = _dir_to_wiz - 90;
        } 
        else {
            move_towards_point(_wiz.x, _wiz.y, chase_speed);
            image_angle = _dir_to_wiz - 90;
        }

        if (_dist <= _damage_range && _wiz.h_time <= 0) {
            audio_play_sound(snd_wizard_death_temp, 10, false);
            if (!global.inventory.hp_cheat) global.inventory.hp -= 30;
            _wiz.h_time = 460; 
            if (global.inventory.hp <= 0){ 
				room_persistent = false
				room_goto(rm_end_negative_screen);
			}
        }

        if (_dist >= lose_range) {
			global.chasing = false;
            is_chasing = false;
            is_returning = true;
        }
    } 
    else if (is_returning) {
        move_towards_point(spawn_x, spawn_y, chase_speed);
        image_angle = point_direction(x, y, spawn_x, spawn_y) - 90;
        
        if (point_distance(x, y, spawn_x, spawn_y) < 5) {
            is_returning = false;
            speed = 0;
            path_start(patrol_path, patrol_speed, path_action_restart, false);
        }
    }
    else {
        image_angle = direction - 90;
    }
}
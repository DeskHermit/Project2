var _wiz = instance_nearest(x, y, obj_wizard);
var _personal_space = 60;
var _damage_range = 80;

visible_in_light = false; 
if (_wiz != noone) {
    var _dist_to_p = point_distance(x, y, _wiz.x, _wiz.y);
    if (_dist_to_p <= 60) visible_in_light = true;

    if (!visible_in_light && _wiz.flashlight_on) {
        var _dir_to_bat = point_direction(_wiz.x, _wiz.y, x, y);
        var _angle_diff = angle_difference(_wiz.target_angle, _dir_to_bat);
        if (abs(_angle_diff) <= 45 && _dist_to_p <= 1000) visible_in_light = true;
    }
}

if (visible_in_light) seen_timer = seen_time_max;
else if (seen_timer > 0) seen_timer--;

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
            if (visible_in_light) {
                move_towards_point(_wiz.x, _wiz.y, -chase_speed);
                image_angle = _dir_to_wiz + 90;
            } else {
                move_towards_point(_wiz.x, _wiz.y, chase_speed);
                image_angle = _dir_to_wiz - 90;
            }
        }

        if (_dist >= lose_range) {
            is_chasing = false;
            is_returning = true;
			global.chasing = false
        }
        
       if (_dist <= _damage_range && _wiz.h_time <= 0) {
            audio_play_sound(snd_wizard_death_temp, 10, false);
            if (!global.inventory.hp_cheat) global.inventory.hp -= 10;
            _wiz.h_time = 360;
            if (global.inventory.hp <= 0) room_goto(rm_end_negative_screen);
        }
        
    } else if (is_returning) {
        move_towards_point(spawn_x, spawn_y, chase_speed);
        image_angle = point_direction(x, y, spawn_x, spawn_y) - 90;
        
        if (point_distance(x, y, spawn_x, spawn_y) < 5) {
            is_returning = false;
            speed = 0;
            path_start(patrol_path, patrol_speed, path_action_restart, false);
        }
    } else {
        image_angle = direction - 90;
    }
}

squeak_timer--;
if (squeak_timer <= 0) {
    if (_wiz != noone) {
        var _dist_snd = point_distance(x, y, _wiz.x, _wiz.y);
        var _vol = clamp(1 - (_dist_snd / 800), 0.1, 1.0); 
        if (is_chasing) _vol = clamp(_vol + 0.3, 0.1, 1.0);
        var _snd = audio_play_sound_at(snd_bat_chirp, x, y, 0, 100, 800, 1, false, 10);
        audio_sound_gain(_snd, _vol, 0);
        audio_sound_pitch(_snd, random_range(0.8, 1.2));
    }
    squeak_timer = irandom_range(squeak_min, squeak_max);
}
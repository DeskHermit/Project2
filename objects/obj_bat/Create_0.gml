patrol_path = path;
patrol_speed = 2;
chase_speed = 3;
_room = room

detect_range = 140;
lose_range = 220;

is_chasing = false;

path_start(patrol_path, patrol_speed, path_action_restart, true);

squeak_min = room_speed * 2;
squeak_max = room_speed * 5;
squeak_timer = irandom_range(squeak_min, squeak_max);

visible_in_light = false;
has_been_seen = false;
seen_timer = 0;
seen_time_max = room_speed*2; 

spawn_x = x;
spawn_y = y;
is_returning = false;

audio_falloff_set_model(audio_falloff_linear_distance);
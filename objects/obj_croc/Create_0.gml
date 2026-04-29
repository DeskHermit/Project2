patrol_path = path;
patrol_speed = 1;
chase_speed = 1.5;
_room = room

detect_range = 140;
lose_range = 220;

is_chasing = false;
path_start(patrol_path, patrol_speed, path_action_restart, true);

squeak_timer = 0;
squeak_min = 60; 
squeak_max = 180;
spatial_snd = snd_walking_croc;

spawn_x = x;
spawn_y = y;
is_returning = false;

my_path = path_add();
path_update_timer = 0;
saved_path_pos = 0;
patrol_path = man_path;
patrol_speed = 1.5;
chase_speed = 2;
_room = room

detect_range = 200;
lose_range = 320;

is_chasing = false;
path_start(patrol_path, patrol_speed, path_action_restart, true);


spawn_x = x;
spawn_y = y;
is_returning = false;

my_path = path_add();
path_update_timer = 0;

step_timer = 0;
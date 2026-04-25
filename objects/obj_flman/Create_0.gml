patrol_path = man_path;
patrol_speed = 1.5;
chase_speed = 2;

detect_range = 200;
lose_range = 320;

is_chasing = false;
path_start(patrol_path, patrol_speed, path_action_restart, true);
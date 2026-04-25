patrol_path = man_path;
patrol_speed = 1;
chase_speed = 1.5;

detect_range = 140;
lose_range = 220;

is_chasing = false;
path_start(patrol_path, patrol_speed, path_action_restart, true);
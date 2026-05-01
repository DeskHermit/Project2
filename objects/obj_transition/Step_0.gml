if (fade) {
    // --- 1. IMMEDIATE ACTIONS (Happens before the fade finishes) ---
    if (_room == -2) {
	    if (!instance_exists(obj_pause_screen)) {
	        instance_create_depth(0, 0, -10000, obj_pause_screen);
	    }

	    instance_destroy();
	    exit;
	}
    if (_room == -3) {
        if (instance_exists(obj_pause_screen)) obj_pause_screen.is_paused = false
        instance_destroy()
        exit
    }
    
    alpha += _speed

    // --- 2. DELAYED ACTIONS (Happens when screen is black) ---
    if (alpha >= 0.9) {
        alpha = 1
        
        if (_room == -1) game_end()
        
        if (_room == -4) {
             room_goto(global.last_room)
        } 
        else if (room_exists(_room) && _room >= 0) { 
            // The ">= 0" ensures we don't treat -1 or -4 as a room ID
            instance_activate_all()
            instance_activate_object(obj_permanent)
            room_goto(_room)
        }
        
        fade = false
    }
} else {
    alpha -= _speed
    if (alpha <= 0) {
        alpha = 0
        instance_destroy()
    }
}
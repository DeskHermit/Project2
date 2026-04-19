if fade {
	if (_room==-2){
		pau_scr = instance_create_depth(0,0,-10000,obj_pause_screen)
		instance_destroy()
	}
	if (_room==-3){
		if(instance_exists(obj_pause_screen)) {
			obj_pause_screen.is_paused = false
		}
		instance_destroy()
	}
	if (_room=-4) {
		 room_goto(global.last_room)
	}
	alpha+=_speed
	if (alpha >= 0.9) {
		alpha = 1
		if (_room==-1){
			//scr_save_game()
			game_end()
		}
		if room_exists(_room) {
		    instance_activate_all()
		    instance_activate_object(obj_permanent)
		    room_goto(_room)
		}
		fade = false
	}
}
else {
	alpha-=_speed
	if(alpha <= 0) {
		alpha = 0
		instance_destroy()
	}
}
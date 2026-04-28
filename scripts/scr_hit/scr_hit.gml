function scr_hit(hp){
	wiz = instance_find(obj_wizard,0)
	audio_play_sound(snd_wizard_death_temp, 10, false);
	if (!global.inventory.hp_cheat) {
	    global.inventory.hp -= hp;
	}
	wiz.h_time = 360; 
	if (global.inventory.hp <= 0) {
		room_persistent = false
	    room_goto(rm_end_negative_screen);
	}
}
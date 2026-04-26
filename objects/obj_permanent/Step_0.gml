if (keyboard_check(vk_control) && keyboard_check_pressed(ord("M"))) {
	global.inventory.hp_cheat = !global.inventory.hp_cheat
	if (global.inventory.hp_cheat)
		scr_textbox("health cheat activated!",c_blue)
	else
		scr_textbox("health cheat disabled!",c_blue)
}

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("M"))) {
    global.inventory.hp_cheat = !global.inventory.hp_cheat
    scr_textbox(global.inventory.hp_cheat ? "health cheat activated!" : "health cheat disabled!", c_blue)
}

if (global.chasing) {
    if (!audio_is_playing(snd_high_chase_bg_music)) {
        audio_play_sound(snd_high_chase_bg_music, 100, true)
        audio_sound_gain(snd_high_chase_bg_music, 0, 0)
    }
    
    audio_sound_gain(snd_high_chase_bg_music, 0.6, 1000)
    audio_sound_gain(current_music, 0, 1000)
} 
else if (silent) {
    audio_sound_gain(snd_high_chase_bg_music, 0, 1000)
    audio_sound_gain(current_music, 0, 1000)
}
else {
    audio_sound_gain(snd_high_chase_bg_music, 0, 1000)

    switch (music_state) {
        case "playing":
            music_timer--
            if (audio_sound_get_gain(current_music) < 0.6) {
                audio_sound_gain(current_music, 0.6, 1000)
            }

            if (music_timer <= 0) {
                music_state = "fading_out"
                audio_sound_gain(current_music, 0, 3000)
            }
        break

        case "fading_out":
            if (audio_sound_get_gain(current_music) <= 0.01) {
                music_state = "silent"
                music_timer = irandom_range(1200, 1800)
            }
        break

        case "silent":
            music_timer--
            audio_sound_gain(current_music, 0, 1000)
            if (music_timer <= 0) {
                music_state = "fading_in"
                audio_sound_gain(current_music, 0.6, 3000)
            }
        break

        case "fading_in":
            if (audio_sound_get_gain(current_music) >= 0.59) {
                music_state = "playing"
                music_timer = irandom_range(3000, 4800)
            }
        break
    }
}
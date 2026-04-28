if (keyboard_check(vk_control) && keyboard_check_pressed(ord("H"))) {
    global.inventory.hp_cheat = !global.inventory.hp_cheat
    scr_textbox(global.inventory.hp_cheat ? "Health cheat activated!" : "Health cheat disabled!", c_blue)
}

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("B"))) {
    global.inventory.battery_cheat = !global.inventory.battery_cheat
    scr_textbox(global.inventory.battery_cheat ? "Battery cheat activated!" : "Battery cheat disabled!", c_blue)
}

if (keyboard_check_pressed(vk_f11))
    window_set_fullscreen(!window_get_fullscreen())

if (global.chasing) {
    if (!audio_is_playing(snd_high_chase_bg_music)) {
        audio_play_sound(snd_high_chase_bg_music, 100, true)
        audio_sound_gain(snd_high_chase_bg_music, 0, 0)
    }
    
    audio_sound_gain(snd_high_chase_bg_music, 0.4, 1000)
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
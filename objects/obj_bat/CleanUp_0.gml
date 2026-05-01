if (audio_is_playing(last_chirp_snd)) {
    audio_stop_sound(last_chirp_snd);
}

if (audio_emitter_exists(bat_emitter)) {
    audio_emitter_free(bat_emitter);
}
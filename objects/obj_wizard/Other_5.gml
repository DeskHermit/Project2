global.inventory.battery = battery;

if (audio_is_playing(walk_snd)) {
    audio_stop_sound(walk_snd);
}
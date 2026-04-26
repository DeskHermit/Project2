squeak_timer--;

if (squeak_timer <= 0) {
    audio_play_sound_at(
        snd_bat_chirp,
        x, y, 0, 
        400,
        100,
        1,
        false,
        0,
        1.0
    );

    squeak_timer = irandom_range(squeak_min, squeak_max);
}
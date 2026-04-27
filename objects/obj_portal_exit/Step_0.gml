if (global.inventory.staff) {
    portal_active = true;
    image_alpha = 1;

    if (!audio_is_playing(portal_sound)) {
        portal_sound = audio_play_sound(snd_portal, 40, true);

        if (audio_is_playing(portal_sound)) {
            audio_sound_gain(portal_sound, 0.25, 1000);
            audio_sound_pitch(portal_sound, 0.85);
        }
    }

    var _contact = place_meeting(x, y, obj_wizard);

    if (_contact) {
        global.score_stopped = true;
        global.final_score = floor(global.score);

        global.chasing = false;

        if (audio_is_playing(portal_sound)) {
            audio_sound_gain(portal_sound, 0, 500);
        }

        room_goto(rm_portal);
    }
}
else {
    portal_active = false;
    image_alpha = 0;

    if (audio_is_playing(portal_sound)) {
        audio_sound_gain(portal_sound, 0, 500);
    }
}
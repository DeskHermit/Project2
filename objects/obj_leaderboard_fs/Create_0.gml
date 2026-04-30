heading = "Leaderboard";

base_sprite = sprite_index;
sprite_index = -1;

scroll_y = 0;
scroll_speed = 36;

row_h = 48;
visible_rows = 10;

paper_sound = audio_play_sound(snd_paper_rustling, 40, true);

scr_load_leaderboard();
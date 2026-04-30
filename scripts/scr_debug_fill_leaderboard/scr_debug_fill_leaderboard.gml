function scr_debug_fill_leaderboard() {
    global.leaderboard = [
        { score: 10000, time_frames: room_speed * 45 },
        { score: 9820,  time_frames: room_speed * 52 },
        { score: 9650,  time_frames: room_speed * 61 },
        { score: 9430,  time_frames: room_speed * 74 },
        { score: 9210,  time_frames: room_speed * 89 },
        { score: 8990,  time_frames: room_speed * 104 },
        { score: 8750,  time_frames: room_speed * 126 },
        { score: 8520,  time_frames: room_speed * 139 },
        { score: 8300,  time_frames: room_speed * 155 },
        { score: 8010,  time_frames: room_speed * 174 },
        { score: 7780,  time_frames: room_speed * 193 },
        { score: 7540,  time_frames: room_speed * 221 },
        { score: 7310,  time_frames: room_speed * 248 },
        { score: 7090,  time_frames: room_speed * 275 },
        { score: 6820,  time_frames: room_speed * 301 },
        { score: 6600,  time_frames: room_speed * 336 },
        { score: 6370,  time_frames: room_speed * 372 },
        { score: 6110,  time_frames: room_speed * 408 },
        { score: 5890,  time_frames: room_speed * 455 },
        { score: 5600,  time_frames: room_speed * 502 },
        { score: 5340,  time_frames: room_speed * 549 },
        { score: 5100,  time_frames: room_speed * 601 },
        { score: 4860,  time_frames: room_speed * 663 },
        { score: 4590,  time_frames: room_speed * 727 },
        { score: 4300,  time_frames: room_speed * 790 }
    ];

    scr_save_leaderboard();

    show_debug_message("Debug leaderboard filled with " + string(array_length(global.leaderboard)) + " scores.");
}
function scr_show_leaderboard() {
    scr_load_leaderboard();

    global.heading = "Leaderboard";
    global.content = [];

    room_goto(rm_notes_leaderboard);
}
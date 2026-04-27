function scr_show_leaderboard() {
    scr_load_leaderboard();

    var _content = [];

    if (array_length(global.leaderboard) <= 0) {
        array_push(_content, "No scores recorded yet.");
    }
    else {
        array_push(_content, "Highest scores recovered from past runs:");

        for (var i = 0; i < array_length(global.leaderboard); i++) {
            var _rank = i + 1;
            var _score = global.leaderboard[i];

            array_push(_content, string(_rank) + ". " + string(_score));
        }
    }

    global.heading = "Leaderboard";
    global.content = _content;

    room_goto(rm_notes);
}
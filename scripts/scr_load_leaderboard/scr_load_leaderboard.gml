function scr_load_leaderboard() {
    global.leaderboard = [];

    if (file_exists("leaderboard.json")) {
        var _file = file_text_open_read("leaderboard.json");
        var _json = file_text_read_string(_file);
        file_text_close(_file);

        if (_json != "") {
            global.leaderboard = json_parse(_json);
        }
    }

    for (var i = 0; i < array_length(global.leaderboard); i++) {
        if (!is_struct(global.leaderboard[i])) {
            global.leaderboard[i] = {
                score: floor(global.leaderboard[i]),
                time_frames: 0
            };
        }
    }

    array_sort(global.leaderboard, function(_a, _b) {
        return _b.score - _a.score;
    });
}
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
}
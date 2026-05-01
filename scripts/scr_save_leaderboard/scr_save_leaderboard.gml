function scr_save_leaderboard() {
    var _json = json_stringify(global.leaderboard);

    var _file = file_text_open_write("leaderboard.json");
    file_text_write_string(_file, _json);
    file_text_close(_file);
}
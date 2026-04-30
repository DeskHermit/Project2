function scr_add_score_to_leaderboard(_score, _time_frames = 0) {
    var _entry = {
        score: floor(_score),
        time_frames: floor(_time_frames)
    };

    array_push(global.leaderboard, _entry);

    array_sort(global.leaderboard, function(_a, _b) {
        var _score_a = is_struct(_a) ? _a.score : _a;
        var _score_b = is_struct(_b) ? _b.score : _b;

        return _score_b - _score_a;
    });

    while (array_length(global.leaderboard) > 50) {
        array_delete(global.leaderboard, array_length(global.leaderboard) - 1, 1);
    }

    scr_save_leaderboard();
}
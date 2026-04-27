function scr_add_score_to_leaderboard(_score) {
    array_push(global.leaderboard, floor(_score));

    array_sort(global.leaderboard, function(_a, _b) {
        return _b - _a;
    });

    while (array_length(global.leaderboard) > 10) {
        array_delete(global.leaderboard, array_length(global.leaderboard) - 1, 1);
    }

    scr_save_leaderboard();
}
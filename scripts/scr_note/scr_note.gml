function scr_note(_h, _c, _lh = 30, _ps = 40, _w = 400) {
    var _note = instance_find(obj_note_fs, 0);

    if (!instance_exists(_note)) {
        _note = instance_create_depth(0, 0, -20000, obj_note_fs);
    }

    with (_note) {
        show_debug_message("Opening note: " + string(_h));
        heading = _h;
        content = _c;
        line_height = _lh;
        para_spacing = _ps;
        width_limit = _w;
    }
}
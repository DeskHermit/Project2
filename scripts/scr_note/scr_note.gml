function scr_note(_h, _c, _lh = 30, _ps = 40, _w = 400){
	_note = instance_find(obj_note_fs, 0);
	if (instance_exists(_note)) {
        with (_note) {
			show_debug_message("in the notes")
            heading = _h;
            content = _c;
            line_height = _lh;
            para_spacing = _ps;
            width_limit = _w;
        }
    }
}
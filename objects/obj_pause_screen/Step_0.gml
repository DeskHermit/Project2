if (is_paused && !saved) {
	pause_surf = surface_create(
		surface_get_width(application_surface),
		surface_get_height(application_surface)
	);

	surface_copy(pause_surf, 0, 0, application_surface);

	instance_deactivate_all(true);
	instance_activate_object(obj_permanent);
	instance_activate_object(obj_pause_screen);

	var _gw = display_get_gui_width();
	var _gh = display_get_gui_height();

	// Create panel at center.
	ob_panel = instance_create_depth(_gw / 2, _gh / 2, -10001, obj_pause_panel);

	with (ob_panel) {
		var _target_w = 1000;
		image_xscale = _target_w / sprite_get_width(sprite_index);
		image_yscale = image_xscale;
	}

	// Resume button.
	ob_res = instance_create_depth(_gw / 2, _gh / 2 - 100, -10002, obj_resume);

	with (ob_res) {
		image_xscale = 350 / sprite_get_width(sprite_index);
		image_yscale = image_xscale;
	}

	// Instructions button.
	ob_inst = instance_create_depth(_gw / 2, _gh / 2 + 35, -10002, obj_pause_instructions);

	with (ob_inst) {
		image_xscale = 350 / sprite_get_width(sprite_index);
		image_yscale = image_xscale;
	}

	// Quit button.
	ob_qu = instance_create_depth(_gw / 2, _gh / 2 + 210, -10002, obj_quit_1);
	ob_qu.b_room = 0;

	with (ob_qu) {
		image_xscale = 350 / sprite_get_width(sprite_index);
		image_yscale = image_xscale;
	}

	saved = true;
}

if (!is_paused && saved) {
	if (instance_exists(ob_res)) {
		instance_destroy(ob_res);
	}

	if (instance_exists(ob_qu)) {
		instance_destroy(ob_qu);
	}

	if (instance_exists(ob_inst)) {
		instance_destroy(ob_inst);
	}

	if (instance_exists(ob_panel)) {
		instance_destroy(ob_panel);
	}

	if (surface_exists(pause_surf)) {
		surface_free(pause_surf);
	}

	instance_activate_all();
	instance_destroy();
}
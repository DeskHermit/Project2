if (is_paused && !saved) {
    pause_surf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
    surface_copy(pause_surf, 0, 0, application_surface);
    
    instance_deactivate_all(true);
    instance_activate_object(obj_permanent);

    var _gw = display_get_gui_width();
    var _gh = display_get_gui_height();
    
    // Create Panel at dead center
    ob_panel = instance_create_depth(_gw/2, _gh/2, -10001, obj_pause_panel);
    with (ob_panel) {
        var _target_w = 1000; // Smaller size for the panel
        image_xscale = _target_w / sprite_get_width(sprite_index);
        image_yscale = image_xscale;
    }
	
	ob_mu = instance_create_depth(_gw - 100, 15, -10002, obj_mute)
    ob_mu.pause = true
    instance_activate_object(ob_mu)
    with (ob_mu) {
        image_xscale = 120 / sprite_get_width(sprite_index); // Slightly bigger mute
        image_yscale = image_xscale;
    }
    
    // Create Buttons relative to the center
    ob_res = instance_create_depth(_gw/2, _gh/2 - 60, -10002, obj_resume);
    with (ob_res) {
        image_xscale = 350 / sprite_get_width(sprite_index);
        image_yscale = image_xscale;
    }

    ob_qu = instance_create_depth(_gw/2, _gh/2 + 100, -10002, obj_quit);
	ob_qu.b_room = 0
    with (ob_qu) {
        image_xscale = 350 / sprite_get_width(sprite_index);
        image_yscale = image_xscale;
    }

    saved = true;
}

if (!is_paused && saved){
	instance_destroy(ob_mu)
    instance_destroy(ob_res)
    instance_destroy(ob_qu)
	instance_destroy(ob_panel)
    
    instance_activate_all()
	/*if(global.boss==1){
		instance_deactivate_object(instance_find(obj_boss2, 0))
	} else {
		instance_deactivate_object(instance_find(obj_boss, 0))
	}
    if (surface_exists(pause_surf)) surface_free(pause_surf)*/
}
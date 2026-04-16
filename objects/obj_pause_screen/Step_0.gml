if (is_paused && !saved) {
    pause_surf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface))
    surface_copy(pause_surf, 0, 0, application_surface)
    
    instance_deactivate_all(true)
	instance_activate_object(obj_permanent)

	var _gw = display_get_gui_width()
	var _gh = display_get_gui_height()
	
	ob_panel = instance_create_depth(_gw/2, _gh/2, -10001, obj_paused_panel)
	with (ob_panel) {
		var _orig_w = sprite_get_width(sprite_index);
        image_xscale = 1500 / _orig_w;
        image_yscale = image_xscale;
    }
	
	ob_mu = instance_create_depth(_gw - 100, 15, -10002, obj_mute)
	ob_mu.pause = true
	instance_activate_object(ob_mu)

	with (ob_mu) {
	    var _orig_w = sprite_get_width(sprite_index)
	    image_xscale = 90 / _orig_w
	    image_yscale = image_xscale
	}
    
    ob_res = instance_create_depth(_gw/2, _gh/2 - 40, -10002, obj_resume)
	ob_res.pause = true
	instance_activate_object(ob_res)
	with (ob_res) {
		var _orig_w = sprite_get_width(sprite_index)
        image_xscale = 250 / _orig_w;
        image_yscale = image_xscale-0.1;
    }
    ob_qu = instance_create_depth(_gw/2, _gh/2 + 100, -10002, obj_quit)
	ob_qu.pause = true
	ob_qu.b_room = 1
	instance_activate_object(ob_qu)
	with (ob_qu) {
		var _orig_w = sprite_get_width(sprite_index)
        image_xscale = 250 / _orig_w;
        image_yscale = image_xscale-0.18;
    }
	saved = !saved
    
} 
if (!is_paused && saved){
	instance_destroy(ob_mu)
    instance_destroy(ob_res)
    instance_destroy(ob_qu)
	instance_destroy(ob_panel)
    
    instance_activate_all()
	if(global.boss==1){
		instance_deactivate_object(instance_find(obj_boss2, 0))
	} else {
		instance_deactivate_object(instance_find(obj_boss, 0))
	}
    if (surface_exists(pause_surf)) surface_free(pause_surf)
}
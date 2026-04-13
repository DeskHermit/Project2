var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var w = camera_get_view_width(cam);
var h = camera_get_view_height(cam);

if (!surface_exists(light_surface) 
    || surface_get_width(light_surface) != w 
    || surface_get_height(light_surface) != h) 
{
    if (surface_exists(light_surface)) surface_free(light_surface);
    light_surface = surface_create(w, h);
}
surface_set_target(light_surface);

// Darkness
draw_clear_alpha(c_black, 0.85);
gpu_set_blendmode(bm_subtract);
var p = instance_find(obj_wizard, 0);

if (p != noone) {
    var px = p.x - cam_x;
    var py = p.y - cam_y;

    // Flashlight
    if (p.flashlight_on) {

        var dir = p.target_angle;

        var length = max(w, h);
		var spread = 45;

		var x1 = px;
		var y1 = py;

		var x2 = px + length * lengthdir_x(1, dir - spread);
		var y2 = py + length * lengthdir_y(1, dir - spread);

		var x3 = px + length * lengthdir_x(1, dir + spread);
		var y3 = py + length * lengthdir_y(1, dir + spread);

		draw_primitive_begin(pr_trianglefan);
		draw_vertex_color(x1, y1, c_white, 1.0);
		draw_vertex_color(x2, y2, c_white, 0.0);
		draw_vertex_color(x3, y3, c_white, 0.0);
		draw_primitive_end();
    }

    // Player Glow
    draw_circle_color(px, py, 60, c_white, c_white, false);
}

/* Post Lights
with (obj_post) {
    var px = x - cam_x;
    var py = y - cam_y;

    draw_ellipse_color(px - 80, py - 50, px + 80, py + 50,
        c_white, c_white, false);
}
*/
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(light_surface, cam_x, cam_y);
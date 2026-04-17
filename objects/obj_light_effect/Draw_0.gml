// 1. Get Camera Position to keep it locked to the world
var _cam = view_camera[0];
var _cx  = floor(camera_get_view_x(_cam));
var _cy  = floor(camera_get_view_y(_cam));

// 2. Local screen coordinates
var px = x - _cx;
var py = y - _cy;

// 3. Draw the Ellipse
gpu_set_blendmode(bm_add);

// Uses the object's own x, y, and image_angle
draw_ellipse_simple(px, py, 80 * image_xscale, 50 * image_yscale, image_angle, c_white);

gpu_set_blendmode(bm_normal);
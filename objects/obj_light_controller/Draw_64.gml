var p = instance_find(obj_wizard, 0);

if (p != noone) {
    var bw = 200;
    var bh = 20;
    var bx = 20;
    var by = 20;

    var percent = p.battery / 100;

    draw_set_color(c_dkgray);
    draw_rectangle(bx, by, bx + bw, by + bh, false);

    draw_set_color(c_lime);
    draw_rectangle(bx, by, bx + bw * percent, by + bh, false);

    draw_set_color(c_white);
    draw_text(bx, by - 18, "Battery");
}
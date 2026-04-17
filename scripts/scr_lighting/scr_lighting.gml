function draw_ellipse_simple(_x, _y, _width, _height, _angle, _color) {
    var _steps = 32;
    draw_primitive_begin(pr_trianglefan);
    
    // The center of the ellipse
    draw_vertex_color(_x, _y, _color, 0.4); 
    
    for (var i = 0; i <= _steps; i++) {
        var _step_angle = i * (360 / _steps);
        
        // Calculate the raw ellipse points
        var _lx = lengthdir_x(_width, _step_angle);
        var _ly = lengthdir_y(_height, _step_angle);
        
        // Rotate the points around the center using the object's angle
        var _rx = _lx * dcos(_angle) + _ly * dsin(_angle);
        var _ry = -_lx * dsin(_angle) + _ly * dcos(_angle);
        
        draw_vertex_color(_x + _rx, _y + _ry, c_black, 0);
    }
    draw_primitive_end();
}
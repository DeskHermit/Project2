// Use this script to chnage rooms

function scr_fade(_room, _speed = 0.03){
    if (!instance_exists(obj_transition)) {
       var o_fade = instance_create_depth(0,0,-10000,obj_transition)
	   o_fade._room = _room
	   o_fade._speed = _speed
	   if (_room == -2 || _room == -3){
			o_fade._speed = 0
			o_fade.alpha = 0
	   }
    }
}
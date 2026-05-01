if (array_contains([rm_floor1, rm_floor2, rm_floor3], room)) {
	if (room != _room) {
		instance_destroy();
	}
}

step_timer = 1
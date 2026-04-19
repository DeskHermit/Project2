if(!array_contains(table_rooms,room))
	global.last_room = room
if (!array_contains(no_rooms,room) && !array_contains(table_rooms,room)) {
	wiz_x = _wiz.x
	wiz_y = _wiz.y
}
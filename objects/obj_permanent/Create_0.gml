global.debug = true;

_wiz = instance_find(obj_wizard,0)
if (instance_exists(_wiz)){
	wiz_x=_wiz.x
	wiz_y=_wiz.y
} else {
	wiz_x=1632
	wiz_y=832
}
maxInvSlots = 5

global.first_time = true
_tutorial = true

no_rooms = [
    rm_end_negative_screen,
    rm_end_positive_screen,
    rm_door_break,
    rm_title_screen,
	rm_notes
]

table_rooms = [
    rm_outside_table
]

global.store_id = "outsidetable2"

global.reset_to_start = true
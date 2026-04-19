global.inventory = { 
    items: array_create(5, noone),
    torch: false,
    staff: false
};

global.last_room = -1

_wiz = instance_find(obj_wizard,0)
maxInvSlots = 5

global.first_time = true
_tutorial = true

global.storage = {
    "outsidetable1": [obj_battery_3D,obj_flashlight_3D],
    "outsidetable2" : [obj_battery_3D,obj_notes_3D,obj_hammer_3D],
}

no_rooms = [
    rm_end_negative_screen,
    rm_end_positive_screen,
    rm_door_break,
    rm_title_screen
]

table_rooms = [
    rm_outside_table
]

wiz_x=_wiz.x
wiz_y=_wiz.y

global.store_id = "outsidetable2"

global.reset_to_start = true

global.heading = "Instructions"
global.content = ["Press wsad or arrow keys to control the character","Press F to toggle flashlight after obtaining flashlight"]
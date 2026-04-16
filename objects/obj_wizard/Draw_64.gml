#region INVENTORY DRAW

var slot_w = sprite_get_width(spr_inventorybox);
var slot_h = sprite_get_height(spr_inventorybox);

var spacing = 8;
var total_w = (slot_w * maxInvSlots) + (spacing * (maxInvSlots - 1));


var startInvX = (display_get_gui_width() - total_w) / 2;
var startInvY = display_get_gui_height() - slot_h - 10;


for (var inv = 0; inv < maxInvSlots; inv++) {

    var itemX = startInvX + (inv * (slot_w + spacing));
    var itemY = startInvY;

 
    draw_sprite(spr_inventorybox, 0, itemX, itemY);


    var item = global.inventory.items[inv];

 
    if (item != noone) {
        
        var spr = object_get_sprite(item);
		
		var box_w = slot_w;
        var box_h = slot_h;
		
		var spr_w = sprite_get_width(spr);
        var spr_h = sprite_get_height(spr);
		
		var scale = min(box_w / spr_w, box_h / spr_h) * 0.8;

 
        
        var drawX = itemX + (slot_w / 2);
        var drawY = itemY + (slot_h / 2);

       draw_sprite_ext(spr, 0, drawX, drawY, scale, scale, 0, c_white, 1);
	   
    }
}

#endregion
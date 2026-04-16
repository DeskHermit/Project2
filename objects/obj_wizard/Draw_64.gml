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
        
        var spr = item.sprite_index;

 
        var drawX = itemX + (slot_w / 2) - (sprite_get_width(spr) / 2);
        var drawY = itemY + (slot_h / 2) - (sprite_get_height(spr) / 2);

        draw_sprite(spr, 0, drawX, drawY);
    }
}

#endregion
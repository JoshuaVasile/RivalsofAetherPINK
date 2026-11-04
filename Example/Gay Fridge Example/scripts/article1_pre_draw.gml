//Cold aura
//if (get_player_color(player) != 17){
    switch(state)
    {
        case 0:
            draw_sprite_ext(sprite_get("coldAura"), state_timer/2, x, y-40, 1, 1, 0, c_white, 1);
            break;
        case 1:
            draw_sprite_ext(sprite_get("coldAura"), 6+state_timer/3, x, y-40, 1, 1, 0, c_white, 1);
            break;
        case 2:
            draw_sprite_ext(sprite_get("coldAura"), 22+state_timer/3, x, y-40, 1, 1, 0, c_white, 1);
            break;
    
    }
/*}
//DEV DERBY SKIN
else {
    switch(state)
    {
        case 0:
            draw_sprite_ext(sprite_get("hotAura"), state_timer/3, x, y-40, 1, 1, 0, c_white, 1);
            break;
        case 1:
            draw_sprite_ext(sprite_get("hotAura"), 6+state_timer/3, x, y-40, 1, 1, 0, c_white, 1);
            break;
        case 2:
            draw_sprite_ext(sprite_get("hotAura"), 22+state_timer/3, x, y-40, 1, 1, 0, c_white, 1);
            break;
    
    }
}*/

if (state == 2 && has_rune("M")) {
	var threadlength = point_distance(x, y, player_id.x, player_id.y);

	draw_sprite_ext( sprite_get("RuneLaser"), state_timer/2, x, y - 32, -(threadlength), 0.5, 
		point_direction(x, y - 32, player_id.x, player_id.y - 32), c_white, 1 );
}
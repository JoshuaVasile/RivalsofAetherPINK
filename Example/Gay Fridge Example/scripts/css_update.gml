

if get_synced_var(player) > 1 {
	set_synced_var( player, 0)
}

cursor_x = get_instance_x(cursor_id);
cursor_y = get_instance_y(cursor_id);

if (cursor_x > voice_button_pos[0] && cursor_x < voice_button_pos[2] && cursor_y > voice_button_pos[1] && cursor_y < voice_button_pos[3] && !instance_exists(oTestPlayer))
{
	suppress_cursor = true;
   if (menu_a_pressed){
       voice_button_index++;
       sound_play(asset_get("mfx_option"));
       switch(alt_modifier){
       	case 0:
           alt_modifier = 1;
           //sound_stop(sound_get("gf-galaxy"));
           //sound_play(asset_get("mfx_unstar"), false, noone, 1);
           break;
           case 1:
           alt_modifier = 0;
           //sound_stop(asset_get("mfx_unstar"));
           //sound_play(sound_get("gf-galaxy"), false, noone, 0.7);
           break;
       }
   }
   voice_button_index = alt_button_index_draw;
   voice_button_index++;
}else {
    suppress_cursor = false;
    voice_button_index = alt_button_index_draw;
}
if("alt_modifier" in self) set_synced_var(player, alt_modifier)
alt_button_index_draw = alt_modifier*3;
//print(get_synced_var(player))

//user_event(1)
init_shader()
//CommandGrabs
if (my_hitboxID.attack == AT_FSPECIAL && my_hitboxID.hbox_num == 1) {
	if ((state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR)
	  && (hit_player_obj.state == PS_HITSTUN || hit_player_obj.state == PS_HITSTUN_LAND)
    	  && was_parried == false
	  && hit_player_obj.clone == false) {
		//transition to the 'throw' part of the attack.
		destroy_hitboxes();
		attack_end();

		hit_player_obj.x = lerp(hit_player_obj.x,x+(16*spr_dir),1)
		hit_player_obj.y = lerp(hit_player_obj.y,y+8,1)
        set_window_value(AT_FSPECIAL, 3, AG_WINDOW_GOTO, 4);
        set_window_value(AT_FSPECIAL, 6, AG_WINDOW_TYPE, 1);

		//if this attack hasn't grabbed a player yet, grab the player we just hit.
		if (!instance_exists(grabbed_player_obj)) 
            grabbed_player_obj = hit_player_obj; 
		
		//if this attack has already grabbed a different opponent, prioritize grabbing the closest opponent.
		else {
			var old_grab_distance = point_distance(x, y, grabbed_player_obj.x, grabbed_player_obj.y);
			var new_grab_distance = point_distance(x, y, hit_player_obj.x, hit_player_obj.y);
			if (new_grab_distance < old_grab_distance) { grabbed_player_obj = hit_player_obj; }
		}
	}
}

if (my_hitboxID.attack == AT_DTILT && my_hitboxID.hbox_num < 4){
	hit_player_obj.x = lerp(hit_player_obj.x,x+(48*spr_dir),0.2)
}

//RUNE STUFF: On K Rune, if Gay Fridge is in their DSpecial field, all of their melee attacks have 75% extra hitstun
if (has_rune("K") && isCool && my_hitboxID.attack != AT_NSPECIAL){
	hit_player_obj.hitstop = hitstop*1.75;
	spawn_hit_fx(hit_player_obj.x, hit_player_obj.y-hit_player_obj.char_height/2, 111);
	sound_play(asset_get("sfx_abyss_hex_hit"));
}

if (get_player_color(player) == 26){
    
    if (get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_HIT_SFX) == 643 || get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_HIT_SFX) == 644)
        sound_play(sound_get("hit2"), false, noone, 1, 1);
    if (get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_HIT_SFX) == 647 || get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_HIT_SFX) == 648)
        sound_play(sound_get("hit2"), false, noone, 1, 1);
    if (get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_HIT_SFX) == 654 || get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_HIT_SFX) == 649)
        sound_play(sound_get("slam2"), false, noone, 1, 1);
    if (get_hitbox_value(my_hitboxID.attack, my_hitboxID.hbox_num, HG_HIT_SFX) == 655)
    	sound_play(sound_get("bigpunch"), false, noone, 1, 1);
}

if (my_hitboxID.attack == AT_DSPECIAL && my_hitboxID.hbox_num == 3)
	has_hit = true;

if (my_hitboxID.attack == AT_NSPECIAL && my_hitboxID.hbox_num == 10)
	sound_play(asset_get("sfx_oly_flashstun"), false, noone, 0.8, 1);
	
if (my_hitboxID.attack == AT_NSPECIAL && my_hitboxID.hbox_num == 13 && !hit_player_obj.soft_armor && !hit_player_obj.super_armor){
	if (!hit_player_obj.nspecial) {
    	hit_player_obj.nspecial = true;
    	hit_player_obj.starfruitId = id;
    }
}

if (my_hitboxID.attack == AT_NSPECIAL && my_hitboxID.hbox_num == 12){
	sound_play(sound_get("gf-splat"));
}

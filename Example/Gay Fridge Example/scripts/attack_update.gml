//FSpecial can be jump-cancelled before the dash, which also restores your dash ability
//You can perform a semi-frame perfect GLJ (Gayest Long Jump) by jumping on the lastest frames possible

if (attack == AT_NSPECIAL || attack == AT_DSPECIAL){
    trigger_wavebounce();
}

nspecialCycle = clamp(nspecCycle,1,get_num_hitboxes(AT_NSPECIAL)+1);
if (attack == AT_NSPECIAL){
	can_fast_fall = false;
	if (window == 1 && window_timer == 1){
		chili = noone;
		nspecLoops = 0;
		nspecFiring = false;
		if (firstUse){
			nspecCycle = 1+random_func(1,get_num_hitboxes(AT_NSPECIAL),true);
		}
		if (gf_Cycle != 0){
			nspecCycle = gf_Cycle;
		}
		else {
			nspecCycle = 1+random_func(1,get_num_hitboxes(AT_NSPECIAL),true);
		}
		if (isCool || (has_rune("L") && hasFlag))
			nspecLoops = 5;
	}
	if (window == 2 && window_timer == get_window_value(AT_NSPECIAL, 2, AG_WINDOW_LENGTH)-1)
	{
		for(i = 0; i < get_num_hitboxes(AT_NSPECIAL)+1; i++)
			set_hitbox_value(AT_NSPECIAL, i, HG_WINDOW, 5);
		print_debug(string(nspecCycle));
		if(nspecCycle != 2)
			set_hitbox_value(AT_NSPECIAL, nspecCycle, HG_WINDOW, 3);
	}
	
	if (window == 2 && special_down && !nspecFiring && nspecLoops < 145 && has_rune("N")){
		if (isCool)
		nspecLoops += 2;
		else
		nspecLoops++;
		window_timer = 0;
		vsp = vsp*0.75;
		
		if (nspecLoops % (5 - (2*isCool)) == 1){
			var randomX = random_func(1, 64, true);
			var randomY = random_func(2, 64, true);
			sound_play(sound_get("gf-eat"), false, noone, 1, 1 + (nspecLoops/100));
			spawn_hit_fx(x-32 + randomX, y-64 + randomY, rainSmall);
			
		}
	}
	if (window == 2 && window_timer == get_window_value(AT_NSPECIAL, 2, AG_WINDOW_LENGTH)){
		spawn_hit_fx(x+(spr_dir*24), y-16, 254);
		if (nspecCycle == 11){
			sound_play(sound_get("burp"));
			chili = spawn_hit_fx(x + 40*spr_dir, y-22, chiliPepper);
			chili.depth = -6;
		}
	}
	
	if(window == 3 && window_timer == 1)
	{
		nspecUsed = true;
		nspecFiring = true;
		if(nspecCycle == 2)
		{
			for(j = 0; j < 6; j++)
			{
				grape = create_hitbox( AT_NSPECIAL, 2, x+20*spr_dir, y-22);
				grape.vsp = -3-random_func(j,5,false);
				grape.hsp = (3+random_func_2(j,5,false))*spr_dir;
			}
			//if (get_player_color(player) == 17)
				//sound_play(sound_get("gf-BCA"));
		}
		if (gf_Cycle == 0)
			nspecCycle = 1+random_func(1,get_num_hitboxes(AT_NSPECIAL),true);
		else
			nspecCycle = gf_Cycle;
		firstUse = false;
		
	}
	if (nspecLoops >= 5 && window == 3 && window_timer == 4){
		window = 2;
		window_timer = get_window_value(AT_NSPECIAL, 2, AG_WINDOW_LENGTH)-(7 - 5*has_rune("N"));
		nspecLoops -= 5;
	}
	if (!has_rune("D"))
		move_cooldown[AT_NSPECIAL] = 60;
}

if(attack == AT_FSPECIAL){
    can_fast_fall = false;
    fspecUsed = true;
	if((has_hit && window < 5) || (!has_hit && window == 2)){
		can_move = false;
	}
	else
		can_move = true;
	if(window == 1){
		if(left_down)
			spr_dir = -1;
		if(right_down)
			spr_dir = 1;
	}
	if(window == 1){
	    if (window_timer == 1)
	    	sound_play(asset_get("sfx_spin"));
	    fire_ang = 90;
	}
	if (has_hit && has_rune("I") && window == 4){
            
            if (!joy_pad_idle) 
                fire_ang = joy_dir;
            set_window_value(AT_FSPECIAL, 4, AG_WINDOW_HSPEED, abs(0.1 * cos(degtorad(fire_ang))));
            set_window_value(AT_FSPECIAL, 4, AG_WINDOW_VSPEED, -0.1 * sin(degtorad(fire_ang)));
            set_window_value(AT_FSPECIAL, 5, AG_WINDOW_HSPEED, abs(2 * cos(degtorad(fire_ang))));
            set_window_value(AT_FSPECIAL, 5, AG_WINDOW_VSPEED, -2 * sin(degtorad(fire_ang)));
	}
	
	if (window == 4){
		if(left_down || joy_dir > 90 && joy_dir < 270)
            spr_dir = -1;
        else if(right_down || joy_dir > 0 && joy_dir < 90 || joy_dir > 270 && joy_dir < 360)
            spr_dir = 1;
	}

	if (window == 1 && window_timer == get_window_value(AT_FSPECIAL, 1, AG_WINDOW_LENGTH)){
		if (get_player_color(player) == 26)
			sound_play(sound_get("wheesh"));
		else
			sound_play(asset_get("sfx_coin_capture"), false, noone, 0.75, 1.25);
	}
	
	if ((window == 2 || window == 3) && get_gameplay_time()%2 == 0)
		CreateAfterimage();
	if (window == 3 && !has_hit && !was_parried){
		if (left_down && spr_dir == 1)
			hsp -= 0.3;
		if (right_down && spr_dir == -1)
			hsp += 0.3;
	}
	//Gay Fridge regains FSpecial in midair if they hit the opponent (Also gains soft armor to prevent the grab from breaking)
	if(has_hit){
		fspecUsed = false;
		soft_armor = 999;
		set_window_value(AT_FSPECIAL, 2, AG_WINDOW_CUSTOM_AIR_FRICTION, 1.2);
		set_window_value(AT_FSPECIAL, 3, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.4);
	}
	else{
		set_window_value(AT_FSPECIAL, 2, AG_WINDOW_CUSTOM_AIR_FRICTION, 1);
		set_window_value(AT_FSPECIAL, 3, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.25);
	}
	
	if (window == 4 && window_timer == 1 && !hitpause)
		sound_play(asset_get("sfx_frog_dspecial_swallow"));
	
	//Command Grab code
	if (state_timer == 1) { 
    	grabbed_player_obj = noone; 
    	grabbed_player_relative_x = 0;
    	grabbed_player_relative_y = 0;
        reset_window_value(AT_FSPECIAL, 3, AG_WINDOW_GOTO);
        reset_window_value(AT_FSPECIAL, 6, AG_WINDOW_TYPE);
    }
    //Grabbed part
    if(instance_exists(grabbed_player_obj))
    {
        if (window >= 5) { grabbed_player_obj = noone; }
        else if (grabbed_player_obj.state != PS_HITSTUN && grabbed_player_obj.state != PS_HITSTUN_LAND) { grabbed_player_obj = noone; }
        else 
        {
            //keep the grabbed player in hitstop until the grab is complete.
            with(grabbed_player_obj)
            {
                hitstop = 4;
                hitpause = true;
            }
            //if this is the first frame of a window, store the grabbed player's relative position.
            if (window_timer <= 1) {
                grabbed_player_relative_x = grabbed_player_obj.x - x;
                grabbed_player_relative_y = grabbed_player_obj.y - y;
            }
            if(window <= 4)
            {
                var pull_to_x = 16*spr_dir;
                var pull_to_y = 4;
            }
            if (window == 4 && window_timer < 15)
                grabbed_player_obj.visible = false;
            else
            	grabbed_player_obj.visible = true;
            //using an easing function, smoothly pull the opponent into the grab over the duration of this window.
            var window_length = get_window_value(attack, window, AG_WINDOW_LENGTH);
            if (window < 4){
            	grabbed_player_obj.x = x + ease_expoOut( floor(grabbed_player_relative_x), floor(pull_to_x), window_timer, window_length);
            	grabbed_player_obj.y = y + ease_expoOut( floor(grabbed_player_relative_y), floor(pull_to_y), window_timer, window_length);
            }
            else{
            	grabbed_player_obj.x = x + pull_to_x;
            	grabbed_player_obj.y = y + pull_to_y;
            }
        }
    }
}

if(attack == AT_USPECIAL){
	can_wall_jump = true;
	uspecUsed = true;
	
	if (window == 1 && window_timer == 1){
		if (get_player_color(player) == 26)
			sound_play(sound_get("wheesh"));
		else
			sound_play(asset_get("sfx_ori_bash_use"));
		
		if (isCool || (has_rune("L") && hasFlag))
			uspecCool = true;
		else
			uspecCool = false;
			
		if (uspecStored){
			window = 2;
			window_timer = 0;
			if (!hitpause){
				if (get_player_color(player) != 26)
					sound_play(sound_get("gf-uspecial"));
				else
					sound_play(sound_get("bigboing"));
				spawn_hit_fx(x, y, rainBig);
			}
			uspecStored = false;
			hsp = 0;
			
			if (has_rune("J"))
				vsp = -22;
			else
				vsp = -16;
		}
	}
	
	if (window < 5)
		can_fast_fall = false;
	else
		can_fast_fall = true;
	
	if (window == 1)
		can_move = false;
	else
		can_move = true;
		
	if ((window != 1 && window != 4) && get_gameplay_time()%2 == 0)
		CreateAfterimage();	
	
	if(window == 1 && !special_down && window_timer < get_window_value(AT_USPECIAL, 1, AG_WINDOW_LENGTH)-1 && window_timer >= 2){
		window = 4;
		vsp = -6;
		hsp = 0;
		//set_window_value(AT_USPECIAL, 6, AG_WINDOW_TYPE, 1);
		set_window_value(AT_USPECIAL, 5, AG_WINDOW_VSPEED, -(1 + has_rune("J") + isCool/2)*(5+(window_timer/10)));
		window_timer = 0;
	}
	if (window == 1 && window_timer == get_window_value(AT_USPECIAL, 1, AG_WINDOW_LENGTH)){
		if (get_player_color(player) != 26)
			sound_play(sound_get("gf-uspecial"));
		else
			sound_play(sound_get("bigboing"));
		spawn_hit_fx(x, y, rainBig);
	}
		
	if (has_rune("G") && shield_pressed && window == 1 && window_timer >= 15 && window_timer < get_window_value(AT_USPECIAL, 1, AG_WINDOW_LENGTH)-1 && window_timer >= 2){
		uspecStored = true;
		can_shield = true;
		sound_play(asset_get("sfx_zetter_shine"));
		spawn_hit_fx(x+20*spr_dir, y-56, rainSmall);
	}
	
	/*else{
		/*if(window == 1 && !special_down && window_timer < 14){
			window = 4;
			vsp = -6;
			hsp = 0;
			//set_window_value(AT_USPECIAL, 6, AG_WINDOW_TYPE, 1);
			set_window_value(AT_USPECIAL, 5, AG_WINDOW_VSPEED, -(1 + has_rune("J")/2)*(8+(window_timer/10)));
			window_timer = 0;
		}
		if(window == 1){
			//set_window_value(AT_USPECIAL, 6, AG_WINDOW_TYPE, 7);
			if (window_timer == 15){
				spawn_hit_fx(x, y, rainBig);
				if (get_player_color(player) != 19)
					sound_play(sound_get("gf-uspecial"));
				else
					sound_play(sound_get("bigboing"));
			}
		}
		
		if (has_rune("G") && shield_pressed && window == 1 && window_timer >= 10 && window_timer < 14){
			uspecStored = true;
			can_shield = true;
		}
	}*/
	if (window == 2 && window_timer == 1 && !hitpause && !up_down){
		if (left_down)
			hsp = -3;
		if (right_down)	
			hsp = 3;
	}
	
	if (window == 4 && window_timer == 1){
		sound_stop(asset_get("sfx_ori_bash_use"));
		sound_play(asset_get("sfx_ell_steam_hit"), false, noone, 0.5, 1);
	}	
	if (window >= 5 && window < 6){
		air_accel = .5;
		air_max_speed = 7;
		if (window == 5 && window_timer <= 2){
			if (left_down)
				hsp = -7 * abs(cos(degtorad(joy_dir)));
			if (right_down)
				hsp = 7 * abs(cos(degtorad(joy_dir)));
		}
		
	}
	if(window == 5 && window_timer == 1){
		spawn_hit_fx(x, y, rainSmall);
	}
	if (window = 6){
		air_accel = .2;
		air_max_speed = 4;
	}
	if (has_rune("J"))
		set_window_value(AT_USPECIAL, 2, AG_WINDOW_VSPEED, -22);
}

//This is a current quick fix to test changes between normal and cool states
if (attack == AT_DSPECIAL) {
	can_fast_fall = false;
	fast_falling = false;
	
	if (has_rune("H")){
		set_hitbox_value(AT_DSPECIAL, 1, HG_WINDOW, 1);
		set_hitbox_value(AT_DSPECIAL, 2, HG_WINDOW, 3);
	}
	
	if (vsp > 12)
		vsp = 12;
	if(window == 1 && !hasFlag)
	{ if(state_timer == 1) {window = 2; window_timer = 5;} }
	if (window == 1 && window_timer == 12){
		instance_create(x+28*spr_dir,y,"obj_article1")
	}
	if (has_hit && has_rune("H")){
		window = 1;
		window_timer = 11;
		has_hit = false;
	}
	if ((window == 1 || window == 3)&& window_timer == 1 && has_rune("H")){
		sound_play(asset_get("sfx_icehit_weak1"));
		spawn_hit_fx(x, y-32, 199);
	}
	if (window == 2 && has_rune("H"))
		can_jump = true;
}

//Jab cancels really early into tilts and itself on hit
if(attack == AT_JAB && has_hit && window == 3 && !was_parried && attack_pressed){
	can_attack = true;
}
if(attack == 39 && has_hit && window == 3 && !was_parried && has_rune("A")){
	iasa_script();
}

if (attack == AT_FTILT && window == 1 && window_timer == 1){
	sound_play(asset_get("sfx_waveland_kra"), false, noone, 0.75, 0.8);
}

if (attack == AT_UTILT && window <= 2)
	hud_offset = 48;

if (attack == AT_DTILT && window == 1 && window_timer == 1){
	sound_play(asset_get("sfx_ice_ftilt"));
}

//Dash Attack has a spike that hits aerial opponents, but it can't be activated if you land the initial dash hit
if(attack == AT_DATTACK && window == 1){
	if (isCool)
		set_window_value(AT_DATTACK, 1, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.1);
	else
		set_window_value(AT_DATTACK, 1, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.4);
}

//Strongs have their slide-y properties while Gay Fridge is holding the flag with rune L
if (has_rune("L") && (attack == AT_FSTRONG || attack == AT_USTRONG || attack == AT_DSTRONG)){
	for(i = 0; i < get_attack_value(attack, AG_NUM_WINDOWS) i++)
	if (hasFlag){
		
		set_window_value(attack, i, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
		set_window_value(attack, i, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.1);
	}
	else
		set_window_value(attack, i, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
}

if(attack == 42 || attack == AT_FAIR || attack == AT_DAIR || attack == 43 || attack == 41){
	if (get_gameplay_time() % 2 == 0)
		CreateAfterimage();
}

if (attack == 41 && window == 1 && window_timer == get_window_value(41, 1, AG_WINDOW_LENGTH) - 1)
	sound_play(asset_get("sfx_ell_arc_taunt_end"));

//if (attack == 42 && window == 2 && !down_down){
	//vsp = clamp(vsp, -999, 3);
//}

//Stuff to make DAir cancellable after ~30 frames
if(attack == AT_DAIR){
	can_fast_fall = false;
	
	if(window == 2){
		if (window_timer == 6){
			dairCycle += 1;
			max_fall = 20;
		}

		if (dairCycle >= 3){
			can_jump = true;
			can_shield = true;
			can_special = true;
    		move_cooldown[AT_FSPECIAL] = 2;
			move_cooldown[AT_DSPECIAL] = 2;
    		move_cooldown[AT_NSPECIAL] = 2;
		}
	}
	
	if(window == 3 && window_timer == 0){
		destroy_hitboxes();
		dairCycle = 0;
		//set_num_hitboxes(AT_DAIR, 3);
		max_fall = 12;
		shake_camera(1,6);
	}
}

//UAir shifts the player's location to where the player ends up after the upwards swing
if(attack == AT_UAIR || attack == 43){
	//can_fast_fall = false;
	
	if(window == 1 && window_timer == get_window_value(attack, 1, AG_WINDOW_LENGTH) && free){
		y -= 68;
		if (attack == 43)
			sound_play(asset_get("sfx_coin_capture"), false, noone, 0.75, 1.25);
	}
}

if (attack == AT_TAUNT){
	
	if (spr_dir)
		set_attack_value(AT_TAUNT, AG_SPRITE, sprite_get("taunt"));
	else
		set_attack_value(AT_TAUNT, AG_SPRITE, sprite_get("taunt-left"));
	
	if (taunt_down && window == 2 && window_timer == 23){
		window_timer = 22;
	}
}

//Special move buffs when Gay Fridge is in the cold aura
if (attack == AT_NSPECIAL || attack == AT_FSPECIAL || attack == AT_USPECIAL){
	if ((isCool || (has_rune("L") && hasFlag)) && window == 1 && window_timer == 1){
		set_window_value(AT_USPECIAL, 1, AG_WINDOW_LENGTH, 20);
		
		if (has_rune("J"))
			set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HSPEED, 24);
		else
			set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HSPEED, 20);
		
		sound_play(asset_get("sfx_frog_fspecial_charge_gained_1"));
		
		//HEATWAVE SKIN
		//if (get_player_color(player) == 17)
			//spawn_hit_fx(x, y-32, 204);
		//else
			spawn_hit_fx(x, y-32, 199);
	}
	if (!isCool && (!has_rune("L") || (has_rune("L") && !hasFlag)) && window == 1 && window_timer == 1){
		//set_window_value(AT_FSPECIAL, 4, AG_WINDOW_LENGTH, 16);
		set_window_value(AT_USPECIAL, 1, AG_WINDOW_LENGTH, 40);
		
		if (has_rune("J"))
			set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HSPEED, 20);
		else
			set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HSPEED, 16);
	}
}

if (has_rune("I")){
	set_attack_value(AT_FSPECIAL, AG_AIR_SPRITE, sprite_get("fspecial-Rune"));
	set_hitbox_value(AT_FSPECIAL, 2, HG_ANGLE_FLIPPER, 10);
	set_window_value(AT_FSPECIAL, 4, AG_WINDOW_CUSTOM_GRAVITY, 0);
	set_window_value(AT_FSPECIAL, 4, AG_WINDOW_HSPEED_TYPE, 1);
    set_window_value(AT_FSPECIAL, 4, AG_WINDOW_VSPEED_TYPE, 1);
}

if (has_rune("M")){
	set_window_value(AT_DSPECIAL, 3, AG_WINDOW_HSPEED_TYPE, 1);
	set_window_value(AT_DSPECIAL, 3, AG_WINDOW_VSPEED_TYPE, 1);
}

if (get_player_color(player) == 26){
	set_window_value(AT_DTILT, 1, AG_WINDOW_SFX, sound_get("freeze"));
	set_hitbox_value(AT_FSPECIAL, 1, HG_HIT_SFX, sound_get("zap"));
	set_window_value(AT_USPECIAL, 4, AG_WINDOW_SFX, sound_get("boing"));
	
}

//FINAL SMASH STUFF
if (attack == 49){
	can_move = false;
	can_fast_fall = false;
	if (window == 1 && window_timer < 80)
	{
		//Freeze everyone
		with(oPlayer)
		{
			if(id != other.id)
			{
				if(!hitpause && state_cat != SC_HITSTUN)
				{
					old_hsp = hsp;
					old_vsp = vsp;
				}
				hitpause = true;
				hitstop = 2;
			}
		}
	}
}

if(hit_player_obj != -4)
{
    if (hit_player_obj.activated_kill_effect = 1 && hit_player_obj.state_timer = 0){
        sound_play(sound_get("gf-galaxy"));
        galaxyTimer = 0;
        hit_player_obj.state_timer = 1;
    }
}

if (attack == AT_TAUNT_2){
	GenesisMode = true;
}
if (GenesisMode) {
	move_cooldown[AT_TAUNT] = 5;
	move_cooldown[AT_TAUNT_2] = 5;
}

#define CreateAfterimage()
{
    afterimage_array[array_length_1d(afterimage_array)] = {x:x+draw_x, y:y+draw_y, spr_dir:spr_dir, sprite_index:sprite_index, image_index:image_index, rot:spr_angle, col:make_color_hsv(afterimageHue, 150, 255), timer:0, timerMax:12};
}	

#define trigger_wavebounce() 
{
	if ((left_down and state_timer <= 5 and spr_dir == 1) or (right_down and state_timer <= 5 and spr_dir == -1) and (b_reversed == false)) {
    	hsp *= -1;
    	spr_dir *= -1;
    	b_reversed = true;
	} else if (state_timer == 6) {
    	b_reversed = false;
	}
}
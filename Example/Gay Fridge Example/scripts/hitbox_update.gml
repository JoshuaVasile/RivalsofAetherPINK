
if (attack == AT_NSPECIAL){
    if (hbox_num == 1 && get_gameplay_time() % 2 == 0){
        spawn_hit_fx(x-(16*spr_dir), y, rocketTrail);
    }
    
    if (hbox_num == 2 && (!free || position_meeting(x,y+2,asset_get("par_block"))))
    {
        destroyed = true;
        sound_play(asset_get("sfx_waterhit_weak"),false,noone,0.25,1.25);
    }
    
    if (hbox_num == 4){
        if(hitbox_timer > 30)
        {hsp = 0;}
        through_platforms = 999;
        if(!free || position_meeting(x,y+2,asset_get("par_block"))){
            vsp = -4;
            hitbox_timer = 300;
        }
    }
    
    if (hbox_num == 5){
        hsp = clamp(hsp, -7.5, 7.5);
        
        if(hitbox_timer == 50)
            spr_dir = -spr_dir;
        
        if (spr_dir == 1)
            hsp -= 0.1*(hitbox_timer>50?-1:1);
        else
            hsp += 0.1*(hitbox_timer>50?-1:1);
        
        //let it multihit
        if(get_gameplay_time() % 6 == 0)
            create_hitbox(AT_NSPECIAL, 30, x, y);
    }

    //piza man
    if(hbox_num == 30)
    {
        if(was_parried)
        {
            with(pHitBox)
            {
                if(orig_player == other.orig_player && attack == AT_NSPECIAL && (hbox_num == 5 || hbox_num == 9))
                    destroyed = true;
            }
        }
    }

    //Apple
    if(hbox_num == 6)
    {
        if(!free)
        {
            can_hit_self = false;
            for(i = 0; i < 4; i++)
                can_hit[i+1] = false;
            with(oPlayer)
            {
                if(place_meeting(x,y,other) && other.hitbox_timer > 20)
                {
                    set_player_damage(player, clamp(get_player_damage(player)-8,0,999));
                    other.destroyed = true;
                }
            }
        }
        
        if(has_hit)
            destroyed = true;

        if(destroyed){
            sound_play(sound_get("gf-eat"));
        }
    }
    
    //Rotten Apple
    if(hbox_num == 8)
    {
        if(!free && !can_hit_self)
        {
            can_hit_self = true;
            hitstun_factor = -1;
            hitpause = 0;
            hitpause_growth = 0;
            kb_value = 0.01;
            can_tech = 1;
            kb_angle = 90;
            force_flinch = 1;
            /*with(oPlayer)
            {
                if(place_meeting(x,y,other) && other.hitbox_timer > 20)
                {
                    set_player_damage(player, clamp(get_player_damage(player)+4,0,999));
                    other.destroyed = true;
                }
            }*/
        }
        
        if(has_hit)
            destroyed = true;

        if(destroyed){
            sound_play(sound_get("gf-eat"));
        }
    }

    //Banana
    if(hbox_num == 7)
    {
        if(hitbox_timer > 15)
            can_hit_self = true;
        image_xscale = 0.18; image_yscale = 0.1; 
        
    }
    
    //Carrot
    if (hbox_num == 9){
        with(pHitBox)
        {
            if(player_id != other.player_id && hit_priority != 0 && proj_break == 0 && collision_circle(other.x,other.y,30,id,true,false))
                other.destroyed = true;
        }
        if(hitbox_timer % 6 == 1){
            carrot_hit = create_hitbox(AT_NSPECIAL, 30, x, y);
            carrot_hit.hitpause = 2;
            carrot_hit.kb_angle = 30;
        }
    }
    
    //Ice cube
    if (hbox_num == 10 && !free && hitbox_timer % 5 == 1){
        spawn_hit_fx(x + 8*spr_dir, y+8, icePuddle);
    }
    
    //Egg
    if (hbox_num == 12){
        if(!free || position_meeting(x,y+4,asset_get("par_block"))){
            eggSplat = create_hitbox(AT_NSPECIAL, 31, x, y-4);
            sound_play(sound_get("gf-splat"));
            destroyed = true;
        }
    }
    
    //Egg Puddle
    if (hbox_num == 31){
        depth = 1;
        if (hitbox_timer < 18)
            image_index = hitbox_timer/3;
        eggTimer = clamp(eggTimer+1, 0, 20);
        if (collision_rectangle(x-32, y+16, x+32, y-16, asset_get("par_jumpthrough"), false, true) || collision_rectangle(x-32, y+16, x+32, y-16, asset_get("par_block"), false, true)){
            y -= 1;
        }
        with(oPlayer)
        {
            if(id != other.player_id && collision_rectangle(x+56,y-32,x-56, y, other, false, true))
            {
                if (other.eggTimer == 20){
                    set_player_damage(player, clamp(get_player_damage(player)+1,0,999));
                    steam = spawn_hit_fx(x, y - char_height/2, 144);
                    steam.depth = 2;
                    sound_play(asset_get("sfx_ell_steam_hit"), false, noone, 0.75, 1.1);
                    other.eggTimer = 0;
                }
            }
        }
    }
    
    //Starfruit
    if (hbox_num == 13){
        if (get_gameplay_time() % 3 == 0)
            spawn_hit_fx(x + (8-random_func(23, 16, true)), y + (8-random_func(24, 16, true)), starfruitTrail);
        
        with (asset_get( "oPlayer" )) {
    	    if (starfruitId == other.player_id) {
    			x = other.x;
    			y = other.y + char_height/2;
    			hitstop = 4;
                hitpause = true;
    		}
    		
    		if (other.destroyed){
    			hit_player_obj.nspecial = false;
    			hit_player_obj.starfruitId = noone;
    		}
    		with (other) {
    			if (hitbox_timer == 90) {
    				other.nspecial = false;
    				other.starfruitId = noone; 
    			}
    		}
    	}
    	
    	if (hitbox_timer == 89){
    	    create_hitbox(AT_NSPECIAL, 28, x, y);
    	}
    	
    	if (y < 128 && hitbox_timer < 88){
    	    hitbox_timer = 88;
    	}
    	if (destroyed){
    	    spawn_hit_fx(x, y, 305);
    	}
    }
    
    //Donut
    if (hbox_num == 14){
        walls = -1;
        if (cooldown)
        cooldown --;
        switch (donutAngle){
            case 0: //Default
                image_index = (hitbox_timer/2 % 6);
                if (!free){
                    x = ceil(x);
                    y = ceil(y);
                    donutAngle = 1;
                    grav = 0;
                    sound_play(sound_get("donutDrive"));
                    cooldown = 2;
                }
                if (collision_point(x + 16*spr_dir, y, asset_get("par_block"), false, true)){
                    x = ceil(x);
                    y = ceil(y);
                    donutAngle = 4;
                    grav = 0;
                    sound_play(sound_get("donutDrive"));
                    cooldown = 2;
                }
            break;
            case 1: //Forward
                image_index = (hitbox_timer/2 % 6);
                hsp = 8*spr_dir;
                vsp = 0;
                x -= x%8;
                kb_angle = 40;
                if (collision_point(x - 2*spr_dir, y+20, asset_get("par_jumpthrough"), false, true) || collision_point(x - 2*spr_dir, y+20, asset_get("par_block"), false, true) && cooldown == 0){
                    if (old_x - x == 0){
                        donutAngle = 4;
                        vsp = -8;
                        cooldown = 3;
                    }
                }
                else if (cooldown == 0) {
                    donutAngle = 2;
                    vsp = 8;
                    cooldown = 3;
                }
            break;
            case 2: //Down
                image_index = (hitbox_timer/2 % 6) + 6;
                y -= y%8;
                hsp = 0;
                vsp = 8;
                kb_angle = 270;
                if (collision_point(x - 20*spr_dir, y-2, asset_get("par_jumpthrough"), false, true) || collision_point(x - 20*spr_dir, y-2, asset_get("par_block"), false, true) && cooldown == 0){
                    if (old_y - y == 0){
                        donutAngle = 1;
                        hsp = 8;
                        cooldown = 4;
                    }
                }
                else if (cooldown == 0) {
                    donutAngle = 3;
                    hsp = -8;
                    cooldown = 4;
                }
            break;
            case 3: //Backward
                image_index = (hitbox_timer/2 % 6) + 12;
                x -= x%8;
                hsp = -8*spr_dir;
                vsp = 0;
                kb_angle = 140;
                if (collision_point(x - 2*spr_dir, y-20, asset_get("par_jumpthrough"), false, true) || collision_point(x - 2*spr_dir, y-20, asset_get("par_block"), false, true) && cooldown == 0){
                    if (old_x - x == 0){
                        donutAngle = 2;
                        vsp = 8;
                        cooldown = 3;
                    }
                }
                else if (cooldown == 0) {
                    donutAngle = 4;
                    vsp = -8;
                    cooldown = 3;
                }
            break;
            case 4: //Up
                image_index = (hitbox_timer/2 % 6) + 18;
                y -= y%8;
                hsp = 0;
                vsp = -8;
                kb_angle = 90;
                if (collision_point(x + 20*spr_dir, y+2, asset_get("par_jumpthrough"), false, true) || collision_point(x + 20*spr_dir, y+2, asset_get("par_block"), false, true) && cooldown == 0){
                    if (old_y - y == 0){
                        donutAngle = 3;
                        hsp = -8;
                        cooldown = 4;
                    }
                }
                else if (cooldown == 0) {
                    donutAngle = 1;
                    hsp = 8;
                    cooldown = 4;
                }
            break;
        }
    }
    
    //Shrimp
    if (hbox_num == 15){
        hsp -= 0.3*spr_dir;
        
        if (hitbox_timer == length){
            spawn_hit_fx(x, y, 144);
        }
    }
}

if(attack == AT_DSPECIAL)
{
    with(oPlayer)
    {
        if(player == other.player)
        {
            if(collision_circle(other.x, other.y-40, 180, self, true, false))
            {   isCool = true; print_debug("lets go"); }
            else
                isCool = false;

            //make pickupable
            if(!collision_circle(other.x, other.y-40, 30, self, true, false))
                move_cooldown[AT_DSPECIAL] = 2;

            if(attack == AT_DSPECIAL && (state == PS_ATTACK_GROUND ||state == PS_ATTACK_AIR)) 
            { 
                if(state_timer == 1) {window = 3; window_timer = 0;}
                if(window == 3 && window_timer == 2) { other.destroyed = true; dspec_sprite_timer = 65;}
            }
        }
    }
    //if(hitbox_timer < 18)
        //player_id.dspec_sprite_timer = hitbox_timer;
    //else
    //{
        /*if(player_id.dspec_sprite_timer > 64 && !player_id.hasFlag){
            player_id.dspec_sprite_timer = 17;
        }
        if(player_id.hasFlag && player_id.dspec_sprite_timer > 97){
            player_id.dspec_aura_x = -1;
            player_id.dspec_aura_y = -1;
        }
        player_id.dspec_sprite_timer ++;*/
    //}

    //If hit
    // with(asset_get("pHitBox"))
    // {
    //     if(player != other.player && type ! = 2)
    //     {
    //         print_debug("i exist")
    //         player_id.hitstop = hitpause;
    //         sound_play(sound_effect);
    //         other.player_id.dspec_aura_x = -1;
    //         other.player_id.dspec_aura_y = -1;
    //         other.destroyed = true;
    //     }
    // }
}




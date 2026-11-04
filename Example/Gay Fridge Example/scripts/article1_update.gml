depth = 0;
free_timer ++;

if(free && state != 2 && free_timer > 5)
    vsp += .05;
else
    vsp = 0;

if(!free || position_meeting(x,y+4,asset_get("par_block")) || position_meeting(x,y+4,asset_get("par_jumpthrough")))
    free_timer = 0;

player_id.hasFlag = false;

state_timer ++;
image_index = get_gameplay_time() / 6;

//if (get_player_color(player) == 17)
    //sprite_index = sprite_get("grill");

if (state != 2) {
    for (var i = 0; i < instance_number(oPlayer); i++) {
        var p = instance_find(oPlayer, i);
        print_debug(string(p));

            if(collision_circle(p.x+16, p.y-40, 180, self, true, false) && player_id.url == p.url)
            {   p.isCool = true; }
            //else if(!collision_circle(p.x+16, p.y-40, 180, self, true, true))
               // p.isCool = false;
    }
}

switch(state)
{
    case 0: //spawn
        if(state_timer > 11)
        { state ++; state_timer = 0;}
        player_id.move_cooldown[AT_DSPECIAL] = 2;
        break;
    case 1: //idle
        if(state_timer > 47)
        { state_timer = 0;}
        with(oPlayer)
        {
            if(player == other.player)
            {
                //On Death
                if(state == PS_RESPAWN)
                {
                    hasFlag = true;
                    
                    other.state = 2;
                    other.state_timer = 0;
                }

                //make pickupable
                if(!collision_circle(other.x, other.y-40, 30, self, true, false) && !has_rune("M"))
                    move_cooldown[AT_DSPECIAL] = 2;

                if(attack == AT_DSPECIAL && (state == PS_ATTACK_GROUND ||state == PS_ATTACK_AIR)) 
                { 
                    if(state_timer == 1) {window = 3; window_timer = 0;}
                    if(window == 3 && window_timer == 1) { other.state = 2; other.state_timer = 0;}
                }
            }
        }
        
        // destroys articles out of the lower view side:
        if (y > view_get_yview() + view_get_hview() + 100 && state != 2) {
            state = 2;
            state_timer = 0;
        }
        break;
    case 2: //death
        player_id.hasFlag = true;
        with (oPlayer){
            if ("isCool" in self)
                isCool = false;
        }
        
        sprite_index = asset_get("empty_sprite");
        player_id.move_cooldown[AT_DSPECIAL] = 2;
        
        if (state_timer == 1 && has_rune("M")){
            sound_play(sound_get("DS_acebeam"), false, noone, 1, 1.5);
            
            with (player_id){
                var distance = point_distance(x, y, obj_article1.x, obj_article1.y)
        		var steps = distance / 24;
        
        		for (var i = 0; i < steps; i++)
        		{
        			var hb_x = lerp(x, obj_article1.x, i/steps)
        			var hb_y = lerp(y - 32, obj_article1.y - 32, i/steps)
        		   create_hitbox(AT_DSPECIAL, 3, floor(hb_x), floor(hb_y));
        		}
            }
        }
        
        if(state_timer > 11)
        { instance_destroy();}
    break;
}
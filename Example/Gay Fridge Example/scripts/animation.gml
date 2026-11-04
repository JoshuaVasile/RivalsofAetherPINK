//Ground sound effect stuff
if(state == PS_WALK){
	if(state_timer == 0)
	sound_play(sound_get("gf-walk"), false, 0, 0.5, 1);
}
else
	sound_stop(sound_get("gf-walk"));
	
if(state == PS_DASH){
	if(state_timer == 0)
	sound_play(sound_get("gf-dash"), false, 0, 0.5, 1);
}
else
	sound_stop(sound_get("gf-dash"));
	
if (state == PS_DASH_TURN && state_timer == dash_turn_time-1)
    sound_play(sound_get("gf-dash"), false, 0, 0.5, 1);
    
//Fastfall effect stuff
if((state == PS_LAND || state == PS_LANDING_LAG || state == PS_HITSTUN_LAND || state == PS_PRATLAND) && window_timer == 0 && wasFastfall == true && !was_parried){
    shake_camera( 2, 2 );
    
    if (has_rune("E") && !hitpause && state_timer == 0){
    	destroy_hitboxes();
    	create_hitbox(AT_TAUNT, 1, x, y-10);
    	sound_play(asset_get("sfx_tow_anchor_land"), false, noone, 0.75, 1);
    }
}

if(fast_falling){
    wasFastfall = true;
    if (get_player_color(player) != 26){
		land_sound = sound_get("gf-fastfall");
		landing_lag_sound = sound_get("gf-fastfall");
    }
    else{
		land_sound = sound_get("fridgeslam");
		landing_lag_sound = sound_get("fridgeslam");
    }
}
if(state_cat == SC_GROUND_NEUTRAL || state == PS_JUMPSQUAT){
    wasFastfall = false;
}

if(!wasFastfall){
	if (get_player_color(player) != 26){
	    land_sound = asset_get("sfx_land_heavy");
	    landing_lag_sound = asset_get("sfx_land_heavy");
	}
	else{
	    land_sound = sound_get("land");
	    landing_lag_sound = sound_get("land");
	}
}

if (has_rune("E") && free && down_pressed && !fast_falling && !hitstun && !hitpause && state != PS_ATTACK_AIR){
	vsp = fast_fall;
	fast_falling = true;
	sound_play(asset_get("sfx_ori_ustrong_charge"), false, noone, 0.8, 2);
	spawn_hit_fx(x-24*spr_dir, y-48, rainSmall);
	create_hitbox(AT_TAUNT, 2, x, y-16);
}

if (down_down && !free && has_rune("F"))
	hsp = hsp*0.9;

//States that knock you out of the Genesis Taunt mode
if ((state == PS_ATTACK_AIR || (state == PS_ATTACK_GROUND && attack != AT_TAUNT_2) || state == PS_PARRY || state_cat == SC_HITSTUN) && GenesisMode){
	GenesisMode = false;
	sound_play(asset_get("mfx_tut_fail"));
	spawn_hit_fx(x, y, genesisFX);
}

if (has_skin()) { //is there a skin equipped?
    sprite_index = skin_sprite(sprite_index); //get the skinned sprite
    basic_animations(); //correct the idle, walk, and dash animations
}

//COPY START
#define sprite_get_skinned
var sprite = argument[0];
var skin = argument_count > 1 ? argument[1] : _ssnksprites.skin_active;

///Gets a skinned sprite based on its name.
var obj = (object_index != oPlayer && object_index != oTestPlayer) ? player_id : id;
with obj if (_ssnksprites.skin_active != -1 || argument_count > 1)  {
    
    var skindata = argument_count > 1 ? -1 : _ssnksprites.skins_n[_ssnksprites.skin_active];
    if is_string(skin) {
        if skin in _ssnksprites.skins skindata = variable_instance_get(_ssnksprites.skins, skin);
        else print(`Skin ${skin} not found.`);
    } else if is_number(skin) {
        if skin < array_length(_ssnksprites.skins_n) skindata = _ssnksprites.skins_n[skin];
        else print(`Skin ${skin} not found.`);
    }
    if !is_array(skindata) return sprite_get(sprite);
    var skinname = skindata[0];
    var suffix = skindata[1];
    var name_raw = skindata[2];
    var cache = variable_instance_get(_ssnksprites.cache,name_raw, -1);
    var spr;
    if sprite in cache return variable_instance_get(cache,sprite);
    spr = sprite_get(sprite);
    
    if string(spr) in _ssnksprites.names {
        var sproot = sprite_get(`${suffix? //if suffix
                                    sprite+skinname: //suffix
                                    skinname+sprite}`); //prefix
        if sproot == asset_get('net_disc_spr') { //no X allowed
            variable_instance_set(cache,sprite,spr);
            return spr;
        }
        if sprite_get_xoffset(sproot) == 0 && sprite_get_yoffset(sproot) == 0 {
            sprite_change_offset(sproot,sprite_get_xoffset(spr),sprite_get_yoffset(spr));
        }
        variable_instance_set(cache,sprite,sproot); //put sprite in cache
        return sproot;
    } else {
        variable_instance_set(cache,sprite,spr);
        return spr;
    }
}
return sprite_get(sprite);

#define skin_sprite
var spr_index = argument[0];
var skin = argument_count > 1 ? argument[1] : _ssnksprites.skin_active;

///Gets a skinned sprite by its unskinned sprite index.
var str = `${spr_index}`;
var obj = (object_index != oPlayer && object_index != oTestPlayer) ? player_id : id;
with obj if (_ssnksprites.skin_active != -1 || argument_count > 1)  {
    var skindata = argument_count > 1 ? -1 : _ssnksprites.skins_n[_ssnksprites.skin_active];
    if is_string(skin) {
        if skin in _ssnksprites.skins skindata = variable_instance_get(_ssnksprites.skins, skin);
        else print(`Skin ${skin} not found.`);
    } else if is_number(skin) {
        if skin < array_length(_ssnksprites.skins_n) && skin >= 0 skindata = _ssnksprites.skins_n[skin];
        else print(`Skin #${skin} out of bounds.`);
    }
    if !is_array(skindata) return(spr_index);
    var skinname = skindata[0];
    var suffix = skindata[1];
    var name_raw = skindata[2];
    var cache = variable_instance_get(_ssnksprites.cache,name_raw, -1);
    if (str in cache) return variable_instance_get(cache,str);
    if (str in _ssnksprites.names) {
        var sprname = variable_instance_get(_ssnksprites.names,str);
        //var sproot = sprite_get(`${variable_instance_get(_ssnksprites.names,str)+_ssnksprites.skins[_ssnksprites.skin_active]}`);
        var sproot = sprite_get(`${suffix? //if suffix
                                    sprname+skinname: //suffix
                                    skinname+sprname}`); //prefix
        if sproot == asset_get('net_disc_spr') { //no X allowed
            variable_instance_set(cache,str,spr_index);
            return spr;
        }
        if sprite_get_xoffset(sproot) == 0 && sprite_get_yoffset(sproot) == 0 {
            sprite_change_offset(sproot,sprite_get_xoffset(spr_index),sprite_get_yoffset(spr_index));
        }
        variable_instance_set(cache,str,sproot); //put sprite in cache
        return sproot;
    } else {
        variable_instance_set(cache,str,spr_index);
        return spr_index;
    }
}
return spr_index;

#define basic_animations()
/// Run this after changing the sprite_index.
// Corrects certain animations to be how they normally would be.
switch (state){
    case PS_IDLE:
    case PS_RESPAWN:
    case PS_SPAWN:
        image_index = state_timer*idle_anim_speed;
    break;
    case PS_WALK:
        image_index = state_timer*walk_anim_speed;
    break;
    case PS_DASH:
        image_index = state_timer*dash_anim_speed;
    break;
}

#define set_skin(skin)
///Sets the active skin. You can supply a name or an index.
var obj = (object_index != oPlayer && object_index != oTestPlayer) ? player_id : id;
with obj {
    if (is_string(argument[0])) {
        //_ssnksprites.skin_active = array_find_index(_ssnksprites.skins,skin);
        var sskin = -1;
        if argument[0] in _ssnksprites.skins {
            _ssnksprites.skin_active = variable_instance_get(_ssnksprites.skins, argument[0])[@3];
        }
        else print(`Skin ${skin} not found.`);
    } else if (is_number(argument[0])) {
        
        if (_ssnksprites.skin_active >= array_length(_ssnksprites.skins_n)) print(`${skin} is out of bounds of the skin array. [0..${array_length(_ssnksprites.skins_n)-1}] inclusive. (-1 to disable skin.)`);
        else _ssnksprites.skin_active = skin;
    }
}

#define get_skin()
///Gets the active skin. -1 when no skin is active.
if object_index != oPlayer && object_index != oTestPlayer {
    return player_id._ssnksprites.skin_active;
}
return _ssnksprites.skin_active;

#define has_skin()
///Shortcut for get_skin() != -1.
if object_index != oPlayer && object_index != oTestPlayer {
    return player_id._ssnksprites.skin_active != -1;
}
return _ssnksprites.skin_active != -1;
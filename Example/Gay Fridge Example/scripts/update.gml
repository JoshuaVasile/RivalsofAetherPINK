
//Here's the variables that change Gay Fridge's frame data while they're in the DSpecial cold aura
if(isCool){
	walk_accel = 0.05;
	dash_stop_percent = .5;
	ground_friction = .1;
	//moonwalk_accel = 1.4;
	wave_land_adj = 1.6 + 0.4*has_rune("C");
}
else if(state != PS_ATTACK_GROUND){
	walk_accel = 0.2;
	dash_stop_percent = .25;
	ground_friction = .4;
	//moonwalk_accel = 1.2;
	wave_land_adj = 1.1 + 0.4*has_rune("C");
}

//Having DSpecial out prevents Gay Fridge from being able to use FAir
if (!hasFlag){
	//dash_speed = 5.5;
	air_accel = .3;
	leave_ground_max = 7;
}
else{
	//dash_speed = 5;
	air_accel = .2;
	//isCool = false;
	leave_ground_max = 6;
}

if (state != PS_ATTACK_AIR){
	max_fall = 12;
}

if (has_rune("C")){
	initial_dash_speed = 8;
	dash_speed = 7;
	air_max_speed = 5;
	max_jump_hsp = 10;
}

if (has_rune("F")){
	dash_stop_percent = 1;
	ground_friction = 0;
	wave_friction = 0;
}
//FSpecial and USpecial can only be used once per jump	
if (fspecUsed = true){
	move_cooldown[AT_FSPECIAL] = 2;
}
if (uspecUsed = true){
	move_cooldown[AT_USPECIAL] = 2;
}
if (!free || state == PS_WALL_JUMP || state_cat == SC_HITSTUN){
	fspecUsed = false;
	uspecUsed = false;
	fspecPrat = false;
}

//In training mode figure out
if (get_training_cpu_action() != CPU_FIGHT) 
{
	if(gf_Timer > 0)
		gf_Timer --;
	else
		gf_Msg = "";

	if(taunt_down)
	{
		if (up_pressed){
			if (gf_Cycle != 15)
			gf_Cycle ++;
			else
			gf_Cycle = 0;
			sound_play(asset_get("mfx_hp"), false, 0, 1, 1);
		}
		else if (down_pressed){
			if (gf_Cycle != 0)
			gf_Cycle --;
			else
			gf_Cycle = 15;
			sound_play(asset_get("mfx_hp"), false, 0, 1, 1);
		}
		clear_button_buffer(PC_TAUNT_PRESSED);
		gf_Timer = 90;
		switch (gf_Cycle){
			case 0:
			case 16:
				gf_Msg = "Full Random"
			break;
			case 1:
				gf_Msg = "Pop Rocket Only"
			break;
			case 2:
				gf_Msg = "Grapes Only"
			break;
			case 3:
				gf_Msg = "Watermelon Only"
			break;
			case 4:
				gf_Msg = "Bell Pepper Only"
			break;
			case 5:
				gf_Msg = "Pizza Only"
			break;
			case 6:
				gf_Msg = "Apple Only"
			break;
			case 7:
				gf_Msg = "Banana Peel Only"
			break;
			case 8:
				gf_Msg = "Rotten Apple Only"
			break;
			case 9:
				gf_Msg = "Carrot Only"
			break;
			case 10:
				gf_Msg = "Ice Cube Only"
			break;
			case 11:
				gf_Msg = "Chili Pepper Only"
			break;
			case 12:
				gf_Msg = "Egg Only"
			break;
			case 13:
				gf_Msg = "Starfruit Only"
			break;
			case 14:
				gf_Msg = "Donut Only"
			break;
			case 15:
			case -1:
				gf_Msg = "Shrimp Only"
			break;
		}

	}
}

hue_offset = hue_offset mod 255; //keeps hue_offset within the 0-255 range
hue_offset += hue_speed;
afterimageHueshift = afterimageHueshift mod 255; //keeps hue_offset within the 0-255 range
afterimageHueshift += afterimageHuespeed;
//The Gayming alt makes Gay Fridge's base color hue shift
if (get_player_color( player ) == 25) {

	color_rgb = make_color_rgb(255, 175, 175); //input rgb values here, uses rgb to create a gamemaker colour variable
	hue = (color_get_hue(color_rgb) + hue_offset) mod 255; //finds the hue and shifts it
	color_hsv = make_color_hsv(hue, color_get_saturation(color_rgb), color_get_value(color_rgb)); //creates a new gamemaker colour variable using the shifted hue
	if (!alt_modifier){
	set_color_profile_slot(25, 0,color_get_red(color_hsv),color_get_green(color_hsv),color_get_blue(color_hsv));
	}
	else{
	set_color_profile_slot(25, 1,color_get_red(color_hsv),color_get_green(color_hsv),color_get_blue(color_hsv));
	}
	
	init_shader();
}

afterimageHue = (color_get_hue(make_color_rgb(255, 255, 255)) + afterimageHueshift) mod 255;

//This resets DAir's cancellability if Gay Fridge cancels the move in the air or gets hit
if(!free || (free && (state != PS_ATTACK_AIR || attack != AT_DAIR)) || state_cat == SC_HITSTUN){
	dairCycle = 0;
}
//This is for runes.
if (!free || state == PS_WALL_JUMP)
	uairUsed = false;

if (move_cooldown[AT_NSPECIAL] == 2 && nspecUsed){
	white_flash_timer = 15;
	readyFlash = spawn_hit_fx(x+24,y-48,19);
	nspecUsed = false;
	if (get_player_color(player) != 26)
		sound_play(asset_get("sfx_chest_open"));
	else
		sound_play(sound_get("megafire"));
}
//HEATWAVE SKIN
/*if (get_player_color(player) == 17){
	set_window_value(AT_DSPECIAL, 1, AG_WINDOW_SFX, asset_get("sfx_zetter_fireball_fire"));
	set_attack_value(AT_DSPECIAL, AG_SPRITE, sprite_get("dspecialducky"));
	set_hitbox_value(AT_NSPECIAL, 1, HG_PROJECTILE_SPRITE, sprite_get("bbq-popsicle"));
	set_hitbox_value(AT_NSPECIAL, 2, HG_PROJECTILE_SPRITE, sprite_get("bbq-grape"));
	set_hitbox_value(AT_NSPECIAL, 3, HG_PROJECTILE_SPRITE, sprite_get("bbq-melon"));
	set_hitbox_value(AT_NSPECIAL, 4, HG_PROJECTILE_SPRITE, sprite_get("bbq-pepper"));
	set_hitbox_value(AT_NSPECIAL, 5, HG_PROJECTILE_SPRITE, sprite_get("bbq-pizza"));
	set_hitbox_value(AT_NSPECIAL, 6, HG_PROJECTILE_SPRITE, sprite_get("bbq-apple"));
	set_hitbox_value(AT_NSPECIAL, 7, HG_PROJECTILE_SPRITE, sprite_get("bbq-banana"));
	set_hitbox_value(AT_NSPECIAL, 2, HG_VISUAL_EFFECT, 3);
	set_hitbox_value(AT_NSPECIAL, 2, HG_PROJECTILE_DESTROY_EFFECT, 15);
	set_hitbox_value(AT_NSPECIAL, 3, HG_VISUAL_EFFECT, 253);
	set_hitbox_value(AT_NSPECIAL, 3, HG_PROJECTILE_DESTROY_EFFECT, 3);
	set_hitbox_value(AT_NSPECIAL, 6, HG_PROJECTILE_DESTROY_EFFECT, 144);
}*/

for(i = 1; i < 10; i++){
	set_hitbox_value(attack, i, HG_HIT_PARTICLE_NUM, 1);
}

if (galaxyTimer >= 0)
	galaxyTimer ++;
if (galaxyTimer > 40)
	galaxyTimer = -1;
	
if (GenesisMode)
	set_skin("genesis");
else
	set_skin(-1);
	
if (GenesisMode) {
	move_cooldown[AT_TAUNT] = 5;
	move_cooldown[AT_TAUNT_2] = 5;
}	
//print(GenesisMode)

/*if (!collision_circle(x+20, y-40, 180, asset_get("obj_article1"), true, false)){
	with (obj_article1){
		if (player_id.url == other.url){
			other.isCool = false;
		}
	}
}*/

for (var i = 0; i < instance_number(asset_get("obj_article1")); i++) {
    var f = instance_find(asset_get("obj_article1"), i);
    if (!collision_circle(x+20, y-40, 180, f, true, false) && f.player_id.url == url)
    	isCool = false;
}

if (state == PS_WALL_JUMP){
	max_fall = 12;
	air_accel = 0.2;
	air_max_speed = 4;
}

// update afterimage array
var newArray = 0;
for (var i = 0; i < array_length_1d(afterimage_array); ++i)
{
    var obj = afterimage_array[i];
    if (++obj.timer <= obj.timerMax) newArray[array_length_1d(newArray)] = obj;
}
afterimage_array = newArray;

#define CreateAfterimage()
{
    afterimage_array[array_length_1d(afterimage_array)] = {x:x+draw_x, y:y+draw_y, spr_dir:spr_dir, sprite_index:sprite_index, image_index:image_index, rot:spr_angle, col:c_white, timer:0, timerMax:20};
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
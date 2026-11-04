var charuuid = string(sprite_get("idle"));
if ("css_char" not in self || css_char != charuuid) {
    css_char = charuuid;
    sound_play(sound_get("gf-nspecial"));
}


//Alt 19 is a rainbow alt
if !("hue" in self) hue = 0;

//remember rivals starts with 0
hue+=1 
if hue>255 hue-=255;

//make hue shift every step + loop around
color_rgb_css = make_color_rgb(255, 50, 50);
//make a gamemaker color variable using kirby's default color (body)
//shift that colour by Hue, make sure it also loops
color_hsv_css=make_color_hsv(hue,color_get_saturation(color_rgb_css),color_get_value(color_rgb_css));

color_rgb = make_color_rgb(255, 175, 175);
color_hsv=make_color_hsv(hue,color_get_saturation(color_rgb),color_get_value(color_rgb));
//make a gamemaker color variable using the new hue
if (!alt_modifier){
set_color_profile_slot(25, 0,color_get_red(color_hsv),color_get_green(color_hsv),color_get_blue(color_hsv));
set_color_profile_slot( 25, 1, 97, 97, 97 ); //Handle
}
else{
set_color_profile_slot(25, 1,color_get_red(color_hsv),color_get_green(color_hsv),color_get_blue(color_hsv));
set_color_profile_slot( 25, 0, 26, 26, 26 ); //Fridge
}
//set the new color using rgb values from the gamemaker color
init_shader();

//Here's how the Alt names work
var temp_x = x + 8;
var temp_y = y + 8;

patch_ver = "1.0";
patch_day = "";
patch_month = "";

var drawAlpha = 1;
var num_alts = 20;
var alt_cur = get_player_color(player);

var doNotInitShader = "alt_name" in self; // check if running for the first time

//Alt name init. var doesn't work with arrays lol
alt_name[0]  = "Homo Hardware";
alt_name[1]  = "Les-Below 0";
alt_name[2]  = "Cotton Candy";
alt_name[3]  = "Why Not Both?";
alt_name[4]  = "Frying Pan";
alt_name[5]  = "They Fridge";
alt_name[6]  = "Ace Cream";
alt_name[7]  = "Chocolate Chip";
alt_name[8]  = "Gender Fluid";
alt_name[9]  = "A Gender Gayed This Fridge?";
alt_name[10]  = "Queerapolitan";
alt_name[11] = "Polysh Ice";
alt_name[12] = "Get Me a Repair Man";
alt_name[13] = "Alluring Aroma";
alt_name[14] = "Nothing Burger (based)";
alt_name[15] = "Demi Glace";
alt_name[16] = "Cheerio!";
alt_name[17]  = "Suzie Q's";
alt_name[18]  = "That's Amory";
alt_name[19]  = "Part-time";
alt_name[20]  = "Half n' Half";
alt_name[21]  = "Free Surf n' Turf";
alt_name[22]  = "Hostess Cake";
alt_name[23]  = "Teddy Grahams";
alt_name[24]  = "Get Real";
alt_name[25]  = "G A Y M I N G";
alt_name[26]  = "Colored Past";
alt_name[27]  = "Neapolitan";
alt_name[28]  = "Coolbert";
alt_name[29]  = "Furniture Mod";
alt_name[30]  = "Fridge Guys";
alt_name[31]  = "scientific name for pig";

if(!doNotInitShader){
    init_shader(); // makes the shader update when you return to the CSS (don't know why the game is coded so that this necessary)
}

draw_sprite_ext(sprite_get("css_bg"), 0, temp_x, temp_y, 1, 1, 0, color_hsv_css, 1);

sprite_change_offset("charselect", 51, 0);
draw_sprite_ext(sprite_get("charselect"), 0, temp_x+102, temp_y, 2, 2, 0, c_white, 1);
draw_sprite_ext(sprite_get("css-button"), voice_button_index, temp_x+4, temp_y+36, 1, 1, 0, -1, 1);
//Patch
draw_set_halign(fa_left);
if (get_player_color(player) != 19)
    textDraw(temp_x + 2, temp_y + 130, "fName", c_white, 0, 1000, 1, true, drawAlpha, "Alt " + string(alt_cur+1) + ": " + alt_name[alt_cur] + (alt_modifier ? " v2" : ""));
else
    textDraw(temp_x + 2, temp_y + 130, "fName", c_white, 0, 1000, 1, true, drawAlpha, "Alt 20: Part-Time " + (alt_modifier ? "Waitress" : "Busboy"));
//set_synced_var(player, voice_button);

#define textDraw(x, y, font, color, lineb, linew, scale, outline, alpha, string)

draw_set_font(asset_get(argument[2]));

if argument[7]{ //outline. doesn't work lol
    for (i = -1; i < 2; i++){
        for (j = -1; j < 2; j++){
            draw_text_ext_transformed_color(argument[0] + i * 2, argument[1] + j * 2, argument[9], argument[4], argument[5], argument[6], argument[6], 0, c_black, c_black, c_black, c_black, alpha);
        }
    }
}

draw_text_ext_transformed_color(argument[0], argument[1], argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[3], argument[3], argument[3], argument[3], argument[8]);

return string_width_ext(argument[9], argument[4], argument[5]);

#define cpu_hover_draw()
if (cpu_hover_time > 0) {
    var prog = min(cpu_hover_time/10, 1);
    var colprog = min(cpu_color_swap_time/5, 1);
    var col = merge_color(cpuh_prev_color, cpuh_new_color, colprog);
    draw_sprite_ext(cpu_hover_sprite, 0, x - 4, y - 6, 2, 2, 0, col, prog);
    draw_set_alpha(prog);
    draw_debug_text(plate_bounds[2]-17, plate_bounds[3]+1, `P${cpu_hovering_player}`);
    draw_set_alpha(1);
}

set_synced_var(player, voice_button);

#define cpu_hover_update()
var p = player;
var is_cpu = (get_player_hud_color(p) == 8421504);
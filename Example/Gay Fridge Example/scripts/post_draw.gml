shader_start();
if (attack == AT_NSPECIAL && (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND) && window < 3 && nspecCycle > 0){
    if (has_rune("N") && (window_timer >= 3 || window == 2))
        draw_sprite_ext(sprite_get("nspecfoods"), nspecCycle, x,y,spr_dir,1,0,c_white,100);
    if (!has_rune("N") && (window_timer >= 6 || window == 2))
        draw_sprite_ext(sprite_get("nspecfoods"), nspecCycle, x,y,spr_dir,1,0,c_white,100);
}
shader_end();

if(state == PS_ATTACK_AIR && attack == AT_FSPECIAL && (window == 4 || window == 5) && has_rune("I"))
{
    shader_start();
        draw_sprite_ext(sprite_get("fspecial-RuneOverlay"), image_index, x, y-32, 1, 1*spr_dir, fire_ang, c_white, 1)
    shader_end();
}

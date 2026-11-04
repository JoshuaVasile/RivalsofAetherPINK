/*//OLD AFTERIMAGE CODE
for (var i = 0; i < afterImageMax; ++i) if (afterImage[i] != -1 && afterImage[i].alpha > 0 && draw_indicator)
{
    shader_start();
    gpu_set_blendmode(bm_zero);
    draw_sprite_ext(afterImage[i].sprite_index, afterImage[i].image_index, afterImage[i].x, afterImage[i].y, afterImage[i].spr_dir, 1, 0, make_color_hsv(afterimageHue, 100, 100), afterImage[i].alpha/10);
    gpu_set_blendmode(bm_normal);
    shader_end();
}*/

shader_start();
if (state == PS_RESPAWN || state == PS_ATTACK_GROUND && attack == AT_TAUNT && initial_invince == 1)
    draw_sprite(sprite_get("catalog"), 0, x,y);
if((state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND))
{
    if(attack == AT_FSPECIAL)
    {
        force_depth = 1;
        if(instance_exists(grabbed_player_obj))
            depth = grabbed_player_obj.depth + 1;
    }
}
shader_end();

// afterimage
for (var i = 0; i < array_length_1d(afterimage_array); ++i)
{
    var obj = afterimage_array[i];
    gpu_set_fog(1, obj.col, 0, 1);
    draw_sprite_ext(obj.sprite_index, obj.image_index, obj.x, obj.y, obj.spr_dir*(1+small_sprites), 1+small_sprites, obj.rot, obj.col, 2*(1-obj.timer/obj.timerMax));
}
gpu_set_fog(0, c_white, 0, 0);

if (galaxyTimer >= 0){
    draw_sprite_ext(sprite_get("galaxyBG"), 0, view_get_xview()-ease_cubeOut(0, 960, galaxyTimer, 40), view_get_yview(),1,1,0,c_white,ease_linear(1, 0, galaxyTimer, 30));
    
    if(instance_exists(hit_player_obj))
        depth = hit_player_obj.depth + 1;
}
//Draw HUD

shader_start();
if(get_training_cpu_action() != CPU_FIGHT)
{
    if((state == PS_SPAWN || prev_state == PS_SPAWN) && attack != AT_TAUNT && attack != AT_TAUNT_2)
    {
        draw_debug_text(temp_x+24, temp_y-16, "Hold TAUNT + press UP/DOWN");
        draw_debug_text(temp_x+24, temp_y, "to select NSPECIAL fruits");
    }
    else
        draw_debug_text(temp_x+24, temp_y-8, gf_Msg);
        
    draw_sprite_ext(sprite_get("nspecfoods"), gf_Cycle, temp_x+8, temp_y+20,1,1,0,c_white,1);
}
shader_end();
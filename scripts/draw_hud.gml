// draw_hud will draw things on the hud.
user_event(11);
if (fan_cooldown == 0)
{
shader_start();
draw_sprite(sprite_get("dummy_cooldown"), 0, temp_x + 168, 496);
shader_end();
}
else
{
    shader_start();
    draw_sprite(sprite_get("dummy_cooldown"), 1, temp_x + 168, 496);
    shader_end();
}

if (ghost_cooldown == 0)
{
shader_start();
draw_sprite(sprite_get("ghost_cooldown"), 0, temp_x + 196, 494);
shader_end();
}
else
{
    shader_start();
    draw_sprite(sprite_get("ghost_cooldown"), 1, temp_x + 196, 494);
    shader_end();
}


//if (fan_cooldown == 0)
//{
//    draw_sprite(sprite_get("dummy_cooldown"), 0, temp_x + 170, 506);
//}
//else
//{
//    draw_sprite(sprite_get("dummy_cooldown"), 1, temp_x + 170, 506);
//}
// draw_hud will draw things on the hud.
user_event(11);

// Battle Box readiness indicator (to the left of the Dummy icon at temp_x + 140, 496)
// Only active once Pink has unlocked her Ultimate at 60% damage and cooldown is 0
var bb_primed = false;
for (var p = 1; p <= 4; p++) {
    if (bb_dummy_hit_timer[p] > 0 || bb_kitty_hit_timer[p] > 0) {
        bb_primed = true;
    }
}

if (bb_unlocked && bb_cooldown == 0)
{
    // Pulse slightly when an opponent is primed with 1 hit so landing the second hit triggers the Battle Box
    var bb_alpha = 1;
    if (bb_primed && (get_gameplay_time() % 10 < 5)) {
        bb_alpha = 0.65;
    }
    draw_sprite_ext(sprite_get("battlebox_cooldown"), 0, temp_x + 140, 496, 1, 1, 0, c_white, bb_alpha);
}
else
{
    draw_sprite(sprite_get("battlebox_cooldown"), 1, temp_x + 140, 496);
}

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

// draw_hud will draw things on the hud.
user_event(11);

// =========================================================================
// Doki Meter (3-column slanted meter positioned to the left of Pink's HUD)
// Tier 1: Green (0..33%)
// Tier 2: Purple (34..66% - Heart aura, +5% Kiss crit, +2 damage)
// Tier 3: Pink (67..100% - At 100% MAX, Battle Box is earned & unlocked!)
// =========================================================================
var dm_x = temp_x - 36;
var dm_y = temp_y - 18;

var bg_frame = 0;
if (doki_meter >= 100) {
    bg_frame = ((get_gameplay_time() div 6) % 2);
}

// 1. Draw Meter Frame (DOKI / MAX header + 3 empty slanted tracks)
draw_sprite(sprite_get("doki_meter_bg"), bg_frame, dm_x, dm_y);

// 2. Fill the 3 slanted columns based on meter percentage
var bar_x = [2, 10, 18];
var r1 = clamp(doki_meter / 33.33, 0, 1);
var r2 = clamp((doki_meter - 33.33) / 33.33, 0, 1);
var r3 = clamp((doki_meter - 66.66) / 33.34, 0, 1);
var ratios = [r1, r2, r3];

for (var c = 0; c < 3; c++) {
    var ratio = ratios[c];
    if (ratio > 0) {
        var fill_h = round(31 * ratio);
        var src_top = 41 - fill_h;
        draw_sprite_part_ext(
            sprite_get("doki_meter_fill"), 0,
            bar_x[c], src_top,
            10, fill_h,
            dm_x + bar_x[c], dm_y + src_top,
            1, 1, c_white, 1
        );
    }
}

// Battle Box readiness indicator (to the left of the Dummy icon at temp_x + 140, 496)
// Earned once Doki Meter reaches 100% (MAX) and cooldown is 0
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

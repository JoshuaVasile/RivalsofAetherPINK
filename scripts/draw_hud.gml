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


// =========================================================================
// Bomb Cooldown Indicators (outside battle, on top of player damage)
// Pink (frame 0) = UP!
// Blue (frame 1) = DOWN (lockout)!
// Positioned directly above her player damage at temp_x + 72 and temp_x + 104, temp_y - 30.
// Hides when neither move is locked out or recently recovered to be non-invasive.
// =========================================================================
var hud_bomb_y = temp_y - 30;

// Left Bomb: Kitty Bomb (NSpecial)
var k_draw = false;
var k_frame = 0;
var k_alpha = 1;
if (nspecial_lockout > 0) {
    k_draw = true;
    k_frame = 1; // Blue (sleeping)
} else if (nspecial_up_timer > 0) {
    k_draw = true;
    k_frame = 0; // Pink (awake)
    k_alpha = clamp(nspecial_up_timer / 30, 0, 1);
}

if (k_draw) {
    var k_nudge = (nspecial_hud_nudge > 0) ? ((nspecial_hud_nudge % 2 == 0) ? -2 : 2) : 0;
    draw_sprite_ext(sprite_get("hud_kitty_bomb"), k_frame, temp_x + 72 + k_nudge, hud_bomb_y, 1, 1, 0, c_white, k_alpha);
}

// Right Bomb: Smash Bomb (Ground FStrong)
var s_draw = false;
var s_frame = 0;
var s_alpha = 1;
if (fstrong_lockout > 0) {
    s_draw = true;
    s_frame = 1; // Blue (sleeping)
} else if (fstrong_up_timer > 0) {
    s_draw = true;
    s_frame = 0; // Pink (awake)
    s_alpha = clamp(fstrong_up_timer / 30, 0, 1);
}

if (s_draw) {
    var s_nudge = (fstrong_hud_nudge > 0) ? ((fstrong_hud_nudge % 2 == 0) ? -2 : 2) : 0;
    draw_sprite_ext(sprite_get("hud_smash_bomb"), s_frame, temp_x + 104 + s_nudge, hud_bomb_y, 1, 1, 0, c_white, s_alpha);
}

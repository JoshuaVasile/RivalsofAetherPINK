// update is a script that runs whatever code is in here every in-game frame.
user_event(14);
if (fan_cooldown > 0)
{
    fan_cooldown--;
    if (fan_cooldown == 0) {
        dummy_spawned = false;
    }
}

if (ghost_cooldown > 0)
{
    ghost_cooldown--;
    if (ghost_cooldown == 0) {
        ghost_spawned = false;
    }
}

if (bb_cooldown > 0)
{
    bb_cooldown--;
}

if (heal_popup_timer > 0)
{
    heal_popup_timer--;
    heal_popup_y -= 0.6;
}

if (state != PS_PARRY) {
    successful_parry = false;
    parry_success_timer = 0;
}

// Doki Meter & Ultimate state tracking:
// Taking damage drains Doki Meter (-0.5% per damage taken)
var cur_dmg = get_player_damage(player);
if (cur_dmg > prev_player_damage) {
    var diff = cur_dmg - prev_player_damage;
    doki_meter = max(0, doki_meter - diff * 0.5);
}
prev_player_damage = cur_dmg;

// Doki Meter Tiers:
// Tier 1: 0..33% (Green)
// Tier 2: 34..66% (Purple - Heart aura, +5% Crit chance, +2 damage on hits)
// Tier 3: 67..100% (Pink - at 100% MAX, Battle Box is earned & unlocked!)
var old_tier = doki_tier;
if (doki_meter >= 67) {
    doki_tier = 3;
} else if (doki_meter >= 34) {
    doki_tier = 2;
} else {
    doki_tier = 1;
}

if (doki_tier != old_tier) {
    doki_tier_flash = 20;
    if (doki_tier == 3 && doki_meter >= 100) {
        sound_play(sound_get("heart_electric"));
    } else if (doki_tier == 2) {
        sound_play(sound_get("sfx_mark"));
    }
}
if (doki_tier_flash > 0) doki_tier_flash--;

if (doki_meter >= 100) {
    bb_unlocked = true;
} else {
    bb_unlocked = false;
}

// Reset on respawn / death / spawn: Earn ult via Doki Meter
if (state == PS_RESPAWN || state == PS_SPAWN || state == PS_DEAD) {
    bb_unlocked = false;
    bb_cooldown = 0;
    doki_meter = 0;
    doki_tier = 1;
    prev_player_damage = 0;
    bb_dummy_hit_timer = [0, 0, 0, 0, 0];
    bb_kitty_hit_timer = [0, 0, 0, 0, 0];
}

// Allow Down Taunt out of crouch
if (state == PS_CROUCH && (taunt_pressed || taunt_down)) {
    is_down_taunt = true;
    set_attack(AT_TAUNT_2);
}

for (var p = 1; p <= 4; p++) {
    if (bb_dummy_hit_timer[p] > 0) bb_dummy_hit_timer[p]--;
    if (bb_kitty_hit_timer[p] > 0) bb_kitty_hit_timer[p]--;
}

// Deltarune Battle Box Cutscene Attack (like The Roaring Knight, with Pink's 2 Boss Fight modes)
if (bb_active) {
    bb_timer++;
    if (bb_soul_invuln > 0) bb_soul_invuln--;
    if (bb_soul_move_cd > 0) bb_soul_move_cd--;
    if (bb_soul_trail_timer > 0) bb_soul_trail_timer--;

    var victim_valid = instance_exists(bb_victim) && bb_victim.state != PS_DEAD && bb_victim.state != PS_RESPAWN;

    if (victim_valid && bb_timer <= bb_max_time) {
        // Protect and lock Pink in her Taunt & Laugh animation
        hsp = 0;
        vsp = 0;
        can_move = false;
        can_fast_fall = false;
        invincible_timer = 10;
        hurtboxID.sprite_index = asset_get("empty_sprite");
        if (state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR) {
            window = 1;
            window_timer = 1;
        }
        sprite_index = sprite_get("taunt");
        image_index = (bb_timer div 6) % 4;

        // Protect and lock the trapped opponent inside the Battle Box
        bb_victim.x = lerp(bb_victim.x, bb_box_x, 0.25);
        bb_victim.y = lerp(bb_victim.y, bb_box_y + 25, 0.25);
        bb_victim.hsp = 0;
        bb_victim.vsp = 0;
        bb_victim.state = PS_HITSTUN;
        bb_victim.state_timer = 0;
        bb_victim.hitpause = true;
        bb_victim.hitstop = 2;
        bb_victim.invincible_timer = 10;
        bb_victim.hurtboxID.sprite_index = asset_get("empty_sprite");

        // Opponent directional inputs (with CPU dodging fallback if opponent is a CPU)
        var v_left = bb_victim.left_down;
        var v_right = bb_victim.right_down;
        var v_up = bb_victim.up_down || bb_victim.up_pressed;
        var v_down = bb_victim.down_down || bb_victim.down_pressed;
        if (bb_victim.temp_level > 0 && (bb_timer % 16 == 0)) {
            var cpu_r = random_func_2(bb_timer % 16, 4, true);
            v_left = (cpu_r == 0);
            v_right = (cpu_r == 1);
            v_up = (cpu_r == 2);
            v_down = (cpu_r == 3);
        }

        // First 40 frames: Battle Box spins open while Pink laughs; allow Pink to pick Option 1 or Option 2
        if (bb_timer <= 40) {
            if (bb_timer >= 12) {
                if (attack_pressed || special_pressed) {
                    bb_mode = 1; // Option 1: Cat Musical Notes on 3 Strings
                    bb_max_time = 340; // 1.5s longer (was 250)
                } else if (up_strong_pressed || down_strong_pressed || left_strong_pressed || right_strong_pressed || strong_down || jump_pressed) {
                    bb_mode = 2; // Option 2: Falling Bombs on 4x4 Grid
                    bb_max_time = 350; // 1.5s longer (was 260)
                }
            }
            if (bb_timer == 40) {
                if (bb_mode != 1 && bb_mode != 2) {
                    bb_mode = 1;
                }
                if (bb_mode == 1) {
                    bb_soul_lane = 1;
                    bb_soul_x = 0;
                    bb_soul_y = 0;
                } else {
                    bb_soul_gx = 1;
                    bb_soul_gy = 1;
                    bb_soul_x = -39;
                    bb_soul_y = -31;
                }
            }
        } else if (bb_mode == 1) {
            // =========================================================================
            // FIGHT OPTION 1: Cat Musical Notes on 3 Purple Strings (10 damage per hit, 30% less than 15)
            // Box is 1.25x longer horizontally (-118..118 instead of -94..94)
            // =========================================================================
            bb_soul_x = clamp(bb_soul_x + 3.8 * (v_right - v_left), -118, 118);
            if (bb_soul_move_cd <= 0) {
                if (v_up && bb_soul_lane > 0) {
                    bb_soul_prev_y = bb_soul_y;
                    bb_soul_lane--;
                    bb_soul_trail_timer = 10;
                    bb_soul_move_cd = 10;
                } else if (v_down && bb_soul_lane < 2) {
                    bb_soul_prev_y = bb_soul_y;
                    bb_soul_lane++;
                    bb_soul_trail_timer = 10;
                    bb_soul_move_cd = 10;
                }
            }
            bb_soul_y = (bb_soul_lane == 0) ? -87 : ((bb_soul_lane == 1) ? 0 : 88);

            // Spawn 7 waves of Cat Musical Notes across the extended duration
            if ((bb_timer - 45) >= 0 && ((bb_timer - 45) % 38 == 0) && bb_spawned_count < 7) {
                bb_spawned_count++;
                var target_lane = bb_soul_lane;
                if (up_down) target_lane = 0;
                else if (down_down) target_lane = 2;

                var second_lane = (target_lane + 1 + (bb_spawned_count % 2)) % 3;

                // NEVER spawn a kitty in the middle lane (lane 1) at the start of the box creation
                // where the Soul Heart spawns, so players realize how to play the fight!
                if (bb_spawned_count == 1) {
                    target_lane = 0;
                    second_lane = 2;
                }

                var from_side = ((bb_spawned_count % 2) == 1) ? -1 : 1;
                var l_y = (target_lane == 0) ? -87 : ((target_lane == 1) ? 0 : 88);
                bb_objects[array_length(bb_objects)] = {
                    type: 1,
                    lane: target_lane,
                    x: from_side * 128,
                    y: l_y,
                    vx: -from_side * 3.8,
                    timer: 0,
                    active: true
                };

                // Secondary staggered Cat Note on another string (leaves at least 1 string open to dodge to)
                var l2_y = (second_lane == 0) ? -87 : ((second_lane == 1) ? 0 : 88);
                bb_objects[array_length(bb_objects)] = {
                    type: 1,
                    lane: second_lane,
                    x: -from_side * 128,
                    y: l2_y,
                    vx: from_side * 3.5,
                    timer: 0,
                    active: true
                };
                sound_play(sound_get("snd_pink_mew"));
            }

            // Update Cat Musical Notes & check collisions (7 damage, boosted 30%)
            for (var i = 0; i < array_length(bb_objects); i++) {
                var obj = bb_objects[i];
                if (obj.active && obj.type == 1) {
                    obj.x += obj.vx;
                    obj.timer++;
                    if (abs(obj.x) > 148) {
                        obj.active = false;
                    } else if (bb_soul_invuln <= 0 && obj.lane == bb_soul_lane && abs(obj.x - bb_soul_x) < 22) {
                        take_damage(bb_victim.player, player, 7);
                        bb_soul_invuln = 28;
                        obj.active = false;
                        sound_play(sound_get("snd_hurt1"));
                        sound_play(sound_get("snd_damage"));
                    }
                }
            }
        } else {
            // =========================================================================
            // FIGHT OPTION 2: Grid Bombs on 4x4 Dots (destroys row + col, 8 damage, cut in half from 17)
            // =========================================================================
            if (bb_soul_move_cd <= 0) {
                var mdx = v_right - v_left;
                var mdy = v_down - v_up;
                if (mdx != 0 || mdy != 0) {
                    if (mdx != 0) bb_soul_gx = clamp(bb_soul_gx + sign(mdx), 0, 3);
                    if (mdy != 0) bb_soul_gy = clamp(bb_soul_gy + sign(mdy), 0, 3);
                    bb_soul_move_cd = 9;
                }
            }
            var targ_x = (bb_soul_gx == 0) ? -118 : ((bb_soul_gx == 1) ? -39 : ((bb_soul_gx == 2) ? 39 : 118));
            var targ_y = (bb_soul_gy == 0) ? -94 : ((bb_soul_gy == 1) ? -31 : ((bb_soul_gy == 2) ? 31 : 94));
            bb_soul_x = lerp(bb_soul_x, targ_x, 0.45);
            bb_soul_y = lerp(bb_soul_y, targ_y, 0.45);

            // Spawn 6 Bombs onto grid dots across the extended duration
            if ((bb_timer - 45) >= 0 && ((bb_timer - 45) % 45 == 0) && bb_spawned_count < 6) {
                bb_spawned_count++;
                var b_gx = bb_soul_gx;
                var b_gy = bb_soul_gy;
                if (left_down) b_gx = max(0, b_gx - 1);
                if (right_down) b_gx = min(3, b_gx + 1);
                if (up_down) b_gy = max(0, b_gy - 1);
                if (down_down) b_gy = min(3, b_gy + 1);

                var bx = (b_gx == 0) ? -118 : ((b_gx == 1) ? -39 : ((b_gx == 2) ? 39 : 118));
                var by = (b_gy == 0) ? -94 : ((b_gy == 1) ? -31 : ((b_gy == 2) ? 31 : 94));
                bb_objects[array_length(bb_objects)] = {
                    type: 2,
                    gx: b_gx,
                    gy: b_gy,
                    x: bx,
                    y: by,
                    timer: 0,
                    hit_done: false,
                    active: true
                };
                sound_play(sound_get("snd_bombfall"));
            }

            // Update Bombs: timer 1..30 falls onto dot, timer 31..55 explodes along entire row & column (17 damage = 30% less than 25)
            for (var i = 0; i < array_length(bb_objects); i++) {
                var obj = bb_objects[i];
                if (obj.active && obj.type == 2) {
                    obj.timer++;
                    if (obj.timer == 31) {
                        sound_play(sound_get("snd_bomb"));
                    }
                    if (obj.timer >= 31 && obj.timer <= 46 && !obj.hit_done && bb_soul_invuln <= 0) {
                        if (bb_soul_gx == obj.gx || bb_soul_gy == obj.gy) {
                            take_damage(bb_victim.player, player, 11);
                            obj.hit_done = true;
                            bb_soul_invuln = 30;
                            sound_play(sound_get("snd_hurt1"));
                            sound_play(sound_get("snd_damage"));
                        }
                    }
                    if (obj.timer >= 55) {
                        obj.active = false;
                    }
                }
            }
        }
    } else {
        // Cleanly exit Battle Box and return both fighters to normal play
        bb_active = false;
        bb_cooldown = bb_cooldown_max;
        bb_objects = [];
        hurtboxID.sprite_index = hurtbox_spr;
        if (instance_exists(bb_victim)) {
            bb_victim.hurtboxID.sprite_index = bb_victim.hurtbox_spr;
            bb_victim.hitpause = false;
            bb_victim.hitstop = 0;
            bb_victim.invincible_timer = 20;
            bb_victim.hsp = 4 * spr_dir;
            bb_victim.vsp = -5;
        }
        bb_victim = noone;
        invincible_timer = 20;
        attack_end();
        set_state(free ? PS_IDLE_AIR : PS_IDLE);
    }
}

// Aerial Strong inputs:
// - Down + Strong does Aerial Down Smash (AT_DSTRONG when free: slowly falls, charges bomb, spikes downward, free fall after)
// - Left / Right + Strong does Aerial Left/Right Smash (AT_FSTRONG when free: slowly falls, charges bomb, drops bomb left or right, free fall after)
// - Up + Strong / Neutral Strong does Ghost Flight (AT_USPECIAL)
if (!bb_active && free && (state == PS_FIRST_JUMP || state == PS_DOUBLE_JUMP || state == PS_IDLE_AIR || state == PS_WALL_JUMP)) {
    if (down_strong_pressed || (down_down && (strong_pressed || strong_down))) {
        set_attack(AT_DSTRONG);
    } else if (left_strong_pressed || (left_down && (strong_pressed || strong_down))) {
        spr_dir = -1;
        set_attack(AT_FSTRONG);
    } else if (right_strong_pressed || (right_down && (strong_pressed || strong_down))) {
        spr_dir = 1;
        set_attack(AT_FSTRONG);
    } else if (move_cooldown[AT_USPECIAL] == 0 && (up_strong_pressed || (up_down && (strong_pressed || strong_down)) || strong_pressed || strong_down)) {
        set_attack(AT_USPECIAL);
    }
}

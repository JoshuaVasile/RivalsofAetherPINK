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
    if (bb_cooldown == 0 && bb_used_once && !bb_unlocked) {
        // 37 seconds elapsed after last use: Reloads Ultimate!
        bb_unlocked = true;
        doki_meter = 100;
        doki_tier = 3;
        sound_play(sound_get("heart_electric"));
        sound_play(sound_get("snd_pink_coin"));
    }
}

if (heal_popup_timer > 0)
{
    heal_popup_timer--;
    heal_popup_y -= 0.6;
}

if (kitty_step_cd > 0) {
    kitty_step_cd--;
}

if (state != PS_PARRY) {
    successful_parry = false;
    parry_success_timer = 0;
}

// Doki Meter & Ultimate state tracking:
// Pink takes slightly more damage (+15%) until her Doki bar is filled to 100% MAX.
// Taking damage drains Doki Meter based on current Tier level (unless locked in)
// Level 1: 0.4% per dmg | Level 2: 0.5% per dmg | Level 3 (last level): 0.6% per dmg
var cur_dmg = get_player_damage(player);
if (cur_dmg > prev_player_damage) {
    var diff = cur_dmg - prev_player_damage;
    if (!bb_unlocked) {
        // Takes slightly more damage until her Doki bar is filled (extra +15% damage taken)
        var extra_dmg = max(1, round(diff * 0.15));
        take_damage(player, -1, extra_dmg);
        cur_dmg = get_player_damage(player);
        diff = cur_dmg - prev_player_damage;

        var drain_rate = 0.5;
        if (doki_tier == 1) drain_rate = 0.4;
        else if (doki_tier == 2) drain_rate = 0.5;
        else if (doki_tier == 3) drain_rate = 0.6;
        doki_meter = max(0, doki_meter - diff * drain_rate);
    }
}
prev_player_damage = cur_dmg;

// Once locked in, doki_meter stays at 100 MAX and cannot be lost until used
if (bb_unlocked) {
    doki_meter = 100;
    doki_tier = 3;
} else {
    // Doki Meter Tiers:
    // Tier 1: 0..33% (Green)
    // Tier 2: 34..66% (Purple - Heart aura, +5% Crit chance, +2 damage on hits)
    // Tier 3: 67..100% (Pink - at 100% MAX, Battle Box is earned & locked in!)
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
        doki_meter = 100;
        bb_unlocked = true;
        bb_cooldown = 0;
        doki_tier = 3;
        sound_play(sound_get("heart_electric"));
    }
}

// Ground Left & Right Smash anti-spam 5.5-second lockout & fatigue decay
if (fstrong_lockout > 0) {
    fstrong_lockout--;
    if (fstrong_lockout == 0) {
        fstrong_up_timer = 180; // 3 seconds Pink (awake) notification to show it's back UP!
        fstrong_lockout_voiced = false;
    }
    if (!free) {
        move_cooldown[AT_FSTRONG] = 2; // Locked out from casting Ground FStrong
        if (state != PS_ATTACK_GROUND && state != PS_ATTACK_AIR && state != PS_HITSTUN && (left_strong_pressed || right_strong_pressed || ((left_down || right_down) && strong_pressed))) {
            fstrong_hud_nudge = 8;
            if (!fstrong_lockout_voiced) {
                fstrong_lockout_voiced = true;
                sound_play(sound_get("snd_lockout_huh"));
            }
        }
    } else {
        move_cooldown[AT_FSTRONG] = 0; // Aerial Bomb drop is still allowed
    }
} else {
    fstrong_lockout_voiced = false;
    if (fstrong_up_timer > 0) fstrong_up_timer--;
    if (fstrong_fatigue_timer > 0) {
        fstrong_fatigue_timer--;
        if (fstrong_fatigue_timer == 0) {
            fstrong_fatigue = 0; // Fully recovered back to full size
        }
    }
}
if (fstrong_hud_nudge > 0) fstrong_hud_nudge--;

// X Kitty (NSpecial) anti-spam 5.5-second lockout & fatigue decay
if (nspecial_lockout > 0) {
    nspecial_lockout--;
    if (nspecial_lockout == 0) {
        nspecial_up_timer = 180; // 3 seconds Pink (awake) notification to show it's back UP!
        nspecial_lockout_voiced = false;
    }
    move_cooldown[AT_NSPECIAL] = 2; // Locked out from casting X Kitty
    if (state != PS_ATTACK_GROUND && state != PS_ATTACK_AIR && state != PS_HITSTUN && special_pressed && !up_down && !down_down && !left_down && !right_down) {
        nspecial_hud_nudge = 8;
        if (!nspecial_lockout_voiced) {
            nspecial_lockout_voiced = true;
            sound_play(sound_get("snd_lockout_huh"));
        }
    }
} else {
    nspecial_lockout_voiced = false;
    if (nspecial_up_timer > 0) nspecial_up_timer--;
    if (nspecial_fatigue_timer > 0) {
        nspecial_fatigue_timer--;
        if (nspecial_fatigue_timer == 0) {
            nspecial_fatigue = 0; // Fully recovered back to full size
        }
    }
}
if (nspecial_hud_nudge > 0) nspecial_hud_nudge--;

// Reset airborne Down Kitty spam counter when landing, walljumping, or getting hit
if (!free || state == PS_WALL_JUMP || state == PS_HITSTUN || state == PS_HITSTUN_LAND) {
    dair_air_uses = 0;
}

// Reset on respawn / death / spawn: Doki meter goes to zero, gives chance to earn it again like the first time
if (state == PS_RESPAWN || state == PS_SPAWN || state == PS_DEAD) {
    doki_meter = 0;
    doki_tier = 1;
    bb_unlocked = false;
    bb_cooldown = 0;
    bb_uses_this_life = 0;
    bb_hits_taken = 0;
    fstrong_fatigue = 0;
    fstrong_fatigue_timer = 0;
    fstrong_lockout = 0;
    fstrong_up_timer = 0;
    fstrong_hud_nudge = 0;
    fstrong_lockout_voiced = false;
    nspecial_fatigue = 0;
    nspecial_fatigue_timer = 0;
    nspecial_lockout = 0;
    nspecial_up_timer = 0;
    nspecial_hud_nudge = 0;
    nspecial_lockout_voiced = false;
    prev_player_damage = 0;
    pink_charge_timer = 0;
    overcharge_warning = false;
    overcharge_hurt_timer = 0;
    dstrong_bomb_stage = 0;
    dstrong_bomb_scale = 1.0;
    ustrong_cat_count = 1;
    kitty_step_cd = 0;
    dair_air_uses = 0;
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
        bb_victim.invincible = false;
        bb_victim.invincible_timer = 0;
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

        // First 40 frames: Battle Box spins open while Pink laughs
        if (bb_timer <= 40) {
            if (bb_timer == 40) {
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
                        var cur_hit_dmg = round(6 + (bb_hits_taken * 1.0));
                        bb_victim.invincible = false;
                        bb_victim.invincible_timer = 0;
                        take_damage(bb_victim.player, player, cur_hit_dmg);
                        bb_hits_taken++;
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
                            var cur_hit_dmg = round(9 + (bb_hits_taken * 1.0));
                            bb_victim.invincible = false;
                            bb_victim.invincible_timer = 0;
                            take_damage(bb_victim.player, player, cur_hit_dmg);
                            bb_hits_taken++;
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
        bb_cooldown = bb_cooldown_max; // Starts 37-second reload countdown!
        bb_objects = [];
        bb_hits_taken = 0;
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

// Kitty Platforming: Pink can land on her thrown kitties (NSpecial, DAir, & Air UStrong) as a platform and bounce/jump off them!
if (kitty_step_cd <= 0 && !bb_active && overcharge_hurt_timer <= 0 && free && state != PS_HITSTUN && state != PS_HITSTUN_LAND && state != PS_PRATFALL && state != PS_DEAD && state != PS_RESPAWN) {
    if (!(state == PS_ATTACK_AIR && ((attack == AT_DAIR || attack == AT_USTRONG) && window <= 2 || (attack == AT_DAIR && dair_air_uses >= 3)))) {
        _found_kitty = noone;
        _found_ktop = 42;
        with (pHitBox) {
            if (other._found_kitty == noone && player_id == other.id && (attack == AT_NSPECIAL || attack == AT_DAIR || (attack == AT_USTRONG && sprite_index == sprite_get("cat"))) && hitbox_timer >= 5) {
                var k_top = (sprite_index == sprite_get("cat_tiny")) ? 20 : ((sprite_index == sprite_get("cat_small")) ? 30 : 42);
                if (abs(other.x - x) <= 28) {
                    var on_top = (other.vsp >= 0 && other.y >= y - k_top - 6 && other.y <= y - k_top * 0.25 + 8);
                    var jump_off = (other.jump_pressed && other.vsp > -4 && other.y >= y - k_top - 10 && other.y <= y + 6);
                    if (on_top || jump_off) {
                        other._found_kitty = id;
                        other._found_ktop = k_top;
                    }
                }
            }
        }
        if (_found_kitty != noone && instance_exists(_found_kitty)) {
            var want_jump = (jump_pressed || jump_down);
            vsp = want_jump ? -jump_speed : -7.2;
            djumps = 0;
            has_airdodge = true;
            has_walljump = true;
            kitty_step_cd = 6;

            if (state == PS_ATTACK_AIR) {
                attack_end();
            }
            set_state(want_jump ? PS_FIRST_JUMP : PS_IDLE_AIR);
            state_timer = 0;

            with (_found_kitty) {
                vsp = max(vsp, 5.5);
                kitty_bounce_cd = 6;
            }
            sound_play(want_jump ? jump_sound : sound_get("snd_bump"));
            spawn_hit_fx(_found_kitty.x, _found_kitty.y - _found_ktop, 301);
        }
    }
}

// Aerial Strong inputs:
// - Down + Strong does Aerial Down Smash (AT_DSTRONG when free: glides with gravity, charges growing bomb, drops it downward)
// - Forward + Strong does Aerial Left/Right Smash (AT_FSTRONG when free: glides with gravity, charges bomb, drops bomb forward)
// - Up + Strong does Aerial Up Smash (AT_USTRONG when free: glides with gravity, shoots chargeable bouncing kitty upward)
// - Neutral Strong (no direction held) does Ghost Flight (AT_USPECIAL) if off cooldown
// Note: Only triggers on fresh strong presses and does not override Backward Strong so Back Air (AT_BAIR) comes out reliably!
if (!bb_active && overcharge_hurt_timer <= 0 && free && (state == PS_FIRST_JUMP || state == PS_DOUBLE_JUMP || state == PS_IDLE_AIR || state == PS_WALL_JUMP)) {
    if (down_strong_pressed || (down_down && strong_pressed)) {
        set_attack(AT_DSTRONG);
    } else if ((left_strong_pressed || (left_down && strong_pressed)) && spr_dir == -1) {
        set_attack(AT_FSTRONG);
    } else if ((right_strong_pressed || (right_down && strong_pressed)) && spr_dir == 1) {
        set_attack(AT_FSTRONG);
    } else if (up_strong_pressed || (up_down && strong_pressed)) {
        set_attack(AT_USTRONG);
    } else if (move_cooldown[AT_USPECIAL] == 0 && strong_pressed && !left_down && !right_down && !down_down && !up_down) {
        set_attack(AT_USPECIAL);
    }
}

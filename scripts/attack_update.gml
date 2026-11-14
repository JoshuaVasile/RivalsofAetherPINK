// Overcharge Self-Hurt State: If Pink charges Ground FStrong, Air DStrong, or Ground UStrong for too long,
// she takes self-damage and plays the shocked/electrocuted overcharge_hurt sprite!
if (overcharge_hurt_timer > 0) {
    overcharge_hurt_timer--;
    overcharge_warning = false;
    super_armor = false;
    soft_armor = 0;
    can_move = false;
    can_fast_fall = false;
    destroy_hitboxes();

    // Keep the attack locked in Window 1 while playing the 2-frame shocked animation
    window = 1;
    window_timer = 1;
    sprite_index = sprite_get("overcharge_hurt");
    image_index = (overcharge_hurt_timer div 3) % 2;
    hsp *= 0.92;
    if (free && vsp < 6) {
        vsp += 0.25;
    }

    if (overcharge_hurt_timer <= 0) {
        char_height = 52;
        attack_end();
        set_state(free ? PS_IDLE_AIR : PS_IDLE);
    }
    exit;
}

// Ground Left & Right Smash (AT_FSTRONG): Extended charge (15 dmg half, 30 dmg full, KOs ~130%),
// warning flash before overcharge, self-damage if held too long, and spam fatigue tracking!
if (attack == AT_FSTRONG && !free) {
    var f_w1_len = get_window_value(AT_FSTRONG, 1, AG_WINDOW_LENGTH);
    if (window == 1 && window_timer >= f_w1_len - 2) {
        var holding_fstrong = (strong_down || left_strong_down || right_strong_down || attack_down || left_stick_down || right_stick_down);
        if (holding_fstrong) {
            pink_charge_timer++;
            window_timer = f_w1_len - 2;
            strong_charge = min(58, floor(pink_charge_timer * 58 / 75));

            // Start flashing at frame 55 to warn the player she will take damage if held to frame 90!
            if (pink_charge_timer >= 55) {
                overcharge_warning = true;
                if (pink_charge_timer == 55 || pink_charge_timer == 68 || pink_charge_timer == 78 || pink_charge_timer == 84) {
                    sound_play(sound_get("snd_noise"));
                }
            }

            // Overcharged for too long (frame 90): damages Pink and uses the shocked hurt sprite!
            if (pink_charge_timer >= 90) {
                overcharge_warning = false;
                overcharge_hurt_timer = 36;
                take_damage(player, -1, 10);
                vsp = -3.5;
                hsp = -2.5 * spr_dir;
                sound_play(sound_get("snd_bomb"));
                sound_play(sound_get("snd_hurt1"));
                sound_play(sound_get("heart_electric"));
                spawn_hit_fx(x + 18 * spr_dir, y - 40, 304);
                exit;
            }
        } else {
            overcharge_warning = false;
            strong_charge = round(clamp(pink_charge_timer / 75, 0, 1) * 60);
            window = 2;
            window_timer = 0;
        }
    }

    // Dynamic charge & spam-fatigue scaling: 9 dmg uncharged -> 15 dmg half charge -> 30 dmg full charge!
    if (window <= 2) {
        var charge_ratio = clamp(pink_charge_timer / 75, 0, 1);
        var base_charged_dmg = 9;
        if (charge_ratio <= 0.5) {
            base_charged_dmg = lerp(9, 15, charge_ratio * 2);
        } else {
            base_charged_dmg = lerp(15, 30, (charge_ratio - 0.5) * 2);
        }

        var fat_mult = 1.0;
        if (fstrong_fatigue == 1) fat_mult = 0.80;
        else if (fstrong_fatigue == 2) fat_mult = 0.60;
        else if (fstrong_fatigue == 3) fat_mult = 0.40;
        else if (fstrong_fatigue >= 4) fat_mult = 0.25;

        var final_dmg = max(2, round(base_charged_dmg * fat_mult));
        var final_bkb = lerp(7.6, 9.2, charge_ratio);
        var final_kbs = lerp(0.82, 1.02, charge_ratio) * lerp(1.0, 0.72, min(fstrong_fatigue, 4) / 4);
        var final_bhp = round(lerp(8, 14, charge_ratio));

        set_hitbox_value(AT_FSTRONG, 1, HG_DAMAGE, final_dmg);
        set_hitbox_value(AT_FSTRONG, 1, HG_BASE_KNOCKBACK, final_bkb);
        set_hitbox_value(AT_FSTRONG, 1, HG_KNOCKBACK_SCALING, final_kbs);
        set_hitbox_value(AT_FSTRONG, 1, HG_BASE_HITPAUSE, final_bhp);

        set_hitbox_value(AT_FSTRONG, 2, HG_DAMAGE, final_dmg);
        set_hitbox_value(AT_FSTRONG, 2, HG_BASE_KNOCKBACK, final_bkb);
        set_hitbox_value(AT_FSTRONG, 2, HG_KNOCKBACK_SCALING, final_kbs);
        set_hitbox_value(AT_FSTRONG, 2, HG_BASE_HITPAUSE, final_bhp);
    }

    if (window == 2 && window_timer == 1) {
        overcharge_warning = false;
        fstrong_up_timer = 0;
        fstrong_fatigue++;
        fstrong_fatigue_timer = 210; // 3.5 seconds to recover from fatigue
        if (fstrong_fatigue >= 5) {
            fstrong_lockout = 330; // 5.5 seconds lockout!
            fstrong_fatigue = 0;
        }
    }
}

// attack_update is a script called when you're doing an attack. It runs for every in-game frame.
// B - Reversals
if (attack == AT_NSPECIAL || attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
    trigger_b_reverse();
}

// Up Special: Ghost Form Flight Recovery (steered with directional inputs)
if (attack == AT_USPECIAL) {
    if (window == 1) {
        hsp = 0;
        vsp = 0;
    }
    if (window == 2) {
        var dx = (right_down - left_down);
        var dy = (down_down - up_down);
        if (dx == 0 && dy == 0) {
            // No direction held: catch herself and float in place
            hsp = 0;
            vsp = 0;
        } else {
            var fly_dir = point_direction(0, 0, dx, dy);
            hsp = lengthdir_x(7.5, fly_dir);
            vsp = lengthdir_y(7.5, fly_dir);
            if (dx != 0) {
                spr_dir = dx;
            }
        }
    }
    if (window == 3 && window_timer == 1) {
        hsp *= 0.5;
        vsp *= 0.5;
        move_cooldown[AT_USPECIAL] = 30;
    }

    // On-hit aerial cancel: After hitting someone with Up Special, Pink can cancel into any aerial attack (except DAir)!
    if (has_hit) {
        can_fast_fall = true;
        var do_cancel = false;
        var target_atk = noone;

        if (up_down || up_stick_pressed) {
            if (attack_pressed || up_stick_pressed) {
                target_atk = AT_UAIR;
                do_cancel = true;
            }
        } else if (down_down || down_stick_pressed) {
            // DAir cancel is disallowed as requested
            do_cancel = false;
        } else if ((spr_dir == 1 && (right_down || right_stick_pressed)) || (spr_dir == -1 && (left_down || left_stick_pressed))) {
            if (attack_pressed || right_stick_pressed || left_stick_pressed) {
                target_atk = AT_FAIR;
                do_cancel = true;
            }
        } else if ((spr_dir == 1 && (left_down || left_stick_pressed)) || (spr_dir == -1 && (right_down || right_stick_pressed))) {
            if (attack_pressed || right_stick_pressed || left_stick_pressed) {
                target_atk = AT_BAIR;
                do_cancel = true;
            }
        } else if (attack_pressed) {
            target_atk = AT_NAIR;
            do_cancel = true;
        }

        if (do_cancel && target_atk != noone) {
            attack_end();
            destroy_hitboxes();
            set_attack(target_atk);
        }
    }
}

if (attack == AT_DSPECIAL) {
    // Only spawn the (non-damaging) dummy article on the ground. In the air it just fell out of
    // her model as a visual bug; the real damaging dummy is the DSpecial projectile hitbox.
    if (attack == AT_DSPECIAL && window == 2 && !dummy_spawned && !free) {
        dummy_spawned = true;
        fan_cooldown = 120;

        var dummy = instance_create(x, y, "obj_article1");
        dummy.player_id = id;      // Thats you
        dummy.team = team;          // Thats your friends
        dummy.lifetime = 300;
        dummy.hsp = 5 * spr_dir;
        dummy.vsp = -2;
        dummy.homing = true;
        dummy.homing_speed = 6;
        dummy.return_timer = 30;
        dummy.enemy = noone;
        move_cooldown[AT_DSPECIAL] = 120;
    } else {
        move_cooldown[AT_DSPECIAL] = 120;
        fan_cooldown = 120;
    }
}

if (attack == AT_FSPECIAL) {
    if (attack == AT_FSPECIAL && window == 2 && !ghost_spawned) {
        ghost_spawned = true;
        ghost_cooldown = 180;

        var ghost = instance_create(x, y, "obj_article2");
        ghost.player_id = id;      // Thats you
        ghost.team = team;          // Thats your friends
        ghost.lifetime = 300;
        ghost.hsp = 5 * spr_dir;
        ghost.vsp = -2;
        ghost.homing = true;
        ghost.homing_speed = 6;
        ghost.return_timer = 30;
        ghost.enemy = noone;
        move_cooldown[AT_FSPECIAL] = 180;
    } else {
        move_cooldown[AT_FSPECIAL] = 180;
        ghost_cooldown = 180;
    }
}

if (attack == AT_NSPECIAL) {
    // Allows throwing 2-3 kitties while they bounce across the stage
    move_cooldown[AT_NSPECIAL] = 16;
    if (window == 2 && window_timer == 1) {
        nspecial_up_timer = 0;
        nspecial_fatigue++;
        nspecial_fatigue_timer = 210; // 3.5 seconds to recover from fatigue
        if (nspecial_fatigue >= 5) {
            nspecial_lockout = 330; // 5.5 seconds lockout!
            nspecial_fatigue = 0;
        }
    }
}

// =============================================================================
// Aerial Bomb Smashes: Air Down Smash (AT_DSTRONG) & Air Left/Right Smash (AT_FSTRONG)
// Glides through the air with gravity & momentum (instead of stopping mid-air)!
// Air Down Smash bomb grows larger and larger as charged, deals more damage,
// flashes when about to overcharge, and hurts Pink if charged too long!
// =============================================================================
if ((attack == AT_DSTRONG || (attack == AT_FSTRONG && get_attack_value(AT_FSTRONG, AG_NUM_WINDOWS) == 4)) && (free || get_attack_value(attack, AG_CATEGORY) == 2)) {
    can_fast_fall = false;
    can_move = false;

    // Smooth aerial gliding in the direction she was moving (with slight steering & reduced gravity)
    var glide_dir = (right_down - left_down);
    if (glide_dir != 0) {
        hsp = clamp(hsp + glide_dir * 0.14, -air_max_speed * 0.9, air_max_speed * 0.9);
    }
    hsp *= 0.992;
    if (vsp > 6.2) {
        vsp = 6.2;
    }

    // Fortify Pink during aerial windup: soft armor against pokes, super armor while actively charging!
    if (window == 1) {
        if (air_charge_timer > 0) {
            super_armor = true;
        } else {
            soft_armor = 12;
        }
    } else {
        super_armor = false;
        soft_armor = 0;
    }

    var w_len = get_window_value(attack, 1, AG_WINDOW_LENGTH);
    if (window == 1 && window_timer >= w_len - 2) {
        var holding_charge = (strong_down || down_strong_down || left_strong_down || right_strong_down || attack_down || down_stick_down || left_stick_down || right_stick_down);
        if (attack == AT_DSTRONG) {
            if (holding_charge) {
                air_charge_timer++;
                pink_charge_timer = air_charge_timer;
                strong_charge = min(58, floor(air_charge_timer * 58 / 60));
                window_timer = w_len - 2;

                // Growing bomb stages (0 -> 1 -> 2 -> 3) with smooth scale flow:
                if (air_charge_timer < 15) {
                    dstrong_bomb_stage = 0;
                    dstrong_bomb_scale = lerp(1.0, 1.15, air_charge_timer / 15);
                } else if (air_charge_timer < 32) {
                    if (dstrong_bomb_stage < 1) {
                        dstrong_bomb_stage = 1;
                        sound_play(sound_get("snd_bump"));
                    }
                    dstrong_bomb_scale = lerp(0.95, 1.12, (air_charge_timer - 15) / 17);
                } else if (air_charge_timer < 48) {
                    if (dstrong_bomb_stage < 2) {
                        dstrong_bomb_stage = 2;
                        sound_play(sound_get("snd_bump"));
                    }
                    dstrong_bomb_scale = lerp(0.96, 1.10, (air_charge_timer - 32) / 16);
                } else {
                    if (dstrong_bomb_stage < 3) {
                        dstrong_bomb_stage = 3;
                        sound_play(sound_get("snd_bump"));
                    }
                    dstrong_bomb_scale = 1.06 + sin(air_charge_timer * 0.6) * 0.07;
                }

                // Warning flash before overcharging (frames 50..78)
                if (air_charge_timer >= 50) {
                    overcharge_warning = true;
                    if (air_charge_timer == 50 || air_charge_timer == 62 || air_charge_timer == 70) {
                        sound_play(sound_get("snd_noise"));
                    }
                }

                // Charged for too long (frame 78): Bomb explodes on Pink and shows the hurt sprite!
                if (air_charge_timer >= 78) {
                    overcharge_warning = false;
                    overcharge_hurt_timer = 36;
                    char_height = 52;
                    take_damage(player, -1, 10);
                    vsp = -3.5;
                    hsp = -2.0 * spr_dir;
                    sound_play(sound_get("snd_bomb"));
                    sound_play(sound_get("snd_hurt1"));
                    sound_play(sound_get("heart_electric"));
                    spawn_hit_fx(x, y - 100, 304);
                    exit;
                }
            } else {
                overcharge_warning = false;
                strong_charge = round(clamp(air_charge_timer / 60, 0, 1) * 60);
                window = 2;
                window_timer = 0;
            }
        } else {
            // Air Left / Right Smash (AT_FSTRONG)
            if (holding_charge && air_charge_timer < 60) {
                air_charge_timer++;
                pink_charge_timer = air_charge_timer;
                strong_charge = min(60, air_charge_timer);
                window_timer = w_len - 2;
            }
        }
    }

    // Dynamic charge scaling for Air Smashes (larger hitbox & higher damage for growing Air DStrong bomb!)
    if (window <= 2) {
        var charge_ratio = clamp(air_charge_timer / 60, 0, 1);
        if (attack == AT_FSTRONG) {
            var scaled_dmg = round(lerp(7, 14, charge_ratio));
            var scaled_kbs = lerp(0.68, 0.90, charge_ratio);
            set_hitbox_value(AT_FSTRONG, 1, HG_DAMAGE, scaled_dmg);
            set_hitbox_value(AT_FSTRONG, 1, HG_KNOCKBACK_SCALING, scaled_kbs);
            set_hitbox_value(AT_FSTRONG, 2, HG_DAMAGE, scaled_dmg);
            set_hitbox_value(AT_FSTRONG, 2, HG_KNOCKBACK_SCALING, scaled_kbs);
        } else if (attack == AT_DSTRONG) {
            var scaled_dmg = round(lerp(9, 22, charge_ratio));
            var scaled_bkb = lerp(7.2, 9.0, charge_ratio);
            var scaled_kbs = lerp(0.88, 1.20, charge_ratio);
            var body_w = round(lerp(58, 114, charge_ratio));
            var body_h = round(lerp(76, 120, charge_ratio));
            var wave_w = round(lerp(198, 260, charge_ratio));
            var wave_h = round(lerp(54, 86, charge_ratio));

            set_hitbox_value(AT_DSTRONG, 1, HG_DAMAGE, scaled_dmg);
            set_hitbox_value(AT_DSTRONG, 1, HG_BASE_KNOCKBACK, scaled_bkb);
            set_hitbox_value(AT_DSTRONG, 1, HG_KNOCKBACK_SCALING, scaled_kbs);
            set_hitbox_value(AT_DSTRONG, 1, HG_WIDTH, body_w);
            set_hitbox_value(AT_DSTRONG, 1, HG_HEIGHT, body_h);

            set_hitbox_value(AT_DSTRONG, 2, HG_DAMAGE, scaled_dmg);
            set_hitbox_value(AT_DSTRONG, 2, HG_BASE_KNOCKBACK, scaled_bkb);
            set_hitbox_value(AT_DSTRONG, 2, HG_KNOCKBACK_SCALING, scaled_kbs);
            set_hitbox_value(AT_DSTRONG, 2, HG_WIDTH, wave_w);
            set_hitbox_value(AT_DSTRONG, 2, HG_HEIGHT, wave_h);
        }
    }

    if (window <= 3) {
        char_height = 120;
    } else {
        char_height = 52;
    }
    if (window == get_attack_value(attack, AG_NUM_WINDOWS)
        && window_timer >= get_window_value(attack, window, AG_WINDOW_LENGTH) - 1) {
        char_height = 52;
        super_armor = false;
        soft_armor = 0;
        overcharge_warning = false;
    }
}

// =============================================================================
// Ground Up Smash (AT_USTRONG):
// As she charges, 1 cat shows up -> 2nd cat right next to it -> 3rd cat right next to it!
// Launches all 3 cats at 100%, 75%, and 50% height (base 17 dmg -> 26 dmg charged).
// Overcharging flashes and damages Pink with the shocked hurt sprite!
// =============================================================================
if (attack == AT_USTRONG) {
    var u_w1_len = get_window_value(AT_USTRONG, 1, AG_WINDOW_LENGTH);
    if (window == 1 && window_timer >= u_w1_len - 2) {
        var holding_ustrong = (strong_down || up_strong_down || attack_down || up_stick_down);
        if (holding_ustrong) {
            pink_charge_timer++;
            window_timer = u_w1_len - 2;
            strong_charge = min(58, floor(pink_charge_timer * 58 / 60));

            if (pink_charge_timer < 15) {
                ustrong_cat_count = 1;
            } else if (pink_charge_timer < 30) {
                if (ustrong_cat_count < 2) {
                    ustrong_cat_count = 2;
                    sound_play(sound_get("snd_bump"));
                }
            } else {
                if (ustrong_cat_count < 3) {
                    ustrong_cat_count = 3;
                    sound_play(sound_get("snd_pink_mew"));
                }
            }

            // Warning flash before overcharging (frames 48..76)
            if (pink_charge_timer >= 48) {
                overcharge_warning = true;
                if (pink_charge_timer == 48 || pink_charge_timer == 60 || pink_charge_timer == 68) {
                    sound_play(sound_get("snd_noise"));
                }
            }

            // Overcharged for too long (frame 76): damages Pink and uses the shocked hurt sprite!
            if (pink_charge_timer >= 76) {
                overcharge_warning = false;
                overcharge_hurt_timer = 36;
                take_damage(player, -1, 10);
                vsp = -3.5;
                hsp = -2.0 * spr_dir;
                sound_play(sound_get("snd_bomb"));
                sound_play(sound_get("snd_hurt1"));
                sound_play(sound_get("heart_electric"));
                spawn_hit_fx(x + 55 * spr_dir, y - 30, 304);
                exit;
            }
        } else {
            overcharge_warning = false;
            ustrong_cat_count = 3;
            strong_charge = round(clamp(pink_charge_timer / 60, 0, 1) * 60);
            window = 2;
            window_timer = 0;
        }
    }

    if (window <= 3) {
        var charge_ratio = clamp(pink_charge_timer / 60, 0, 1);
        var u_dmg = round(lerp(17, 26, charge_ratio));
        var u_bkb = lerp(8.0, 9.4, charge_ratio);
        var u_kbs = lerp(0.85, 1.15, charge_ratio);
        var u_bhp = round(lerp(9, 14, charge_ratio));

        for (var c = 1; c <= 3; c++) {
            var c_kbs = u_kbs - (c - 1) * 0.03;
            set_hitbox_value(AT_USTRONG, c, HG_DAMAGE, u_dmg);
            set_hitbox_value(AT_USTRONG, c, HG_BASE_KNOCKBACK, u_bkb);
            set_hitbox_value(AT_USTRONG, c, HG_KNOCKBACK_SCALING, c_kbs);
            set_hitbox_value(AT_USTRONG, c, HG_BASE_HITPAUSE, u_bhp);
        }
    }
}

// Ground Down Smash (snappy multi-hit splash, scales up to 9 total dmg on full charge)
if (attack == AT_DSTRONG && !free && get_attack_value(AT_DSTRONG, AG_CATEGORY) == 0) {
    if (window <= 2) {
        var charge_ratio = clamp(strong_charge / 60, 0, 1);
        set_hitbox_value(AT_DSTRONG, 4, HG_DAMAGE, round(lerp(3, 6, charge_ratio)));
        set_hitbox_value(AT_DSTRONG, 4, HG_KNOCKBACK_SCALING, lerp(0.82, 0.96, charge_ratio));
    }
}

// Her Down A in the air (AT_DAIR): Downward bouncing Kitty throw (NO freefall!)
if (attack == AT_DAIR && free) {
    // Fortify Pink during aerial Kitty charge:
    if (window == 1) {
        if (air_charge_timer > 0) {
            super_armor = true;
        } else {
            soft_armor = 12;
        }
    } else {
        super_armor = false;
        soft_armor = 0;
    }

    var dair_w1_len = get_window_value(AT_DAIR, 1, AG_WINDOW_LENGTH);
    if (window == 1 && window_timer == dair_w1_len - 1) {
        if ((attack_down || strong_down || down_strong_down || down_stick_down) && air_charge_timer < 45) {
            air_charge_timer++;
            strong_charge = min(60, air_charge_timer);
            window_timer = dair_w1_len - 2;
        }
    }
    // Scale Down A Kitty damage with charge (base 6 dmg with +1% buff, up to 9 dmg)
    if (window == 2 && window_timer == 1) {
        var bonus_dmg = floor(air_charge_timer / 15);
        set_hitbox_value(AT_DAIR, 1, HG_DAMAGE, 6 + bonus_dmg);
    }
    if (window == get_attack_value(AT_DAIR, AG_NUM_WINDOWS)
        && window_timer >= get_window_value(AT_DAIR, window, AG_WINDOW_LENGTH) - 1) {
        super_armor = false;
        soft_armor = 0;
        // Freefall (PS_PRATFALL) removed as requested!
    }
}

// Taunt handling: Down Taunt (AT_TAUNT_2 or Down + AT_TAUNT) uses tongue expression with snd_pink_gasp; Neutral, Up, Left, Right laugh (AT_TAUNT)
if (attack == AT_TAUNT_2 || (attack == AT_TAUNT && is_down_taunt)) {
    sprite_index = sprite_get("Pink_overworld_toungue");
    image_index = 0;
    can_jump = (window >= 2);
    can_shield = (window >= 2);
    if (window == 1 && window_timer == 1) {
        sound_stop(sound_get("pink_laugh1"));
        sound_play(sound_get("snd_pink_gasp"));
    }
    if (window == 2 && (down_down || down_stick_down || taunt_down)) {
        if (window_timer >= get_window_value(attack, window, AG_WINDOW_LENGTH) - 1) {
            window_timer = 0;
        }
    }
    if (window == 3 && window_timer >= get_window_value(attack, window, AG_WINDOW_LENGTH) - 1) {
        is_down_taunt = false;
    }
} else if (attack == AT_TAUNT) {
    sprite_index = sprite_get("taunt");
    if (window == 1 && window_timer == 1) {
        sound_stop(sound_get("snd_pink_gasp"));
        sound_play(sound_get("pink_laugh1"));
    }
}

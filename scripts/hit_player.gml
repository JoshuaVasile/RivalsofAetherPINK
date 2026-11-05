// hit_player is a script that runs code when you hit an enemy player.

if (instance_exists(hit_player_obj) && !hit_player_obj.clone && hit_player_obj.player >= 1 && hit_player_obj.player <= 4) {
    var vp = hit_player_obj.player;

    // Neutral A (Kiss with Heart): Only Crits heal Pink (heal 7) and play smooch SFX
    if (my_hitboxID.attack == AT_JAB) {
        if (jab_is_crit) {
            set_player_damage(player, max(0, get_player_damage(player) - 7));
            sound_play(sound_get("smooch"));
            sound_play(sound_get("heart_electric"));
            hit_player_obj.hitstop = max(hit_player_obj.hitstop, 12);
            hitstop = max(hitstop, 12);

            heal_popup_timer = 45;
            heal_popup_amount = 7;
            heal_popup_is_crit = true;
            heal_popup_x = x;
            heal_popup_y = y - char_height - 15;
        }
    }

    // Doki Meter Building:
    var dmg_dealt = my_hitboxID.damage;

    // Tier 2 (Purple) Bonus: Pink deals +2 extra damage!
    if (doki_tier == 2) {
        take_damage(hit_player_obj.player, player, 2);
        dmg_dealt += 2;
    }

    var meter_gain = dmg_dealt;

    // Bonus meter on Kiss Critical Hit: +5%
    if (my_hitboxID.attack == AT_JAB && jab_is_crit) {
        meter_gain += 5;
    }

    // Bonus meter on Marking Hit (Dummy or Kitty): +8%
    if (my_hitboxID.attack == AT_DSPECIAL || my_hitboxID.attack == AT_NSPECIAL || my_hitboxID.attack == AT_DAIR) {
        meter_gain += 8;
    }

    // Every time she uses her ult in an individual life, it is harder to gain doki:
    var life_scale = 1.0;
    if (bb_uses_this_life == 1) life_scale = 0.7;
    else if (bb_uses_this_life == 2) life_scale = 0.5;
    else if (bb_uses_this_life >= 3) life_scale = 0.35;
    meter_gain = meter_gain * life_scale;

    if (!bb_unlocked) {
        // 3% Doki Crit Mechanic: Spend 3% Doki to have a 3% chance to crit on attacks!
        // Only active while Ultimate is NOT yet unlocked. Once Ultimate is up, this ability goes away.
        if (doki_meter >= 3 && !bb_active) {
            var crit_roll = random_func((get_gameplay_time() + hit_player_obj.player * 11) % 25, 100, true);
            if (crit_roll < 3) {
                // Spends 3% Doki meter!
                doki_meter = max(0, doki_meter - 3);

                // Deals +5 bonus crit damage and extra hitpause
                take_damage(hit_player_obj.player, player, 5);
                hit_player_obj.hitstop = max(hit_player_obj.hitstop, 12);
                hitstop = max(hitstop, 10);
                sound_play(sound_get("heart_electric"));
                sound_play(sound_get("snd_pink_coin"));

                heal_popup_timer = 40;
                heal_popup_amount = 0;
                heal_popup_is_crit = true;
                heal_popup_x = hit_player_obj.x;
                heal_popup_y = hit_player_obj.y - hit_player_obj.char_height - 15;
            }
        }

        doki_meter = min(100, doki_meter + meter_gain);
        if (doki_meter >= 100) {
            doki_meter = 100;
            bb_unlocked = true;
            bb_cooldown = 0;
            doki_tier = 3;
            sound_play(sound_get("heart_electric"));
        }
    }

    // Record Dummy hit (AT_DSPECIAL) or Kitty hit (AT_NSPECIAL / AT_DAIR) when Battle Box is unlocked
    if (!bb_active && bb_unlocked) {
        if (my_hitboxID.attack == AT_DSPECIAL) {
            bb_dummy_hit_timer[vp] = bb_quick_window;
            sound_play(sound_get("sfx_mark"));
        }
        if (my_hitboxID.attack == AT_NSPECIAL || my_hitboxID.attack == AT_DAIR) {
            bb_kitty_hit_timer[vp] = bb_quick_window;
            sound_play(sound_get("sfx_mark"));
        }
    }

    // Trigger Deltarune Battle Box when the same opponent is hit by both Dummy and Kitty in quick succession!
    if (!bb_active && bb_unlocked && bb_dummy_hit_timer[vp] > 0 && bb_kitty_hit_timer[vp] > 0) {
        bb_dummy_hit_timer[vp] = 0;
        bb_kitty_hit_timer[vp] = 0;

        // Consumes Doki Meter!
        doki_meter = 0;
        bb_unlocked = false;
        doki_tier = 1;
        bb_used_once = true;
        bb_uses_this_life++;

        bb_active = true;
        bb_timer = 0;
        bb_hits_taken = 0;
        bb_mode = bb_next_mode;
        bb_next_mode = (bb_next_mode == 1) ? 2 : 1;
        bb_max_time = (bb_mode == 1) ? 340 : 350; // 1.5 seconds (90 frames) longer than before
        bb_victim = hit_player_obj;

        // Place the Battle Box in front of Pink and higher up above the stage floor
        bb_box_x = x + 110 * spr_dir;
        bb_box_y = y - 125;
        var stg_l = get_stage_data(SD_X_POS) + 155;
        var stg_r = get_stage_data(SD_X_POS) + get_stage_data(SD_WIDTH) - 155;
        var stg_floor = get_stage_data(SD_Y_POS) - 125;
        var stg_ceil = get_stage_data(SD_Y_POS) - get_stage_data(SD_TOP_BLASTZONE) + 150;
        if (stg_r > stg_l) {
            bb_box_x = clamp(bb_box_x, stg_l, stg_r);
        }
        if (stg_floor > stg_ceil) {
            bb_box_y = clamp(bb_box_y, stg_ceil, stg_floor);
        }

        // Initialize Purple Soul Heart in the box
        bb_soul_lane = 1;
        bb_soul_prev_y = 0;
        bb_soul_trail_timer = 0;
        bb_soul_gx = 1;
        bb_soul_gy = 1;
        if (bb_mode == 1) {
            bb_soul_x = 0;
            bb_soul_y = 0;
        } else {
            bb_soul_x = -39;
            bb_soul_y = -31;
        }
        bb_soul_move_cd = 0;
        bb_soul_invuln = 20;
        bb_objects = [];
        bb_spawned_count = 0;

        // Protect Pink during cutscene, play snd_pink_coin + laugh, and have Pink taunt while the box loads!
        invincible_timer = 360;
        hit_player_obj.invincible = false;
        hit_player_obj.invincible_timer = 0;
        hsp = 0;
        vsp = 0;
        set_attack(AT_TAUNT);
        sound_play(sound_get("snd_pink_coin"));
        sound_play(sound_get("pink_laugh1"));
    }
}

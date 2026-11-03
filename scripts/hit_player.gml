// hit_player is a script that runs code when you hit an enemy player.

if (instance_exists(hit_player_obj) && !hit_player_obj.clone && hit_player_obj.player >= 1 && hit_player_obj.player <= 4) {
    var vp = hit_player_obj.player;

    // Neutral A (Kiss with Heart): Only Crits heal Pink (10 damage) and play smooch SFX
    if (my_hitboxID.attack == AT_JAB) {
        if (jab_is_crit) {
            set_player_damage(player, max(0, get_player_damage(player) - 10));
            sound_play(sound_get("smooch"));
            sound_play(sound_get("heart_electric"));
            hit_player_obj.hitstop = max(hit_player_obj.hitstop, 12);
            hitstop = max(hitstop, 12);

            heal_popup_timer = 45;
            heal_popup_amount = 10;
            heal_popup_is_crit = true;
            heal_popup_x = x;
            heal_popup_y = y - char_height - 15;
        }
    }

    // Record Dummy hit (AT_DSPECIAL) or Kitty Musical Note hit (AT_NSPECIAL) when Battle Box is off cooldown
    if (!bb_active && bb_cooldown <= 0) {
        if (my_hitboxID.attack == AT_DSPECIAL) {
            bb_dummy_hit_timer[vp] = bb_quick_window;
            sound_play(sound_get("sfx_mark"));
        }
        if (my_hitboxID.attack == AT_NSPECIAL) {
            bb_kitty_hit_timer[vp] = bb_quick_window;
            sound_play(sound_get("sfx_mark"));
        }
    }

    // Trigger Deltarune Battle Box when the same opponent is hit by both Dummy and Kitty in quick succession!
    if (!bb_active && bb_cooldown <= 0 && bb_dummy_hit_timer[vp] > 0 && bb_kitty_hit_timer[vp] > 0) {
        bb_dummy_hit_timer[vp] = 0;
        bb_kitty_hit_timer[vp] = 0;

        bb_active = true;
        bb_timer = 0;
        bb_mode = bb_next_mode;
        bb_next_mode = (bb_next_mode == 1) ? 2 : 1;
        bb_max_time = (bb_mode == 1) ? 250 : 260;
        bb_victim = hit_player_obj;

        // Place the Battle Box in front of Pink and higher up above the stage floor
        bb_box_x = x + 110 * spr_dir;
        bb_box_y = y - 125;
        var stg_l = get_stage_data(SD_X_POS) + 130;
        var stg_r = get_stage_data(SD_X_POS) + get_stage_data(SD_WIDTH) - 130;
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
            bb_soul_x = -31;
            bb_soul_y = -31;
        }
        bb_soul_move_cd = 0;
        bb_soul_invuln = 20;
        bb_objects = [];
        bb_spawned_count = 0;

        // Protect both players, play snd_pink_coin + laugh, and have Pink taunt while the box loads!
        invincible_timer = 270;
        hit_player_obj.invincible_timer = 270;
        hsp = 0;
        vsp = 0;
        set_attack(AT_TAUNT);
        sound_play(sound_get("snd_pink_coin"));
        sound_play(sound_get("pink_laugh1"));
    }
}

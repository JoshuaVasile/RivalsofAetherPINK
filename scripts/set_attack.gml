// set_attack runs frame 0 of any attack.

air_charge_timer = 0;
super_armor = false;
soft_armor = 0;

// Optional Forward Tilt to Kiss redirection:
if (attack == AT_FTILT && kiss_on_forward_tilt) {
    attack = AT_JAB;
}

// In the air, distinguish Air Down Smash vs Her Down A:
if (free) {
    if (attack == AT_DAIR) {
        if (down_strong_pressed || strong_pressed || strong_down) {
            attack = AT_DSTRONG; // Air Down Smash (Charged Bomb dropping down)
        }
    }
}

// Down Smash configuration: Grounded = Down Cry; Aerial = Charged Bomb dropping downward that spikes
if (attack == AT_DSTRONG) {
    if (free) {
        // Air Down Smash: Charged bomb, downward spike, 7 damage (70% less than 24)
        set_attack_value(AT_DSTRONG, AG_CATEGORY, 1);
        set_attack_value(AT_DSTRONG, AG_SPRITE, sprite_get("dstrong"));
        set_attack_value(AT_DSTRONG, AG_AIR_SPRITE, sprite_get("dstrong"));
        set_attack_value(AT_DSTRONG, AG_NUM_WINDOWS, 5);
        set_attack_value(AT_DSTRONG, AG_HAS_LANDING_LAG, 1);
        set_attack_value(AT_DSTRONG, AG_LANDING_LAG, 8);
        set_attack_value(AT_DSTRONG, AG_STRONG_CHARGE_WINDOW, 1);
        set_attack_value(AT_DSTRONG, AG_HURTBOX_SPRITE, sprite_get("dstrong_hurt"));
        set_attack_value(AT_DSTRONG, AG_HURTBOX_AIR_SPRITE, sprite_get("dstrong_hurt"));
        set_attack_value(AT_DSTRONG, AG_USES_CUSTOM_GRAVITY, 1);

        set_window_value(AT_DSTRONG, 1, AG_WINDOW_LENGTH, 14);
        set_window_value(AT_DSTRONG, 1, AG_WINDOW_ANIM_FRAMES, 7);
        set_window_value(AT_DSTRONG, 1, AG_WINDOW_ANIM_FRAME_START, 2);
        set_window_value(AT_DSTRONG, 1, AG_WINDOW_CUSTOM_GRAVITY, 0);
        set_window_value(AT_DSTRONG, 1, AG_WINDOW_HAS_SFX, 1);
        set_window_value(AT_DSTRONG, 1, AG_WINDOW_SFX, sound_get("snd_bombfall"));

        set_window_value(AT_DSTRONG, 2, AG_WINDOW_LENGTH, 6);
        set_window_value(AT_DSTRONG, 2, AG_WINDOW_ANIM_FRAMES, 2);
        set_window_value(AT_DSTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 11);
        set_window_value(AT_DSTRONG, 2, AG_WINDOW_CUSTOM_GRAVITY, 0);
        set_window_value(AT_DSTRONG, 2, AG_WINDOW_HAS_SFX, 1);
        set_window_value(AT_DSTRONG, 2, AG_WINDOW_SFX, sound_get("snd_bomb"));

        set_window_value(AT_DSTRONG, 3, AG_WINDOW_LENGTH, 6);
        set_window_value(AT_DSTRONG, 3, AG_WINDOW_ANIM_FRAMES, 2);
        set_window_value(AT_DSTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 13);
        set_window_value(AT_DSTRONG, 3, AG_WINDOW_CUSTOM_GRAVITY, 0);

        set_window_value(AT_DSTRONG, 4, AG_WINDOW_LENGTH, 10);
        set_window_value(AT_DSTRONG, 4, AG_WINDOW_ANIM_FRAMES, 5);
        set_window_value(AT_DSTRONG, 4, AG_WINDOW_ANIM_FRAME_START, 15);
        set_window_value(AT_DSTRONG, 4, AG_WINDOW_CUSTOM_GRAVITY, 0);
        set_window_value(AT_DSTRONG, 4, AG_WINDOW_HAS_WHIFFLAG, 1);

        set_window_value(AT_DSTRONG, 5, AG_WINDOW_LENGTH, 2);
        set_window_value(AT_DSTRONG, 5, AG_WINDOW_ANIM_FRAMES, 1);
        set_window_value(AT_DSTRONG, 5, AG_WINDOW_ANIM_FRAME_START, 19);
        set_window_value(AT_DSTRONG, 5, AG_WINDOW_CUSTOM_GRAVITY, 0);

        set_num_hitboxes(AT_DSTRONG, 1);

        set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_TYPE, 1);
        set_hitbox_value(AT_DSTRONG, 1, HG_WINDOW, 3);
        set_hitbox_value(AT_DSTRONG, 1, HG_LIFETIME, 6);
        set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_X, 0);
        set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_Y, -10);
        set_hitbox_value(AT_DSTRONG, 1, HG_WIDTH, 48);
        set_hitbox_value(AT_DSTRONG, 1, HG_HEIGHT, 56);
        set_hitbox_value(AT_DSTRONG, 1, HG_SHAPE, 2);
        set_hitbox_value(AT_DSTRONG, 1, HG_PRIORITY, 3);
        set_hitbox_value(AT_DSTRONG, 1, HG_DAMAGE, 7);
        set_hitbox_value(AT_DSTRONG, 1, HG_ANGLE, 270);
        set_hitbox_value(AT_DSTRONG, 1, HG_BASE_KNOCKBACK, 7);
        set_hitbox_value(AT_DSTRONG, 1, HG_KNOCKBACK_SCALING, 0.95);
        set_hitbox_value(AT_DSTRONG, 1, HG_BASE_HITPAUSE, 12);
        set_hitbox_value(AT_DSTRONG, 1, HG_HITPAUSE_SCALING, 0.7);
        set_hitbox_value(AT_DSTRONG, 1, HG_HITSTUN_MULTIPLIER, 0.8);
        set_hitbox_value(AT_DSTRONG, 1, HG_VISUAL_EFFECT, 304);
        set_hitbox_value(AT_DSTRONG, 1, HG_VISUAL_EFFECT_Y_OFFSET, -2);
        set_hitbox_value(AT_DSTRONG, 1, HG_HIT_SFX, sound_get("snd_hurt1"));
        set_hitbox_value(AT_DSTRONG, 1, HG_ANGLE_FLIPPER, 0);
    } else {
        // Ground Down Smash: Down Cry (multi-hit splash, 5 total dmg)
        set_attack_value(AT_DSTRONG, AG_CATEGORY, 0);
        set_attack_value(AT_DSTRONG, AG_SPRITE, sprite_get("dstrong_cry"));
        set_attack_value(AT_DSTRONG, AG_AIR_SPRITE, sprite_get("dstrong_cry"));
        set_attack_value(AT_DSTRONG, AG_NUM_WINDOWS, 3);
        set_attack_value(AT_DSTRONG, AG_HAS_LANDING_LAG, 3);
        set_attack_value(AT_DSTRONG, AG_STRONG_CHARGE_WINDOW, 1);
        set_attack_value(AT_DSTRONG, AG_HURTBOX_SPRITE, sprite_get("dstrong_cry_hurt"));
        set_attack_value(AT_DSTRONG, AG_HURTBOX_AIR_SPRITE, sprite_get("dstrong_cry_hurt"));
        set_attack_value(AT_DSTRONG, AG_USES_CUSTOM_GRAVITY, 0);

        set_window_value(AT_DSTRONG, 1, AG_WINDOW_LENGTH, 10);
        set_window_value(AT_DSTRONG, 1, AG_WINDOW_ANIM_FRAMES, 2);
        set_window_value(AT_DSTRONG, 1, AG_WINDOW_ANIM_FRAME_START, 0);
        set_window_value(AT_DSTRONG, 1, AG_WINDOW_CUSTOM_GRAVITY, 0);
        set_window_value(AT_DSTRONG, 1, AG_WINDOW_HAS_SFX, 0);

        set_window_value(AT_DSTRONG, 2, AG_WINDOW_LENGTH, 20);
        set_window_value(AT_DSTRONG, 2, AG_WINDOW_ANIM_FRAMES, 6);
        set_window_value(AT_DSTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 2);
        set_window_value(AT_DSTRONG, 2, AG_WINDOW_CUSTOM_GRAVITY, 0);
        set_window_value(AT_DSTRONG, 2, AG_WINDOW_HAS_SFX, 1);
        set_window_value(AT_DSTRONG, 2, AG_WINDOW_SFX, sound_get("snd_pink_gasp"));
        set_window_value(AT_DSTRONG, 2, AG_WINDOW_SFX_FRAME, 1);

        set_window_value(AT_DSTRONG, 3, AG_WINDOW_LENGTH, 14);
        set_window_value(AT_DSTRONG, 3, AG_WINDOW_ANIM_FRAMES, 2);
        set_window_value(AT_DSTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 8);
        set_window_value(AT_DSTRONG, 3, AG_WINDOW_CUSTOM_GRAVITY, 0);
        set_window_value(AT_DSTRONG, 3, AG_WINDOW_HAS_WHIFFLAG, 1);

        set_num_hitboxes(AT_DSTRONG, 4);

        for (var h = 1; h <= 4; h++) {
            set_hitbox_value(AT_DSTRONG, h, HG_HITBOX_TYPE, 1);
            set_hitbox_value(AT_DSTRONG, h, HG_HITBOX_GROUP, -1);
            set_hitbox_value(AT_DSTRONG, h, HG_WINDOW, 2);
            set_hitbox_value(AT_DSTRONG, h, HG_WINDOW_CREATION_FRAME, h * 4);
            set_hitbox_value(AT_DSTRONG, h, HG_LIFETIME, 4);
            set_hitbox_value(AT_DSTRONG, h, HG_HITBOX_X, 0);
            set_hitbox_value(AT_DSTRONG, h, HG_HITBOX_Y, -26);
            set_hitbox_value(AT_DSTRONG, h, HG_WIDTH, 104);
            set_hitbox_value(AT_DSTRONG, h, HG_HEIGHT, 48);
            set_hitbox_value(AT_DSTRONG, h, HG_SHAPE, 2);
            set_hitbox_value(AT_DSTRONG, h, HG_PRIORITY, 2);
            set_hitbox_value(AT_DSTRONG, h, HG_DAMAGE, (h == 4) ? 2 : 1);
            set_hitbox_value(AT_DSTRONG, h, HG_ANGLE, (h == 4) ? 65 : 110);
            set_hitbox_value(AT_DSTRONG, h, HG_BASE_KNOCKBACK, (h == 4) ? 7.5 : 4);
            set_hitbox_value(AT_DSTRONG, h, HG_KNOCKBACK_SCALING, (h == 4) ? 0.85 : 0);
            set_hitbox_value(AT_DSTRONG, h, HG_BASE_HITPAUSE, (h == 4) ? 9 : 4);
            set_hitbox_value(AT_DSTRONG, h, HG_HITPAUSE_SCALING, (h == 4) ? 0.45 : 0);
            set_hitbox_value(AT_DSTRONG, h, HG_EXTRA_HITPAUSE, 4);
            set_hitbox_value(AT_DSTRONG, h, HG_VISUAL_EFFECT, 28);
            set_hitbox_value(AT_DSTRONG, h, HG_VISUAL_EFFECT_Y_OFFSET, 8);
            set_hitbox_value(AT_DSTRONG, h, HG_HIT_SFX, (h == 4) ? sound_get("snd_damage") : sound_get("snd_hurt1"));
            set_hitbox_value(AT_DSTRONG, h, HG_ANGLE_FLIPPER, (h == 4) ? 6 : 7);
        }
    }
}

// Aerial Left & Right Bomb Smash: face the direction pressed (Left or Right) so she drops the bomb to that side
if (attack == AT_FAIR || attack == AT_BAIR) {
    if (left_down || left_strong_pressed || left_stick_down) {
        spr_dir = -1;
    } else if (right_down || right_strong_pressed || right_stick_down) {
        spr_dir = 1;
    } else if (attack == AT_BAIR) {
        spr_dir *= -1;
    }
    attack = AT_FAIR;
}

// Neutral A (Kiss with Heart): Roll for Crit (10% chance) and apply corresponding hitbox stats
if (attack == AT_JAB) {
    var crit_roll = random_func((get_gameplay_time() + player * 7) % 25, 100, true);
    jab_is_crit = (crit_roll < jab_crit_chance);

    if (jab_is_crit) {
        set_hitbox_value(AT_JAB, 1, HG_DAMAGE, 10);
        set_hitbox_value(AT_JAB, 1, HG_BASE_KNOCKBACK, 7);
        set_hitbox_value(AT_JAB, 1, HG_KNOCKBACK_SCALING, 0.5);
        set_hitbox_value(AT_JAB, 1, HG_BASE_HITPAUSE, 10);
        set_hitbox_value(AT_JAB, 1, HG_HITPAUSE_SCALING, 0.6);
        set_hitbox_value(AT_JAB, 1, HG_HIT_SFX, sound_get("heart_electric"));
        set_hitbox_value(AT_JAB, 1, HG_VISUAL_EFFECT, 304);
    } else {
        set_hitbox_value(AT_JAB, 1, HG_DAMAGE, 4);
        set_hitbox_value(AT_JAB, 1, HG_BASE_KNOCKBACK, 4);
        set_hitbox_value(AT_JAB, 1, HG_KNOCKBACK_SCALING, 0);
        set_hitbox_value(AT_JAB, 1, HG_BASE_HITPAUSE, 6);
        set_hitbox_value(AT_JAB, 1, HG_HITPAUSE_SCALING, 0);
        set_hitbox_value(AT_JAB, 1, HG_HIT_SFX, sound_get("snd_hurt1"));
        set_hitbox_value(AT_JAB, 1, HG_VISUAL_EFFECT, 0);
    }
}

// Taunts:
// Down Taunt (holding Down on stick/c-stick, or crouching) = tongue out with snd_pink_gasp.
// Up, Left, Right, and Neutral taunts = laughing taunt.
if (attack == AT_TAUNT || attack == AT_TAUNT_2) {
    var has_down = (attack == AT_TAUNT_2 || down_down || down_pressed || down_stick_down || down_hard_pressed || state == PS_CROUCH || is_down_taunt);
    if (up_down || (!down_down && !down_pressed && !down_stick_down && state != PS_CROUCH && !is_down_taunt)) {
        has_down = false;
    }
    is_down_taunt = has_down;
    attack = AT_TAUNT;
}

user_event(13);

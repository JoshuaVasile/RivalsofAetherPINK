// X Kitty (NSpecial): anti-spam scaling, smaller sizes, 5 casts before 5.5-second lockout
if (attack == AT_NSPECIAL) {
    if (nspecial_lockout > 0) {
        nspecial_hud_nudge = 8;
        attack = AT_NO_ATTACK;
    } else {
        // Base damage starts at 5 and steps down by 1 per consecutive cast (5 -> 4 -> 3 -> 2 -> 1)
        var k_dmg = 5;
        var k_w = 50;
        var k_h = 44;
        var k_spr = sprite_get("cat");
        if (nspecial_fatigue == 1) {
            k_dmg = 4;
            k_w = 50;
            k_h = 44;
            k_spr = sprite_get("cat");
        } else if (nspecial_fatigue == 2) {
            k_dmg = 3;
            k_w = 36;
            k_h = 32;
            k_spr = sprite_get("cat_small");
        } else if (nspecial_fatigue == 3) {
            k_dmg = 2;
            k_w = 28;
            k_h = 25;
            k_spr = sprite_get("cat_tiny");
        } else if (nspecial_fatigue >= 4) {
            k_dmg = 1;
            k_w = 24;
            k_h = 22;
            k_spr = sprite_get("cat_tiny");
        }
        set_hitbox_value(AT_NSPECIAL, 1, HG_DAMAGE, k_dmg);
        set_hitbox_value(AT_NSPECIAL, 1, HG_WIDTH, k_w);
        set_hitbox_value(AT_NSPECIAL, 1, HG_HEIGHT, k_h);
        set_hitbox_value(AT_NSPECIAL, 1, HG_PROJECTILE_SPRITE, k_spr);
        set_hitbox_value(AT_NSPECIAL, 1, HG_PROJECTILE_MASK, k_spr);
    }
}

// set_attack runs frame 0 of any attack.

air_charge_timer = 0;
super_armor = false;
soft_armor = 0;

// Optional Forward Tilt to Kiss redirection:
if (attack == AT_FTILT && kiss_on_forward_tilt) {
    attack = AT_JAB;
}

// In the air, distinguish Aerial Attacks vs Aerial Strongs:
if (free) {
    if (attack == AT_DAIR) {
        if (down_strong_pressed || strong_pressed || strong_down) {
            attack = AT_DSTRONG; // Air Down Smash (Charged Bomb dropping down)
        }
    }
    if (attack == AT_FAIR) {
        if (right_strong_pressed || left_strong_pressed || strong_pressed || strong_down) {
            attack = AT_FSTRONG; // Air Forward Smash (Charged Bomb dropping forward)
        }
    }
    if (attack == AT_BAIR) {
        if (right_strong_pressed || left_strong_pressed || strong_pressed || strong_down) {
            spr_dir *= -1;
            attack = AT_FSTRONG; // Air Back Smash (Charged Bomb dropping backward)
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
        set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_Y, -14);
        set_hitbox_value(AT_DSTRONG, 1, HG_WIDTH, 198);
        set_hitbox_value(AT_DSTRONG, 1, HG_HEIGHT, 48);
        set_hitbox_value(AT_DSTRONG, 1, HG_SHAPE, 1);
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

// Forward / Back Strong configuration: Grounded = Lane Bullet projectile; Aerial = Charged Bomb dropping to side
if (attack == AT_FSTRONG) {
    if (free) {
        // Aerial Left & Right Bomb Smash: face the direction pressed (Left or Right) so she drops the bomb to that side
        if (left_strong_pressed || (spr_dir == -1 && (strong_pressed || strong_down))) {
            spr_dir = -1;
        } else if (right_strong_pressed || (spr_dir == 1 && (strong_pressed || strong_down))) {
            spr_dir = 1;
        }

        set_attack_value(AT_FSTRONG, AG_CATEGORY, 1);
        set_attack_value(AT_FSTRONG, AG_SPRITE, sprite_get("fstrong"));
        set_attack_value(AT_FSTRONG, AG_AIR_SPRITE, sprite_get("fstrong"));
        set_attack_value(AT_FSTRONG, AG_NUM_WINDOWS, 4);
        set_attack_value(AT_FSTRONG, AG_HAS_LANDING_LAG, 1);
        set_attack_value(AT_FSTRONG, AG_LANDING_LAG, 8);
        set_attack_value(AT_FSTRONG, AG_STRONG_CHARGE_WINDOW, 1);
        set_attack_value(AT_FSTRONG, AG_HURTBOX_SPRITE, sprite_get("fstrong_hurt"));
        set_attack_value(AT_FSTRONG, AG_HURTBOX_AIR_SPRITE, sprite_get("fstrong_hurt"));
        set_attack_value(AT_FSTRONG, AG_USES_CUSTOM_GRAVITY, 1);

        set_window_value(AT_FSTRONG, 1, AG_WINDOW_LENGTH, 12);
        set_window_value(AT_FSTRONG, 1, AG_WINDOW_ANIM_FRAMES, 8);
        set_window_value(AT_FSTRONG, 1, AG_WINDOW_ANIM_FRAME_START, 0);
        set_window_value(AT_FSTRONG, 1, AG_WINDOW_CUSTOM_GRAVITY, 0);
        set_window_value(AT_FSTRONG, 1, AG_WINDOW_HAS_SFX, 1);
        set_window_value(AT_FSTRONG, 1, AG_WINDOW_SFX, sound_get("snd_bombfall"));

        set_window_value(AT_FSTRONG, 2, AG_WINDOW_LENGTH, 6);
        set_window_value(AT_FSTRONG, 2, AG_WINDOW_ANIM_FRAMES, 2);
        set_window_value(AT_FSTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 9);
        set_window_value(AT_FSTRONG, 2, AG_WINDOW_CUSTOM_GRAVITY, 0);
        set_window_value(AT_FSTRONG, 2, AG_WINDOW_HAS_SFX, 1);
        set_window_value(AT_FSTRONG, 2, AG_WINDOW_SFX, sound_get("snd_bomb"));

        set_window_value(AT_FSTRONG, 3, AG_WINDOW_LENGTH, 6);
        set_window_value(AT_FSTRONG, 3, AG_WINDOW_ANIM_FRAMES, 2);
        set_window_value(AT_FSTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 11);
        set_window_value(AT_FSTRONG, 3, AG_WINDOW_CUSTOM_GRAVITY, 0);

        set_window_value(AT_FSTRONG, 4, AG_WINDOW_LENGTH, 9);
        set_window_value(AT_FSTRONG, 4, AG_WINDOW_ANIM_FRAMES, 3);
        set_window_value(AT_FSTRONG, 4, AG_WINDOW_ANIM_FRAME_START, 13);
        set_window_value(AT_FSTRONG, 4, AG_WINDOW_CUSTOM_GRAVITY, 0);
        set_window_value(AT_FSTRONG, 4, AG_WINDOW_HAS_WHIFFLAG, 1);

        set_num_hitboxes(AT_FSTRONG, 2);

        set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_TYPE, 1);
        set_hitbox_value(AT_FSTRONG, 1, HG_WINDOW, 3);
        set_hitbox_value(AT_FSTRONG, 1, HG_LIFETIME, 6);
        set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_X, 66);
        set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_Y, -49);
        set_hitbox_value(AT_FSTRONG, 1, HG_WIDTH, 46);
        set_hitbox_value(AT_FSTRONG, 1, HG_HEIGHT, 103);
        set_hitbox_value(AT_FSTRONG, 1, HG_SHAPE, 1);
        set_hitbox_value(AT_FSTRONG, 1, HG_PRIORITY, 3);
        set_hitbox_value(AT_FSTRONG, 1, HG_DAMAGE, 4);
        set_hitbox_value(AT_FSTRONG, 1, HG_ANGLE, 45);
        set_hitbox_value(AT_FSTRONG, 1, HG_BASE_KNOCKBACK, 7);
        set_hitbox_value(AT_FSTRONG, 1, HG_KNOCKBACK_SCALING, 0.8);
        set_hitbox_value(AT_FSTRONG, 1, HG_BASE_HITPAUSE, 10);
        set_hitbox_value(AT_FSTRONG, 1, HG_HITPAUSE_SCALING, 0.6);
        set_hitbox_value(AT_FSTRONG, 1, HG_VISUAL_EFFECT, 304);
        set_hitbox_value(AT_FSTRONG, 1, HG_VISUAL_EFFECT_Y_OFFSET, -10);
        set_hitbox_value(AT_FSTRONG, 1, HG_HIT_SFX, sound_get("snd_hurt1"));
        set_hitbox_value(AT_FSTRONG, 1, HG_HIT_LOCKOUT, 10);

        set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_TYPE, 1);
        set_hitbox_value(AT_FSTRONG, 2, HG_WINDOW, 3);
        set_hitbox_value(AT_FSTRONG, 2, HG_LIFETIME, 6);
        set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_X, 70);
        set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_Y, -33);
        set_hitbox_value(AT_FSTRONG, 2, HG_WIDTH, 160);
        set_hitbox_value(AT_FSTRONG, 2, HG_HEIGHT, 29);
        set_hitbox_value(AT_FSTRONG, 2, HG_SHAPE, 1);
        set_hitbox_value(AT_FSTRONG, 2, HG_PRIORITY, 3);
        set_hitbox_value(AT_FSTRONG, 2, HG_DAMAGE, 4);
        set_hitbox_value(AT_FSTRONG, 2, HG_ANGLE, 45);
        set_hitbox_value(AT_FSTRONG, 2, HG_BASE_KNOCKBACK, 7);
        set_hitbox_value(AT_FSTRONG, 2, HG_KNOCKBACK_SCALING, 0.8);
        set_hitbox_value(AT_FSTRONG, 2, HG_BASE_HITPAUSE, 10);
        set_hitbox_value(AT_FSTRONG, 2, HG_HITPAUSE_SCALING, 0.6);
        set_hitbox_value(AT_FSTRONG, 2, HG_VISUAL_EFFECT, 304);
        set_hitbox_value(AT_FSTRONG, 2, HG_VISUAL_EFFECT_Y_OFFSET, -10);
        set_hitbox_value(AT_FSTRONG, 2, HG_HIT_SFX, sound_get("snd_hurt1"));
        set_hitbox_value(AT_FSTRONG, 2, HG_HIT_LOCKOUT, 10);
    } else {
        // Grounded FStrong: Lane Bullet Projectile (anti-spam scaling & 7-second lockout)
        if (fstrong_lockout > 0) {
            fstrong_hud_nudge = 8;
            attack = AT_NO_ATTACK;
        } else {
            set_attack_value(AT_FSTRONG, AG_CATEGORY, 0);
            set_attack_value(AT_FSTRONG, AG_SPRITE, sprite_get("fair"));
            set_attack_value(AT_FSTRONG, AG_AIR_SPRITE, sprite_get("fair"));
            set_attack_value(AT_FSTRONG, AG_NUM_WINDOWS, 3);
            set_attack_value(AT_FSTRONG, AG_HAS_LANDING_LAG, 3);
            set_attack_value(AT_FSTRONG, AG_STRONG_CHARGE_WINDOW, 1);
            set_attack_value(AT_FSTRONG, AG_HURTBOX_SPRITE, sprite_get("fair_hurt"));
            set_attack_value(AT_FSTRONG, AG_HURTBOX_AIR_SPRITE, sprite_get("fair_hurt"));
            set_attack_value(AT_FSTRONG, AG_USES_CUSTOM_GRAVITY, 0);

            set_window_value(AT_FSTRONG, 1, AG_WINDOW_LENGTH, 8);
            set_window_value(AT_FSTRONG, 1, AG_WINDOW_ANIM_FRAMES, 3);
            set_window_value(AT_FSTRONG, 1, AG_WINDOW_ANIM_FRAME_START, 0);
            set_window_value(AT_FSTRONG, 1, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
            set_window_value(AT_FSTRONG, 1, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.15);
            set_window_value(AT_FSTRONG, 1, AG_WINDOW_HAS_SFX, 1);
            set_window_value(AT_FSTRONG, 1, AG_WINDOW_SFX, sound_get("snd_smallswing"));
            set_window_value(AT_FSTRONG, 1, AG_WINDOW_SFX_FRAME, 4);

            set_window_value(AT_FSTRONG, 2, AG_WINDOW_LENGTH, 4);
            set_window_value(AT_FSTRONG, 2, AG_WINDOW_ANIM_FRAMES, 1);
            set_window_value(AT_FSTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 3);
            set_window_value(AT_FSTRONG, 2, AG_WINDOW_HAS_SFX, 1);
            set_window_value(AT_FSTRONG, 2, AG_WINDOW_SFX, sound_get("snd_pink_throw"));
            set_window_value(AT_FSTRONG, 2, AG_WINDOW_SFX_FRAME, 1);

            set_window_value(AT_FSTRONG, 3, AG_WINDOW_LENGTH, 12);
            set_window_value(AT_FSTRONG, 3, AG_WINDOW_ANIM_FRAMES, 2);
            set_window_value(AT_FSTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 4);
            set_window_value(AT_FSTRONG, 3, AG_WINDOW_HAS_WHIFFLAG, 1);

            set_num_hitboxes(AT_FSTRONG, 2);

            // Anti-spam scaling: base 5 damage stepping down by 1 each cast (5 -> 4 -> 3 -> 2 -> 1)
            var b_dmg = 5;
            var b_size = 28;
            var b_spr = sprite_get("lane_bullet");
            var b_mask = sprite_get("lane_bullet_mask");
            var b_spd = 4.2;
            var b_life = 13;
            var m_dmg = 3;
            var m_w = 32;
            var m_h = 44;

            if (fstrong_fatigue == 1) {
                b_dmg = 4;
                b_size = 28;
                b_spr = sprite_get("lane_bullet");
                b_mask = sprite_get("lane_bullet_mask");
                b_spd = 4.0;
                b_life = 13;
                m_dmg = 2;
                m_w = 30;
                m_h = 40;
            } else if (fstrong_fatigue == 2) {
                b_dmg = 3;
                b_size = 20;
                b_spr = sprite_get("lane_bullet_small");
                b_mask = sprite_get("lane_bullet_small_mask");
                b_spd = 3.8;
                b_life = 12;
                m_dmg = 2;
                m_w = 26;
                m_h = 36;
            } else if (fstrong_fatigue == 3) {
                b_dmg = 2;
                b_size = 16;
                b_spr = sprite_get("lane_bullet_tiny");
                b_mask = sprite_get("lane_bullet_tiny_mask");
                b_spd = 3.5;
                b_life = 11;
                m_dmg = 1;
                m_w = 22;
                m_h = 30;
            } else if (fstrong_fatigue >= 4) {
                b_dmg = 1;
                b_size = 14;
                b_spr = sprite_get("lane_bullet_tiny");
                b_mask = sprite_get("lane_bullet_tiny_mask");
                b_spd = 3.2;
                b_life = 10;
                m_dmg = 1;
                m_w = 20;
                m_h = 28;
            }

            // Hitbox 1: Lane Bullet short-ranged projectile (20% knockback, smaller hitbox, shorter range)
            set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_TYPE, 2);
            set_hitbox_value(AT_FSTRONG, 1, HG_WINDOW, 2);
            set_hitbox_value(AT_FSTRONG, 1, HG_LIFETIME, b_life);
            set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_X, 36);
            set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_Y, -40);
            set_hitbox_value(AT_FSTRONG, 1, HG_WIDTH, b_size);
            set_hitbox_value(AT_FSTRONG, 1, HG_HEIGHT, b_size);
            set_hitbox_value(AT_FSTRONG, 1, HG_PRIORITY, 3);
            set_hitbox_value(AT_FSTRONG, 1, HG_DAMAGE, b_dmg);
            set_hitbox_value(AT_FSTRONG, 1, HG_ANGLE, 45);
            set_hitbox_value(AT_FSTRONG, 1, HG_BASE_KNOCKBACK, 0.9); // 20% of 4.5
            set_hitbox_value(AT_FSTRONG, 1, HG_KNOCKBACK_SCALING, 0.08); // 20% of 0.4
            set_hitbox_value(AT_FSTRONG, 1, HG_BASE_HITPAUSE, 4);
            set_hitbox_value(AT_FSTRONG, 1, HG_HITPAUSE_SCALING, 0.1);
            set_hitbox_value(AT_FSTRONG, 1, HG_VISUAL_EFFECT, 301);
            set_hitbox_value(AT_FSTRONG, 1, HG_HIT_SFX, sound_get("snd_damage"));
            set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_SPRITE, b_spr);
            set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_MASK, b_mask);
            set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_ANIM_SPEED, 0.25);
            set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_HSPEED, b_spd);
            set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_VSPEED, 0);
            set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_GRAVITY, 0);
            set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
            set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_GROUND_FRICTION, 0);
            set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_WALL_BEHAVIOR, 0);
            set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_IS_TRANSCENDENT, 1);

            // Hitbox 2: Close wand swing melee hit (20% knockback, smaller hitbox)
            set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_TYPE, 1);
            set_hitbox_value(AT_FSTRONG, 2, HG_WINDOW, 2);
            set_hitbox_value(AT_FSTRONG, 2, HG_LIFETIME, 3);
            set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_X, 26);
            set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_Y, -44);
            set_hitbox_value(AT_FSTRONG, 2, HG_WIDTH, m_w);
            set_hitbox_value(AT_FSTRONG, 2, HG_HEIGHT, m_h);
            set_hitbox_value(AT_FSTRONG, 2, HG_PRIORITY, 2);
            set_hitbox_value(AT_FSTRONG, 2, HG_DAMAGE, m_dmg);
            set_hitbox_value(AT_FSTRONG, 2, HG_ANGLE, 45);
            set_hitbox_value(AT_FSTRONG, 2, HG_BASE_KNOCKBACK, 0.8); // 20% of 4.0
            set_hitbox_value(AT_FSTRONG, 2, HG_KNOCKBACK_SCALING, 0.04); // 20% of 0.2
            set_hitbox_value(AT_FSTRONG, 2, HG_BASE_HITPAUSE, 4);
            set_hitbox_value(AT_FSTRONG, 2, HG_HIT_SFX, sound_get("snd_hurt1"));
        }
    }
}

// Neutral A (Kiss with Heart): Roll for Crit (25% base chance, +5% in Tier 2/3) and apply corresponding hitbox stats
if (attack == AT_JAB) {
    var eff_crit_chance = jab_crit_chance;
    if (doki_tier >= 2) {
        eff_crit_chance += 5; // Tier 2+ bonus: 30% Crit chance!
    }
    var crit_roll = random_func((get_gameplay_time() + player * 7) % 25, 100, true);
    jab_is_crit = (crit_roll < eff_crit_chance);

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
// Down Taunt (holding Down on stick/c-stick, crouching, or Secondary Taunt button) = tongue out with snd_pink_gasp (AT_TAUNT_2).
// Up, Left, Right, and Neutral taunts = laughing taunt (AT_TAUNT).
if (attack == AT_TAUNT || attack == AT_TAUNT_2) {
    var has_down = (attack == AT_TAUNT_2 || down_down || down_pressed || down_stick_down || down_hard_pressed || state == PS_CROUCH || is_down_taunt);
    if (up_down) {
        has_down = false;
    }
    is_down_taunt = has_down;
    if (has_down) {
        attack = AT_TAUNT_2;
    } else {
        attack = AT_TAUNT;
    }
}

user_event(13);

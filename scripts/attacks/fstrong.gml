// Ground Left and Right Smash (AT_FSTRONG): Chargeable single-hit Wand & Lane Bullet Burst (10 uncharged -> 17 full charge, standard fighter smash power, overcharge hurts Pink)
set_attack_value(AT_FSTRONG, AG_SPRITE, sprite_get("fair"));
set_attack_value(AT_FSTRONG, AG_NUM_WINDOWS, 3);
set_attack_value(AT_FSTRONG, AG_HAS_LANDING_LAG, 3);
set_attack_value(AT_FSTRONG, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_FSTRONG, AG_HURTBOX_SPRITE, sprite_get("fair_hurt"));

// Window 1: Charge up (Pink raises arms; flashes before overcharging)
set_window_value(AT_FSTRONG, 1, AG_WINDOW_LENGTH, 10);
set_window_value(AT_FSTRONG, 1, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_FSTRONG, 1, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_FSTRONG, 1, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.15);
set_window_value(AT_FSTRONG, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSTRONG, 1, AG_WINDOW_SFX, sound_get("snd_smallswing"));
set_window_value(AT_FSTRONG, 1, AG_WINDOW_SFX_FRAME, 4);

// Window 2: Swing & short Lane Bullet burst matching wand swing animation
set_window_value(AT_FSTRONG, 2, AG_WINDOW_LENGTH, 4);
set_window_value(AT_FSTRONG, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FSTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(AT_FSTRONG, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSTRONG, 2, AG_WINDOW_SFX, sound_get("snd_pink_throw"));
set_window_value(AT_FSTRONG, 2, AG_WINDOW_SFX_FRAME, 1);

// Window 3: Follow-through / recovery
set_window_value(AT_FSTRONG, 3, AG_WINDOW_LENGTH, 12);
set_window_value(AT_FSTRONG, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_FSTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(AT_FSTRONG, 3, AG_WINDOW_HAS_WHIFFLAG, 1);

set_num_hitboxes(AT_FSTRONG, 1);

// Hitbox 1: Single Lane Bullet burst (~50% range of old 4.2 bullet, never double-hits)
set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_FSTRONG, 1, HG_WINDOW, 2);
set_hitbox_value(AT_FSTRONG, 1, HG_LIFETIME, 10);
set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_X, 28);
set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_Y, -42);
set_hitbox_value(AT_FSTRONG, 1, HG_WIDTH, 34);
set_hitbox_value(AT_FSTRONG, 1, HG_HEIGHT, 34);
set_hitbox_value(AT_FSTRONG, 1, HG_PRIORITY, 3);
set_hitbox_value(AT_FSTRONG, 1, HG_DAMAGE, 10);
set_hitbox_value(AT_FSTRONG, 1, HG_ANGLE, 42);
set_hitbox_value(AT_FSTRONG, 1, HG_BASE_KNOCKBACK, 6.8);
set_hitbox_value(AT_FSTRONG, 1, HG_KNOCKBACK_SCALING, 0.78);
set_hitbox_value(AT_FSTRONG, 1, HG_BASE_HITPAUSE, 8);
set_hitbox_value(AT_FSTRONG, 1, HG_HITPAUSE_SCALING, 0.55);
set_hitbox_value(AT_FSTRONG, 1, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_FSTRONG, 1, HG_HIT_SFX, sound_get("snd_damage"));
set_hitbox_value(AT_FSTRONG, 1, HG_HIT_LOCKOUT, 15);

set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_SPRITE, sprite_get("lane_bullet"));
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_MASK, sprite_get("lane_bullet_mask"));
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_ANIM_SPEED, 0.25);
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_HSPEED, 3.6);
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_VSPEED, 0);
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_GRAVITY, 0);
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_GROUND_FRICTION, 0);
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_WALL_BEHAVIOR, 0);
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_IS_TRANSCENDENT, 0);

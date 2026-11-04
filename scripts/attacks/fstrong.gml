// Ground Left and Right Smash (AT_FSTRONG): Pink charges up and throws a short-ranged Lane Bullet projectile
set_attack_value(AT_FSTRONG, AG_SPRITE, sprite_get("fair"));
set_attack_value(AT_FSTRONG, AG_NUM_WINDOWS, 3);
set_attack_value(AT_FSTRONG, AG_HAS_LANDING_LAG, 3);
set_attack_value(AT_FSTRONG, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_FSTRONG, AG_HURTBOX_SPRITE, sprite_get("fair_hurt"));

// Window 1: Charge up (Pink raises arms)
set_window_value(AT_FSTRONG, 1, AG_WINDOW_LENGTH, 8);
set_window_value(AT_FSTRONG, 1, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_FSTRONG, 1, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_FSTRONG, 1, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.15);
set_window_value(AT_FSTRONG, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSTRONG, 1, AG_WINDOW_SFX, sound_get("snd_smallswing"));
set_window_value(AT_FSTRONG, 1, AG_WINDOW_SFX_FRAME, 4);

// Window 2: Swing & launch Lane Bullet
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

set_num_hitboxes(AT_FSTRONG, 2);

// Hitbox 1: Lane Bullet short-ranged projectile (minor damage, minor knockback)
set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_FSTRONG, 1, HG_WINDOW, 2);
set_hitbox_value(AT_FSTRONG, 1, HG_LIFETIME, 18);
set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_X, 42);
set_hitbox_value(AT_FSTRONG, 1, HG_HITBOX_Y, -42);
set_hitbox_value(AT_FSTRONG, 1, HG_WIDTH, 42);
set_hitbox_value(AT_FSTRONG, 1, HG_HEIGHT, 42);
set_hitbox_value(AT_FSTRONG, 1, HG_PRIORITY, 3);
set_hitbox_value(AT_FSTRONG, 1, HG_DAMAGE, 5);
set_hitbox_value(AT_FSTRONG, 1, HG_ANGLE, 45);
set_hitbox_value(AT_FSTRONG, 1, HG_BASE_KNOCKBACK, 4.5);
set_hitbox_value(AT_FSTRONG, 1, HG_KNOCKBACK_SCALING, 0.4);
set_hitbox_value(AT_FSTRONG, 1, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_FSTRONG, 1, HG_HITPAUSE_SCALING, 0.3);
set_hitbox_value(AT_FSTRONG, 1, HG_VISUAL_EFFECT, 301);
set_hitbox_value(AT_FSTRONG, 1, HG_HIT_SFX, sound_get("snd_damage"));

set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_SPRITE, sprite_get("lane_bullet"));
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_MASK, sprite_get("lane_bullet_mask"));
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_ANIM_SPEED, 0.25);
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_HSPEED, 6.5);
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_VSPEED, 0);
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_GRAVITY, 0);
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_GROUND_FRICTION, 0);
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_WALL_BEHAVIOR, 0);
set_hitbox_value(AT_FSTRONG, 1, HG_PROJECTILE_IS_TRANSCENDENT, 1);

// Hitbox 2: Close wand swing melee hit (links cleanly into bullet)
set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FSTRONG, 2, HG_WINDOW, 2);
set_hitbox_value(AT_FSTRONG, 2, HG_LIFETIME, 3);
set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_X, 26);
set_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_Y, -44);
set_hitbox_value(AT_FSTRONG, 2, HG_WIDTH, 48);
set_hitbox_value(AT_FSTRONG, 2, HG_HEIGHT, 60);
set_hitbox_value(AT_FSTRONG, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_FSTRONG, 2, HG_DAMAGE, 3);
set_hitbox_value(AT_FSTRONG, 2, HG_ANGLE, 45);
set_hitbox_value(AT_FSTRONG, 2, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_FSTRONG, 2, HG_KNOCKBACK_SCALING, 0.2);
set_hitbox_value(AT_FSTRONG, 2, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_FSTRONG, 2, HG_HIT_SFX, sound_get("snd_hurt1"));

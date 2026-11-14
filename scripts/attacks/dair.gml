// Down Air / Her Down A (AT_DAIR): Chargeable downward Kitty throw that bounces on the ground and goes up (no freefall)
set_attack_value(AT_DAIR, AG_CATEGORY, 1);
set_attack_value(AT_DAIR, AG_SPRITE, sprite_get("dair"));
set_attack_value(AT_DAIR, AG_AIR_SPRITE, sprite_get("dair"));
set_attack_value(AT_DAIR, AG_NUM_WINDOWS, 3);
set_attack_value(AT_DAIR, AG_HAS_LANDING_LAG, 1);
set_attack_value(AT_DAIR, AG_LANDING_LAG, 5);
set_attack_value(AT_DAIR, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_DAIR, AG_HURTBOX_SPRITE, sprite_get("dair_hurt"));
set_attack_value(AT_DAIR, AG_HURTBOX_AIR_SPRITE, sprite_get("dair_hurt"));
set_attack_value(AT_DAIR, AG_USES_CUSTOM_GRAVITY, 1);

// Window 1: Wind-up & Charge in air
set_window_value(AT_DAIR, 1, AG_WINDOW_LENGTH, 10);
set_window_value(AT_DAIR, 1, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DAIR, 1, AG_WINDOW_ANIM_FRAME_START, 0);
set_window_value(AT_DAIR, 1, AG_WINDOW_CUSTOM_GRAVITY, 0.28);

// Window 2: Throw Kitty downward toward the ground
set_window_value(AT_DAIR, 2, AG_WINDOW_LENGTH, 6);
set_window_value(AT_DAIR, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DAIR, 2, AG_WINDOW_ANIM_FRAME_START, 1);
set_window_value(AT_DAIR, 2, AG_WINDOW_CUSTOM_GRAVITY, 0.28);
set_window_value(AT_DAIR, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DAIR, 2, AG_WINDOW_SFX, sound_get("snd_pink_throw"));
set_window_value(AT_DAIR, 2, AG_WINDOW_SFX_FRAME, 1);

// Window 3: Follow-through (returns to normal air state, no freefall!)
set_window_value(AT_DAIR, 3, AG_WINDOW_LENGTH, 10);
set_window_value(AT_DAIR, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DAIR, 3, AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(AT_DAIR, 3, AG_WINDOW_CUSTOM_GRAVITY, 0.35);

set_num_hitboxes(AT_DAIR, 1);

set_hitbox_value(AT_DAIR, 1, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DAIR, 1, HG_WINDOW, 2);
set_hitbox_value(AT_DAIR, 1, HG_LIFETIME, 120);
set_hitbox_value(AT_DAIR, 1, HG_HITBOX_X, 12);
set_hitbox_value(AT_DAIR, 1, HG_HITBOX_Y, -8);
set_hitbox_value(AT_DAIR, 1, HG_WIDTH, 76);
set_hitbox_value(AT_DAIR, 1, HG_HEIGHT, 72);
set_hitbox_value(AT_DAIR, 1, HG_PRIORITY, 3);
set_hitbox_value(AT_DAIR, 1, HG_DAMAGE, 6);
set_hitbox_value(AT_DAIR, 1, HG_ANGLE, 80);
set_hitbox_value(AT_DAIR, 1, HG_BASE_KNOCKBACK, 6.5);
set_hitbox_value(AT_DAIR, 1, HG_KNOCKBACK_SCALING, 0.55);
set_hitbox_value(AT_DAIR, 1, HG_BASE_HITPAUSE, 7);
set_hitbox_value(AT_DAIR, 1, HG_HITPAUSE_SCALING, 0.35);
set_hitbox_value(AT_DAIR, 1, HG_HIT_SFX, sound_get("snd_hurt1"));

set_hitbox_value(AT_DAIR, 1, HG_PROJECTILE_SPRITE, sprite_get("cat"));
set_hitbox_value(AT_DAIR, 1, HG_PROJECTILE_MASK, sprite_get("cat"));
set_hitbox_value(AT_DAIR, 1, HG_PROJECTILE_ANIM_SPEED, 0.25);
set_hitbox_value(AT_DAIR, 1, HG_PROJECTILE_HSPEED, 2);
set_hitbox_value(AT_DAIR, 1, HG_PROJECTILE_VSPEED, 8.5);
set_hitbox_value(AT_DAIR, 1, HG_PROJECTILE_GRAVITY, 0.25);
set_hitbox_value(AT_DAIR, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 2);
set_hitbox_value(AT_DAIR, 1, HG_PROJECTILE_GROUND_FRICTION, 0);
set_hitbox_value(AT_DAIR, 1, HG_PROJECTILE_WALL_BEHAVIOR, 0);

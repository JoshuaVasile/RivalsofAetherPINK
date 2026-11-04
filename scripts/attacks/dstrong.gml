// Down Smash: Grounded = Down Cry (multi-hit splash, 5 total dmg); Aerial = Charged Bomb (downward spike, 7 dmg)
// Default values setup (grounded Down Cry by default)
set_attack_value(AT_DSTRONG, AG_CATEGORY, 0);
set_attack_value(AT_DSTRONG, AG_SPRITE, sprite_get("dstrong_cry"));
set_attack_value(AT_DSTRONG, AG_AIR_SPRITE, sprite_get("dstrong"));
set_attack_value(AT_DSTRONG, AG_NUM_WINDOWS, 3);
set_attack_value(AT_DSTRONG, AG_HAS_LANDING_LAG, 3);
set_attack_value(AT_DSTRONG, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_DSTRONG, AG_HURTBOX_SPRITE, sprite_get("dstrong_cry_hurt"));
set_attack_value(AT_DSTRONG, AG_HURTBOX_AIR_SPRITE, sprite_get("dstrong_hurt"));
set_attack_value(AT_DSTRONG, AG_USES_CUSTOM_GRAVITY, 0);

// Window 1: Tearing up & crouching (charge window)
set_window_value(AT_DSTRONG, 1, AG_WINDOW_TYPE, 1);
set_window_value(AT_DSTRONG, 1, AG_WINDOW_LENGTH, 10);
set_window_value(AT_DSTRONG, 1, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DSTRONG, 1, AG_WINDOW_ANIM_FRAME_START, 0);
set_window_value(AT_DSTRONG, 1, AG_WINDOW_CUSTOM_GRAVITY, 0);
set_window_value(AT_DSTRONG, 1, AG_WINDOW_HAS_SFX, 0);

// Window 2: Active Crying (streams of tears splash left & right)
set_window_value(AT_DSTRONG, 2, AG_WINDOW_TYPE, 1);
set_window_value(AT_DSTRONG, 2, AG_WINDOW_LENGTH, 20);
set_window_value(AT_DSTRONG, 2, AG_WINDOW_ANIM_FRAMES, 6);
set_window_value(AT_DSTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(AT_DSTRONG, 2, AG_WINDOW_CUSTOM_GRAVITY, 0);
set_window_value(AT_DSTRONG, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DSTRONG, 2, AG_WINDOW_SFX, sound_get("snd_pink_gasp"));
set_window_value(AT_DSTRONG, 2, AG_WINDOW_SFX_FRAME, 1);

// Window 3: Recovery back to standing
set_window_value(AT_DSTRONG, 3, AG_WINDOW_TYPE, 1);
set_window_value(AT_DSTRONG, 3, AG_WINDOW_LENGTH, 14);
set_window_value(AT_DSTRONG, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DSTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 8);
set_window_value(AT_DSTRONG, 3, AG_WINDOW_CUSTOM_GRAVITY, 0);
set_window_value(AT_DSTRONG, 3, AG_WINDOW_HAS_WHIFFLAG, 1);

set_num_hitboxes(AT_DSTRONG, 4);

// Multi-hit Ground Down Cry Hitboxes (1+1+1+2 = 5 total dmg)
set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_DSTRONG, 1, HG_WINDOW, 2);
set_hitbox_value(AT_DSTRONG, 1, HG_WINDOW_CREATION_FRAME, 4);
set_hitbox_value(AT_DSTRONG, 1, HG_LIFETIME, 4);
set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_X, 0);
set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_Y, -26);
set_hitbox_value(AT_DSTRONG, 1, HG_WIDTH, 104);
set_hitbox_value(AT_DSTRONG, 1, HG_HEIGHT, 48);
set_hitbox_value(AT_DSTRONG, 1, HG_SHAPE, 2);
set_hitbox_value(AT_DSTRONG, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_DSTRONG, 1, HG_DAMAGE, 1);
set_hitbox_value(AT_DSTRONG, 1, HG_ANGLE, 110);
set_hitbox_value(AT_DSTRONG, 1, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_DSTRONG, 1, HG_BASE_HITPAUSE, 4);
set_hitbox_value(AT_DSTRONG, 1, HG_EXTRA_HITPAUSE, 4);
set_hitbox_value(AT_DSTRONG, 1, HG_VISUAL_EFFECT, 28);
set_hitbox_value(AT_DSTRONG, 1, HG_VISUAL_EFFECT_Y_OFFSET, 8);
set_hitbox_value(AT_DSTRONG, 1, HG_HIT_SFX, sound_get("snd_hurt1"));
set_hitbox_value(AT_DSTRONG, 1, HG_ANGLE_FLIPPER, 7);

set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_DSTRONG, 2, HG_WINDOW, 2);
set_hitbox_value(AT_DSTRONG, 2, HG_WINDOW_CREATION_FRAME, 8);
set_hitbox_value(AT_DSTRONG, 2, HG_LIFETIME, 4);
set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_X, 0);
set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_Y, -26);
set_hitbox_value(AT_DSTRONG, 2, HG_WIDTH, 104);
set_hitbox_value(AT_DSTRONG, 2, HG_HEIGHT, 48);
set_hitbox_value(AT_DSTRONG, 2, HG_SHAPE, 2);
set_hitbox_value(AT_DSTRONG, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_DSTRONG, 2, HG_DAMAGE, 1);
set_hitbox_value(AT_DSTRONG, 2, HG_ANGLE, 110);
set_hitbox_value(AT_DSTRONG, 2, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_DSTRONG, 2, HG_BASE_HITPAUSE, 4);
set_hitbox_value(AT_DSTRONG, 2, HG_EXTRA_HITPAUSE, 4);
set_hitbox_value(AT_DSTRONG, 2, HG_VISUAL_EFFECT, 28);
set_hitbox_value(AT_DSTRONG, 2, HG_VISUAL_EFFECT_Y_OFFSET, 8);
set_hitbox_value(AT_DSTRONG, 2, HG_HIT_SFX, sound_get("snd_hurt1"));
set_hitbox_value(AT_DSTRONG, 2, HG_ANGLE_FLIPPER, 7);

set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_DSTRONG, 3, HG_WINDOW, 2);
set_hitbox_value(AT_DSTRONG, 3, HG_WINDOW_CREATION_FRAME, 12);
set_hitbox_value(AT_DSTRONG, 3, HG_LIFETIME, 4);
set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_X, 0);
set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_Y, -26);
set_hitbox_value(AT_DSTRONG, 3, HG_WIDTH, 104);
set_hitbox_value(AT_DSTRONG, 3, HG_HEIGHT, 48);
set_hitbox_value(AT_DSTRONG, 3, HG_SHAPE, 2);
set_hitbox_value(AT_DSTRONG, 3, HG_PRIORITY, 2);
set_hitbox_value(AT_DSTRONG, 3, HG_DAMAGE, 1);
set_hitbox_value(AT_DSTRONG, 3, HG_ANGLE, 110);
set_hitbox_value(AT_DSTRONG, 3, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_DSTRONG, 3, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_DSTRONG, 3, HG_EXTRA_HITPAUSE, 4);
set_hitbox_value(AT_DSTRONG, 3, HG_VISUAL_EFFECT, 28);
set_hitbox_value(AT_DSTRONG, 3, HG_VISUAL_EFFECT_Y_OFFSET, 8);
set_hitbox_value(AT_DSTRONG, 3, HG_HIT_SFX, sound_get("snd_hurt1"));
set_hitbox_value(AT_DSTRONG, 3, HG_ANGLE_FLIPPER, 7);

set_hitbox_value(AT_DSTRONG, 4, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 4, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_DSTRONG, 4, HG_WINDOW, 2);
set_hitbox_value(AT_DSTRONG, 4, HG_WINDOW_CREATION_FRAME, 16);
set_hitbox_value(AT_DSTRONG, 4, HG_LIFETIME, 4);
set_hitbox_value(AT_DSTRONG, 4, HG_HITBOX_X, 0);
set_hitbox_value(AT_DSTRONG, 4, HG_HITBOX_Y, -26);
set_hitbox_value(AT_DSTRONG, 4, HG_WIDTH, 104);
set_hitbox_value(AT_DSTRONG, 4, HG_HEIGHT, 48);
set_hitbox_value(AT_DSTRONG, 4, HG_SHAPE, 2);
set_hitbox_value(AT_DSTRONG, 4, HG_PRIORITY, 2);
set_hitbox_value(AT_DSTRONG, 4, HG_DAMAGE, 2);
set_hitbox_value(AT_DSTRONG, 4, HG_ANGLE, 65);
set_hitbox_value(AT_DSTRONG, 4, HG_BASE_KNOCKBACK, 7.5);
set_hitbox_value(AT_DSTRONG, 4, HG_KNOCKBACK_SCALING, 0.85);
set_hitbox_value(AT_DSTRONG, 4, HG_BASE_HITPAUSE, 9);
set_hitbox_value(AT_DSTRONG, 4, HG_HITPAUSE_SCALING, 0.45);
set_hitbox_value(AT_DSTRONG, 4, HG_VISUAL_EFFECT, 28);
set_hitbox_value(AT_DSTRONG, 4, HG_VISUAL_EFFECT_Y_OFFSET, 8);
set_hitbox_value(AT_DSTRONG, 4, HG_HIT_SFX, sound_get("snd_damage"));
set_hitbox_value(AT_DSTRONG, 4, HG_ANGLE_FLIPPER, 6);
